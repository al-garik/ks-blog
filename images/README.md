# Images & brand assets

Site-wide visual assets. All of them are derived from the KeyStat brand-package;
do not hand-draw replacements.

- `favicon/` — icon set: `favicon.svg/png` (K+S tile), `favicon.ico` (16/32/48),
  `apple-touch-icon.png` (180), `icon-192.png`, `icon-512.png`.
- `brand/` — locked SVG lockups with the baked background rectangle stripped
  (required on colored surfaces):
  - `logo-navbar-en.svg` — navbar wordmark (white KEY / orange STAT on navy),
    rendered at 42px height (stem cap ~24px).
  - `ks-tile-light.svg` — KS tile icon used by the navbar below 576px width.
  - `logo-footer-en-dark.svg` — full footer lockup (wordmark + descriptor),
    shown at fixed 200px width via CSS.

## Rules
- Never re-typeset the logo; use these files as-is.
- Never stretch, shadow, gradient or rotate the marks.
- Keep aspect ratios: size only one dimension per lockup (height for navbar,
  width for footer).

Post-specific images live in each post folder (`posts/YYYY-MM-DD-slug/images/`).
