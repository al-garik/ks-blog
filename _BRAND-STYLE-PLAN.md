# ks-blog → Brand-book restyle plan (v1, 2026-10-17, agent: hermes/keystat)

HARD CONSTRAINT (owner, 17.10.2026): **no git commit / push** into this repo until the
restyled result is approved and finalized. Until then: source edits only in the working
tree (uncommitted), renders only in throwaway copies (zorin `/tmp/ksblog_*`), preview
served locally on mediaserver:8901, screenshots + computed-style gates.

## 0. How the blog is built (established facts)

- Quarto **website project** (blog), `type: website`, `output-dir: docs/`.
- Site is published as GitHub Pages **straight from the tracked `docs/` folder**
  (site-url `https://al-garik.github.io/ks-blog/`). No CI workflow exists; "deploy" =
  commit the regenerated `docs/` + push `main`.
- Theme: `cosmo` + `style.scss` (scss:defaults overrides + scss:rules).
- Chrome: navbar `background: primary` + `images/keystat-logo.svg`; listing grid on
  `index.qmd` (fields image/date/title/author/categories/description) + R-generated
  "All Posts" archive; RSS via `_metadata.yml`; search built in; `include-in-header:
  _includes/navbar-fix.html` (JS that repoints navbar title to Home).
- Authoring: posts in `posts/YYYY-MM-DD-slug/index.qmd` with YAML frontmatter; some
  posts execute R at render time (figures, `index_files/figure-html/`).
- Build machine: **zorin** has quarto 1.10.18 (same version baked into docs/ generator
  meta) + R 4.6.1. Executed chunks need: base, dplyr/tidyr/purrr/tibble/glue/digest/
  ggplot2/survival/patchwork (installed ✓) + **ksCompare, mice, expm, kstools** (missing ✗).

## 1. Non-compliance audit vs brand-book (skill keystat-brand-book)

