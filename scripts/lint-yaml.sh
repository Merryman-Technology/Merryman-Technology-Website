#!/bin/bash
# Lints YAML config files and front matter in all Markdown files.
set -e

if ! command -v yamllint > /dev/null 2>&1; then
    echo "Error: yamllint is not installed. Run: brew install yamllint"
    exit 1
fi

ERRORS=0
CONFIG="$(dirname "$0")/../.yamllint.yaml"

echo "==> Linting hugo.toml"
# hugo.toml is TOML, not YAML — skip it. Nothing to lint here.
echo "    (skipped — hugo.toml is TOML)"

echo ""
echo "==> Linting front matter in content/"
# Note: archetypes are excluded — they contain Hugo Go template syntax ({{ .Name }})
# which is intentionally not valid YAML and cannot be linted.

while IFS= read -r file; do
    frontmatter=$(awk '/^---/{if(++n==2)exit; next} n==1{print}' "$file")
    if [ -n "$frontmatter" ]; then
        if ! echo "$frontmatter" | yamllint --config-file "$CONFIG" -; then
            echo "    ^ error in: $file"
            echo ""
            ERRORS=$((ERRORS + 1))
        fi
    fi
done < <(find content -name "*.md" | sort)

echo ""
if [ "$ERRORS" -gt 0 ]; then
    echo "Found YAML errors in $ERRORS file(s)."
    exit 1
fi

echo "All YAML is valid."
