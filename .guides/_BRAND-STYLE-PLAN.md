# Blog style guide — key points

Brand system: KeyStat brand-book. Two brand colors only: Navy `#02254F` + Orange `#F06E30`.

## Palette
- Navy `#02254F`: headings, body links' hover targets, navbar, dark plates, rules.
- Footer background: `#071a34`; page background: Paper `#FAFAF8`; body text: Ink `#16202E`.
- Secondary text: Muted `#4D5D70`; hairlines/borders: Navy tints `#CCD3DC` / `#E6E9ED`.
- Links: Info Blue `#0B6A95`, hover Navy `#051F41`.
- Orange as a GRAPHIC (rules, bullets, active markers) in `#F06E30`.
- Orange as TEXT only in `#AB522B` (inline strong accents); bright orange text is allowed
  only at display sizes (>=24px).
- No other hues anywhere (no greens/purples/teals from framework defaults).

## Typography
- Inter only, self-hosted variable 400–800 from `fonts/`; no external font services.
- Body 16px, line-height 1.5–1.6; hard floor for any text: 11px.
- Sizes come from the modular scale (tokens `--t-11..--t-30`, display clamp to `--t-37`);
  never a bare one-off px/rem.
- Headings sentence case: h1 700 / -0.030em (fluid), h2 800 / -0.018em, h3+h4 700.

## Logo & marks
- Locked SVG kit files only (`images/brand/`, `images/favicon/`), background-rect stripped
  for colored surfaces. Never re-typeset, stretch, shadow, gradient or rotate the mark.
- Navbar: white wordmark (KEY white / STAT orange), stem cap ~24px; below 576px the wordmark
  is replaced by the KS tile icon (min mark size 16px respected) — the lockup is never squeezed.
- Footer: full lockup, fixed width 200px, via CSS background (markdown images in the footer
  config do not get depth-rebased and 404 inside posts).

## Components
- Navbar: solid Navy, no gradients/shadows; links N50, active white + orange bottom marker.
- Hero: solid Navy plate, white Inter title, orange graphic rule; no stock photography.
- Lists in content: 7px orange square markers (the brand bullet), never plain dots.
- Post cards: featured image inset from card edges (never flush), title 18px/700,
  category chips 11px navy-on-Navy50 (chips must stay subordinate to the title).
- Code blocks: Paper background, 1px Navy100 hairline, radius 6px; long lines and wide
  math scroll inside their block, never widen the page.
- Tables: header row Navy50 plate + 2px Navy rule; muted captions.
- Blockquote: 3px orange left rule, Muted text.

## Table of contents
- Desktop: sticky right column with own thin scrollbar (never scrolls off screen).
- Colors via the theme variables `$toc-color` / `$toc-active-border` / `$toc-inactive-border`
  (transparent rails + orange active rail + navy links); framework !important chains are not
  needed and must not be re-added.
- Archive depth: years+months open, post lists expand on click.
- Mobile (<992px): the sidebar stays hidden by the framework; the list is cloned into a
  "On this page" accordion right under the post title, capped at 55vh with internal scroll,
  closes after choosing a section. Never move the original sidebar node (it is an overlay
  layer by design and covers the article).

## Copy
- Visible brand word: "KeyStat". The legal entity name appears only in license/legal lines.
- No emoji in UI copy. RSS stays as a plain RSS feed; no third-party syndication links.

## Repo hygiene
- No non-underscore `.md/.qmd` in the project root — they render as public site pages;
  internal docs live in `.guides/`.
- Files in this repo are public: no hostnames, internal paths, machine names, ports,
  credentials, or process notes in any tracked file.

## Build & deploy
- Edit sources -> `quarto render` at the repo root (regenerates tracked `docs/`) ->
  commit sources and `docs/` together -> push `main` -> GitHub Pages serves `docs/`.
- Verify after changes: computed colors are brand tokens only; Inter loads from `fonts/`;
  no external requests (fonts/CDNs/syndication); mobile 390px: no horizontal overflow,
  navbar tile + burger, TOC accordion under the title.