Palette (all OFF-BRAND today):
- `#003d5c` teal-navy, `#0d5a7a` light-blue, `#FF8C00` accent orange, `#1a1a1a` black,
  `#f5f5f5/#e0e0e0` ad-hoc grays. Brand requires Navy `#02254F` + Orange `#F06E30`
  (+ fixed aux: Paper #FAFAF8, Ink #16202E, Muted #4D5D70, Steel #93A7D1 graphics-only,
  Info Blue #0B6A95 links-only) — "never introduce a 3rd brand hue", "no off-palette".

Chrome / logo:
- `images/keystat-logo.svg` is a hand-typeset "KEYSTAT" in Arial → forbidden ("logo
  never re-typeset — file only"). Navbar must carry a locked SVG lockup (EN kit 507
  dark on navy; wordmark fallback 521).
- Navbar gradient `linear-gradient(primary→light-blue)` + drop-shadow on the logo +
  `transform: scale(1.05)` hover → misuse NO list: non-proportional stretch, shadows/
  glow, off-palette blend.
- `favicon: images/favicon.png` referenced in `_quarto.yml` but FILE MISSING (404).
  Brand-package `favicon/` set is the only sanctioned source.
- Footer text "© 2026 KeyStat Solutions…" — display brand word is **KeyStat** (legal
  entity name only in реквизиты) → decision item D1.
- `hero-section` sits on stock photo `images/background.png` (old blue-teal key/keyboard
  render) — off-palette imagery, busy bg; dark plate = Navy per brand → D3.
- Orange as link-hover/accent TEXT color (`$link-hover-color: #FF8C00`, `strong` accent
  rule `strong:has(+ em)`) → orange text forbidden below 24px; O700 `#ab522b` is the
  text-orange → replace.
- Radius/bullets/heading weights: cosmo defaults + ad-hoc; site-system uses Inter,
  modular scale `--t-11..--t-30`, brand-square orange bullets, h-weights 700/800/700.

## 2. Design token map (target)

| Role              | From (today)              | To (brand)                       |
|---                  |---                        |---                               |
| primary/nav/dark    | #003d5c / 90deg gradient | Navy500 #02254F, solid            |
| footer bg           | cosmo dark #222          | Navy900 #071a34                  |
| accent graphic      | #FF8C00                  | Orange500 #F06E30 (≥3:1 graphics) |
| accent text (any)   | #FF8C00                  | Orange700 #ab522b (5.1:1 on Paper)|
| dark-bg accent      | —                        | Orange300-400                    |
| links               | navy + orange hover      | Info Blue #0B6A95 (5.6:1), hover Navy700 #051f41 |
| body bg / ink       | #fff / inherited         | Paper #FAFAF8 / Ink #16202E      |
| muted text          | —                        | Muted #4D5D70 (6.7:1)            |
| surfaces/borders    | #f5f5f5 / #e0e0e0        | Navy50 #e6e9ed / Navy100 #ccd3dc |
| dark navbar fg      | #fff                     | N50/N100 #e6e9ed / #ccd3dc       |
| fonts               | cosmo system stack       | Inter (self-hosted variable, w400–800) + site fallbacks |
| body size           | bootstrap 1rem           | 16px, lh 1.5–1.6, floor 11px     |
| bullets             | disc                     | 7px Orange500 square, slight radius |

## 3. Implementation steps

- **S0 baseline**: copy tree → zorin `/tmp/ksblog_base`; render as-is; diff vs tracked
  `docs/` to see whether zorin reproduces the production build (figure drift = D5).
  Install missing R deps there only if cheap (ksCompare/kstools from crow16384
  r-universe, mice/expm CRAN); if kstools unavailable → document that full re-render
  belongs to the production machine (Igor's Windows box).
- **S1 assets**: from brand-package copy into repo: `favicon/` → `images/favicon/`
  (+favicon.png 48), `fonts/inter-variable-{latin,cyrillic}.woff2` + OFL license →
  `fonts/`, navbar kits `507-navbar-en-dark.svg` / `521-word-en-dark.svg` →
  `images/brand/`, footer `503-primary-en-dark.svg` → `images/brand/`. Remove Arial
  `keystat-logo.svg/png` usage.
- **S2 style.scss**: full rewrite onto tokens — scss:defaults (bootstrap vars),
  `@font-face` (note: url relative to each page → use `/ks-blog/…`-safe approach:
  data via Quarto `resources` + absolute-from-root not possible on /ks-blog/; resolve
  in S2 spike: either re-base `site-url` to project root + `relative-url: true`? or
  generate font CSS include; keep navbar lockup as SVG (font-free) per brand ruling),
  solid navy navbar (no gradient/shadow/scale), cosmo caps headings → per-role weights
  via `letter-spacing: text-transform: none` (D4), square bullets, O700 inline strongs,
  info-blue links, Paper bg, tables `th` bg Navy50 + bottom rule, code blocks on Paper
  w/ 1px Navy100 border + Navy50 left rule (drop orange 4px + #e0e0e0), card/listing
  hover = Orange500 border 1px + soft navy shadow, remove logo filter, hero per D3.
- **S3 _quarto.yml**: favicon path → images/favicon/favicon.png; page-footer text per
  D1/D2; navbar logo → brand svg (height so cap ≥20px); add `include-in-header` brand
  head tags if needed (apple-touch/theme-color); drop `background: primary` if cosmo
  primary maps cleanly anyway (keep, $primary=navy now).
- **S4 index.qmd / template**: hero block per D3; `featured-grid`/`featured-card` legacy
  classes — either adopt cleanly or strip from guide docs.
- **S5 docs sweep**: `_CUSTOMIZATION_GUIDE.qmd`, `_WRITING_GUIDE.md`, `_SETUP_COMPLETE.md`
  stale color/brand references updated to the token table.
- **S6 render+preview**: throwaway-copy render on zorin with changed tree; serve on
  mediaserver :8901; gates below; screenshots before/after.
- **S7 commit/push**: ONLY after Igor approval + finalization (then regenerate `docs/`
  in place, commit, push from zorin — credentials verified: repo is public + `gh`
  present on zorin).

## 4. Verification gates

1. hex-sweep: `grep -oE '#[0-9a-fA-F]{6}' style.scss docs/site_libs/bootstrap/*.css` →
   every hit is a brand token or ramp step (rule from brand-book audit §2).
2. computed-style census (browser): font sizes at 1440 = ramp steps ± clamp
   interpolations; colors of links/hovers/strongs = tokens; 0 Arial logo usage.
3. WCAG pairs: only precomputed §8 pairs used (body 15.7:1, links 5.6:1, O700 5.1:1,
   dark bg text N50).
4. navbar lockup: rendered cap-height ≥20px at 390..1440, never squeezed by flex
   (`flex:none`), no 3-line descriptor (SVG kit ⇒ immune).
5. favicon + Inter files 200 in preview (no 404s in console/network).
6. screenshots: index / one post / narrow 390px, vision pass for defects.

## 5. Decision points for the owner

- **D1 prose brand word**: replace visible "KeyStat Solutions" with "KeyStat" per the
  standing display-name ruling (incl. © line)? *Recommended: yes; entity stays only in
  license/legal text.*
- **D2 hero emoji**: remove "Made with ❤️ for the R community"? *Recommended: reword to
  "Made by KeyStat for the R community" — brand copy carries no emoji.*
- **D3 hero plate**: stock photo bg vs solid Navy500/700 plate with white Inter heading
  + orange graphic rule. *Recommended: navy plate; retire background.png (827 KB too).*
- **D4 cosmo heading style**: keep uppercase transformed headings (tracking per site
  rules) vs switch to sentence case. *Recommended: keep caps look but clean: caps labels
  tracking .05–.08em; real headings tracking per scale, weight h1 700 / h2 800 / h3+ 700.*
- **D5 build-of-record**: if zorin reproduces committed docs byte-tolerantly → zorin is
  build machine; else Igor re-renders on Windows before push. *Check in S0.*

## 6. Implementation status (2026-10-17, after owner D-answers)

Decisions locked: D1=yes (visible "KeyStat" everywhere, legal entity only in license/legal —
DONE incl. post author lines "… (KeyStat)"), D2=rewritten "Made by KeyStat for the R community",
D3/D4=mirror the company site (navy plate hero, sentence-case Inter headings h1 700/.030em,
h2 800/.018em) — ALL IMPLEMENTED in working tree (uncommitted).

Verified gates (preview = zorin throwaway render → docs_s1, served locally):
- computed-color audit: navbar #02254f solid, body #fafaf8/Inter, links #0b6a95, inline strong
  #ab522b (O700), tables th #e6e9ed + navy rule, footer #071a34, bullets = 7px orange squares,
  logo 42px box (cap ~24), mobile 390: title hidden, zero overflow, Google Fonts requests 0.
- Inter self-hosted (woff2 200 via quarto dependency copy), favicon/lockups all 200.
- hex sweep: visible usage = brand tokens only; residual foreign hexes are framework dead code
  (ansi console, about-* page styles, valuebox dashboard, mermaid, bs unused utilities) — same
  posture as main site (computed-style purged, grep residual documented).
- D5 ANSWER: zorin baseline render is NOT byte-identical to tracked docs/ (html/css-hash churn
  + 11/13 figures differ; docs/ shows two build eras) → production docs are built on the authors'
  machines; kstools post CANNOT be rebuilt on zorin (package unreleased).

PRE-PUSH BLOCKER (by design, per HARD CONSTRAINT): nothing committed. Finalization flow after
approval: regenerate docs/ on the build-of-record machine that has ALL deps (Windows/Igor: has
kstools? multiple-imputations post was built there) → commit sources+docs → push main (Pages).
Follow-up (optional, not style-breaking): old featured post-logo PNGs inside posts still carry
pre-brand artwork.

## 7. Round-2 owner feedback (17.10, all implemented + verified)

1. Grid cards: featured image inset via `.card-img-top` padding; category chips are
   `div.listing-category` (NOT .badge) → compact 11px chips with hover border.
2. Index/archive TOC: quarto hides `#TOC ul ul` until scrollspy activates ancestors (never on
   the archive) → force visible; sidebar pinned `sticky + max-height calc(100vh-85px) +
   overflow auto` (was scrolling off screen).
3. R-Bloggers fully removed: navbar item, r-bloggers.qmd, _R_BLOGGERS_GUIDE.md, per-post
   "originally published / Visit R-Bloggers" footers, template section; RSS kept as plain RSS
   (navbar rss icon, feed in _metadata.yml). Verified: 0 occurrences in rendered pages.
4. Mobile: <576px navbar swaps wordmark→KS tile icon (401 light, 34px) + title fits;
   ≤991px the page-columns grid crushes the margin track (TOC was 39px wide!) →
   `body #quarto-content.page-columns{display:block}` + TOC returns as bordered card after the
   article (41 links measured at 390px); wide MathJax matrices & long code scroll inside their
   blocks (`pre{overflow-x:auto}`, mjx-container rule) — docWidth==innerWidth, no page overflow.
   Build note: kstools 0.5.7 (+mice/expm/ksCompare) now installed in zorin site-library; zorin
   renders the FULL project in place (rc=0 incl. MI post + mianalyze subpage). docs/ regenerated
   in place, committed locally; still NO push until owner finalizes.

## 8. Round-3 owner feedback (17.10, implemented + verified)

1. TOC vertical rails removed (indent only). Active/inactive toc colors anchored with
   !important — quarto re-colors toc links through its own `--bs-link-color` (#2761e3 cosmo
   residue) at specificity we cannot outvote by order. Palette now: links Navy, hover Navy700,
   active O700.
2. Archive tree default depth = years+months (4th-level post lists hidden); clicking a month
   (or year) row toggles its subtree (`.toc-open`, wired in `_includes/toc-fold.html`).
3. Mobile TOC: no giant section — JS wraps the list into `<details>` "On this page ▾"
   (390px: 23px tall closed card, opens in place).
4. Card hierarchy: listing title t-18 700 vs category chips t-11 with tight padding
   (19.1px vs 11.05px measured); image inset kept.

## 9. Round-4 (TOC rails root-cause + mobile gutters)

ROOT CAUSE of "vertical stripes": quarto.css puts `border-left:1px solid` (translucent gray)
on EVERY `#TOC a.nav-link` with zero left padding — the stripes were per-LINK, not per-list
(earlier rail removal only killed MY ul borders; scan of all `#TOC a` found 40 gray rails).
Fix: transparent 2px rail reserved on all toc links + .65rem text gap; only the active item
paints its rail orange → no stripes when inactive, marker never glued to letters, text never
shifts on scrollspy. Verified: 41 links, distinct borders = {2px transparent, 2px orange},
visible rails = 1 (active), gap = 11px.
Sidebar scrollbar styled slim-brand (6px navy-100) — the raw OS bar read as another stripe.
Mobile gutters: the ≤991px `display:block` had killed quarto's grid gutters (content l=0) →
restored `padding-inline: clamp(1rem,4vw,1.75rem)` (measured 17px both sides, no overflow).
deploy-safety: 0 root-absolute asset refs in all built pages (all relative, quarto rebase by
depth; site-url /ks-blog/ == Pages basepath). file:// preview differs only because browsers
forbid fetch(search.json) there — layout/assets fine.

## 10. Round-5 (mobile toc overlay root-cause + compact footer)

The mobile "kasha": in DOM, `#quarto-margin-sidebar` comes BEFORE `#quarto-document-content`
(grid areas hid this on desktop; block layout exposed it) — the TOC card sat at the top of the
article at z-index:1020, and expanding it covered/pushed the article start. Fix: mobile container
becomes `display:flex; flex-direction:column` with `order:1` article / `order:2` toc; toc forced
`position:static; z-index:auto`, capped at 55vh with its own thin scrollbar. Verified: post and
index mobile — tocTop ≥ articleBottom (overlap 0), no h-scroll; desktop sticky sidebar unchanged.

Footer: compact (padding 1.25/1rem, height 126px desktop vs ~200 before; lockup 250→200px),
bg = company site's --navy-900 #071a34 (already identical, now noted), © moved to the RIGHT
column under "Made by KeyStat for the R community"; left column keeps only the lockup via
::before (content &nbsp; to preserve the grid cell).

## 11. Round-6 (mobile fold placement follow-up)

After the order fix the fold sat at the very end of a ~50k-px mobile article = owner read it as
"disappeared". Now on ARTICLE pages the script relocates the folded card to right after
#title-block-header (title → byline/chips → "On this page ▾" → body), auto-closes on picking a
section; index/archive keeps the card at the end. Desktop layout untouched (guard: only
page-layout-article + matchMedia ≤991). Verified: hdr(79) < toc(463) < first section(850),
expanded 481px no overlap, index atEnd=true, desktop sticky right sidebar unchanged.
