# Smack Touch Website Review

Static HTML review build for the Smack Touch storefront demo.

This repository is meant for:

- visual review
- interaction review
- theme handoff reference
- Shopify implementation planning

## Project Structure

- `index.html` - homepage
- `shop.html` - shop landing page
- `collection.html` - collection listing with quick add
- `product.html` - product detail page
- `assets/` - all local images, logos, posters, and videos
- `START - Windows.bat` - local preview launcher for Windows
- `START - Mac.command` - local preview launcher for macOS

## Review Links

- Repository review: GitHub repo URL
- Live preview: GitHub Pages URL after publish

## Local Preview

Recommended:

- Windows: double-click `START - Windows.bat`
- Mac: double-click `START - Mac.command`

This opens the site on:

`http://localhost:8765/index.html`

Why this matters:

- local servers are more reliable than opening raw `file://` HTML
- media and asset loading behave more like production

## Current Pages

### `index.html`

Purpose:

- announce brand direction
- show featured collections
- show bestsellers
- show reels, lookbook, reviews, and newsletter/footer areas

Key UI:

- mobile menu
- search overlay
- cart drawer
- reels modal

### `shop.html`

Purpose:

- show top-level shopping entry points first
- make `Hijabs` the main collection hub
- route into hijab-specific subcollections

Key UI:

- main categories grid
- hijab hub section
- search overlay
- cart drawer

### `collection.html`

Purpose:

- browse products in a collection context
- filter and quick add from the grid

Key UI:

- collection hero
- filter drawer
- cart drawer
- quick add
- search overlay

### `product.html`

Purpose:

- show full product gallery
- select color and size
- add to cart from PDP

Key UI:

- gallery with thumbs
- size guide modal
- cart drawer
- search overlay
- sticky mobile add-to-cart

## Interaction Coverage

The following controls are intended to work on every relevant page:

- mobile search button
- desktop search button
- mobile cart button
- desktop cart button
- cart drawer close button
- continue shopping button
- quick add on collection cards
- upsell add buttons inside cart drawer

## Design System

### Core Colors

- `--brown-deep`: `#1A130D`
- `--brown`: `#2E231C`
- `--brown-soft`: `#4A382A`
- `--brown-tint`: `#6B5544`
- `--beige`: `#C9AF93`
- `--beige-soft`: `#E2CDB3`
- `--beige-pale`: `#F5EBDD`
- `--cream`: `#FAF3E8`
- `--line`: `rgba(46,35,28,.12)`
- `--success`: `#5C7C5A`
- `--error`: `#B5564B`

### Radius

- `--radius-sm`: `6px`
- `--radius`: `12px`
- `--radius-lg`: `22px`

### Shadows

- `--shadow-sm`: `0 2px 8px rgba(46,35,28,.06)`
- `--shadow`: `0 8px 24px rgba(46,35,28,.10)`
- `--shadow-lg`: `0 16px 48px rgba(46,35,28,.15)`

## Fonts

### Prototype Fonts

- Display: `Cormorant Garamond`
- Body/UI: `Inter`
- Arabic: `Cairo`

### Fallbacks in Code

- Display fallback: `Times New Roman`, serif
- Body fallback: `Helvetica Neue`, `Arial`, sans-serif

### Shopify Handoff Note

For Shopify, keep this font direction:

- headings: `Cormorant Garamond`
- body UI: `Inter` if available in the chosen theme setup
- Arabic: `Cairo`

If `Inter` is not available in the final Shopify font stack, use the closest clean sans fallback already prepared in code:

- `Helvetica Neue`
- `Arial`
- generic `sans-serif`

## Shared UI Notes

### Cart Drawer

- used as the main add-to-cart confirmation surface
- includes free shipping progress
- includes quantity-based discount messaging
- includes upsell strip

### Mobile Upsell Cards

Mobile upsell cards were tightened so they do not feel oversized inside the cart drawer.

### Search Overlay

Search is an overlay pattern, not a separate page.

Current purpose:

- interaction review
- visual review
- navigation placeholder for future Shopify predictive search

## Text Rendering Fix

This build includes runtime normalization for legacy mojibake text such as:

- `â€”`
- `Â·`
- `âˆ’`
- broken Arabic labels

This was added so GitHub Pages renders cleaner while the static HTML remains reviewable.

## Shopify Implementation Notes

### Recommended Section Mapping

- homepage hero -> `sections/hero.liquid`
- featured collections -> `sections/featured-collections.liquid`
- featured products -> `sections/featured-products.liquid`
- tutorials/reels -> `sections/tutorials.liquid`
- reviews -> `sections/reviews.liquid`
- shop landing -> custom page template
- collection grid -> `main-collection-product-grid`
- product page -> `main-product`
- cart drawer -> theme drawer/snippet implementation
- search overlay -> predictive search drawer/modal

### Shopify Feature Mapping

- quick add with variants -> product form or drawer form
- cart drawer -> AJAX cart
- search overlay -> predictive search
- discount messaging -> theme/cart logic
- free shipping progress -> cart subtotal logic

### Important Theme Notes

- preserve beige/brown token system
- preserve mixed editorial + minimal typography feel
- preserve rounded controls and soft card edges
- preserve mobile-first hierarchy

## GitHub Update Workflow

After editing files locally:

```powershell
git add .
git commit -m "Describe your update"
git push
```

## Publishing Notes

### GitHub Pages

To publish:

1. push to `main`
2. open repo `Settings`
3. open `Pages`
4. choose `Deploy from a branch`
5. select `main`
6. select `/ (root)`
7. save

### If Reviewers Download the Repo

Tell them to:

1. download or clone the repo
2. extract if zipped
3. use the launcher scripts for best local preview

## Known Scope

This is a static demo build, not a full production commerce app.

That means:

- cart state is demo-level
- search is overlay UI, not live product search
- account links are placeholders
- checkout is visual only

## Recommended Next Steps

- verify GitHub Pages rendering on mobile
- review every page header button on device
- convert remaining shared UI into reusable Shopify snippets/sections
- decide final Shopify font availability before theme implementation
