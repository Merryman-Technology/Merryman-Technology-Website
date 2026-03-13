# Website V1 Launch Plan

**Goal:** Get a professional placeholder for merrymantechnology.com live on Vercel.

**Status: COMPLETE** — Launched 2026-03-07.

---

## Copy

**Hero (full):**
> Thoughtful apps for Apple platforms. Built with intention, designed to solve real problems.

**Footer / meta description (short):**
> Thoughtful apps for Apple platforms.

---

## Stack

| Layer | Choice |
|---|---|
| Static site generator | Hugo (v0.150+, extended) |
| Hosting | Vercel (free tier) |
| Domain registrar | Hover |
| Email hosting | Fastmail |
| Mailing list | Buttondown (free up to 100 subscribers) — planned for V2 |

---

## Design Direction

Minimal, typographic, near-monochromatic. Single column. No decorative chrome. Inspired by: Chris Krycho, Chris Hannah, Daring Fireball, Ben Evans. Custom Hugo theme (not off-the-shelf) for a clean foundation.

Brand assets (logo, colors, fonts) are TBD — V1 uses a system font stack until brand is finalized.

---

## V1 Page Structure

Single page (`/`):

1. **Header** — "Merryman Technology" wordmark (text only for now)
2. **Hero** — Full tagline copy
3. **Footer** — Short tagline only (email deferred until hello@ is set up)

*Mailing list signup (Buttondown) deferred to V2.*

---

## Launch Checklist

### 1. Hugo Site — Build V1
- [x] Create custom minimal theme in `themes/merryman/`
- [x] Build single-page layout with hero + footer
- [x] Test locally with `hugo server --buildDrafts`
- [x] Verify production build with `hugo` (check `public/`)

### 2. Vercel — Account & Project Setup
- [x] Create account at vercel.com (sign up with GitHub — use the `merryman-technology` org)
- [x] Install Vercel GitHub App on the `merryman-technology` org
- [x] Import `Merryman-Technology-Website` repo as a new Vercel project
  - Framework preset: **Hugo**
  - Build command: `hugo --gc`
  - Output directory: `public`
  - Set environment variable: `HUGO_VERSION` = `0.150.0`
- [x] Confirm preview deploy succeeds on Vercel's `.vercel.app` URL

### 3. Custom Domain — Vercel + Hover
- [x] In Vercel project → Settings → Domains → Add `merrymantechnology.com`
- [x] Add DNS records in Hover (A record for apex, CNAME for www)
- [x] Wait for propagation
- [x] Verify SSL certificate is active in Vercel (automatic via Let's Encrypt)

### 4. Verify & Ship
- [x] Visit merrymantechnology.com — confirm site loads over HTTPS
- [x] Confirm site looks correct on mobile
