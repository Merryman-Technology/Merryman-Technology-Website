# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Source for merrymantechnology.com — built with [Hugo](https://gohugo.io/) (v0.150+, extended). Solo Apple platform development company (owner: Blake Merryman).

## GitHub

- **Org:** `merryman-technology`
- **Repo:** `Merryman-Technology-Website` (public)
- **Issue tracking:** GitHub Issues + org-level GitHub Project ("Merryman Technology Roadmap")

## Common Commands

```bash
# Start dev server (with drafts)
hugo server --buildDrafts

# Build for production
hugo

# Create new content
hugo new content <section>/<filename>.md

# Create a new theme
hugo new theme <themename>
```

## Project Structure

Hugo's standard layout applies:

- `hugo.toml` — site config (baseURL, title, theme)
- `content/` — Markdown content pages
- `layouts/` — HTML templates (overrides theme templates)
- `static/` — files copied verbatim to `/public` (fonts, favicons, etc.)
- `assets/` — files processed by Hugo Pipes (SCSS, JS, images)
- `themes/` — installed themes (prefer git submodules)
- `archetypes/` — frontmatter templates for `hugo new content`

The `public/` directory is gitignored — it is generated at build time.

## Theme

Custom minimal theme at `themes/merryman/`. Single-page layout: header wordmark, centered hero with tagline, footer with short tagline. All copy is driven by params in `hugo.toml`.
