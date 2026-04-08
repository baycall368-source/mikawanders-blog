# Session Handoff — mikawanders.blog

**Date:** 2026-04-08
**Session focus:** 5 new travel guide posts + image SEO audit

---

## What Was Done This Session

### 1. New Travel Guide Posts — 5 Added

Five new blog posts written and published to `src/content/blog/`:

| File | Title hook | eSIM bridge | Hero image |
|------|-----------|------------|------------|
| `bali-travel-guide.md` | "Bali is a cliche and I'm obsessed with it anyway" | `/best-esim-for/indonesia/` | `bali-travel-guide.webp` |
| `vietnam-travel-guide.md` | "Vietnam will ruin you for other countries" | Asia pillar | `vietnam-travel-guide.webp` |
| `taiwan-travel-guide.md` | "Taiwan quietly became my favourite country in Asia" | Asia pillar | `taiwan-travel-guide.webp` |
| `dubai-travel-guide.md` | "Four days in Dubai: the cynical traveller's guide" | `/best-esim-for/uae/` | `dubai-travel-guide.webp` |
| `cambodia-travel-guide.md` | "I watched the sun rise over Angkor Wat" | Asia pillar | `cambodia-travel-guide.webp` |

All hero images generated with the `travel-blog-scenery` skill (16:9, no character, landscape/landmark only). WebP format.

### 2. Hero Image Strategy Change

**Old approach:** Blog guide hero images used `mika-[country].jpg` generated with the character skill.
**New approach:** Blog guide hero images use the `travel-blog-scenery` skill — scenery only, no character. Filename pattern: `[slug].webp`.

`CLAUDE.md` updated to reflect this. The character (`mika-photo`) skill is now reserved for comparison posts only.

### 3. `heroImageAlt` Support Added

- `src/content.config.ts` — added `heroImageAlt: z.string().optional()` to blog schema
- `src/pages/blog/[...slug].astro` — destructures and passes `heroImageAlt` to layout
- `src/layouts/BlogPost.astro` — uses `heroImageAlt || title` for the `<img alt>` attribute

The 5 new posts all have explicit `heroImageAlt` values with the SEO keyword.

---

## What Needs to Be Done Next — HIGH PRIORITY

### Image SEO Audit — Filename + Alt Tag Fix

An audit of all 86 blog posts revealed that most existing travel guides fail on two SEO criteria:

**Problem 1: Filenames don't contain "travel guide"**

~37 country travel guide posts use `mika-[country].jpg` (e.g. `mika-argentina.jpg`). The country name is present but "travel guide" is not. Target pattern: `[country]-travel-guide.webp`.

**Problem 2: No `heroImageAlt` set on most posts**

82 of 86 posts have no `heroImageAlt` — the alt tag falls back to the creative H1 title (e.g. `"Argentina is a country that takes itself very seriously"`). The SEO keyword ("Argentina travel guide") is NOT present in the alt tag.

**Problem 3: Japan travel guide uses wrong image**

`japan-travel-guide.md` uses `best-esim-for-japan-fushimi-inari.webp` — an eSIM comparison image — as its hero. Needs its own `japan-travel-guide.webp`.

#### Full rename map — travel guides

For each post below: rename the image file to `[country]-travel-guide.webp` and set `heroImageAlt: "[Country] travel guide"`.

| Post slug | Current image | Target filename | Target alt tag |
|-----------|--------------|----------------|----------------|
| argentina-travel-guide | mika-argentina.jpg | argentina-travel-guide.webp | Argentina travel guide |
| australia-travel-guide | australia-travel-guide.jpg | australia-travel-guide.webp (already correct, convert to webp) | Australia travel guide |
| austria-travel-guide | mika-austria.jpg | austria-travel-guide.webp | Austria travel guide |
| belgium-travel-guide | mika-belgium.jpg | belgium-travel-guide.webp | Belgium travel guide |
| brazil-travel-guide | mika-brazil.jpg | brazil-travel-guide.webp | Brazil travel guide |
| canada-travel-guide | mika-canada.jpg | canada-travel-guide.webp | Canada travel guide |
| chile-travel-guide | mika-chile.jpg | chile-travel-guide.webp | Chile travel guide |
| china-travel-guide | mika-china.jpg | china-travel-guide.webp | China travel guide |
| colombia-travel-guide | mika-colombia.jpg | colombia-travel-guide.webp | Colombia travel guide |
| czech-republic-travel-guide | mika-czech-republic.jpg | czech-republic-travel-guide.webp | Czech Republic travel guide |
| denmark-travel-guide | mika-denmark.jpg | denmark-travel-guide.webp | Denmark travel guide |
| france-travel-guide | france-travel-guide.jpg | france-travel-guide.webp (already correct name, convert to webp) | France travel guide |
| germany-travel-guide | mika-germany.jpg | germany-travel-guide.webp | Germany travel guide |
| greece-travel-guide | mika-greece.jpg | greece-travel-guide.webp | Greece travel guide |
| hong-kong-travel-guide | mika-hong-kong.jpg | hong-kong-travel-guide.webp | Hong Kong travel guide |
| hungary-travel-guide | mika-hungary.jpg | hungary-travel-guide.webp | Hungary travel guide |
| india-travel-guide | mika-india.jpg | india-travel-guide.webp | India travel guide |
| indonesia-travel-guide | mika-indonesia.jpg | indonesia-travel-guide.webp | Indonesia travel guide |
| italy-travel-guide | mika-italy.jpg | italy-travel-guide.webp | Italy travel guide |
| japan-travel-guide | best-esim-for-japan-fushimi-inari.webp | japan-travel-guide.webp | Japan travel guide |
| kenya-travel-guide | mika-kenya.jpg | kenya-travel-guide.webp | Kenya travel guide |
| malaysia-travel-guide | mika-malaysia.jpg | malaysia-travel-guide.webp | Malaysia travel guide |
| mexico-travel-guide | mika-mexico.jpg | mexico-travel-guide.webp | Mexico travel guide |
| morocco-travel-guide | mika-morocco.jpg | morocco-travel-guide.webp | Morocco travel guide |
| nepal-travel-guide | mika-nepal.jpg | nepal-travel-guide.webp | Nepal travel guide |
| netherlands-travel-guide | mika-netherlands.jpg | netherlands-travel-guide.webp | Netherlands travel guide |
| new-zealand-travel-guide | mika-new-zealand.jpg | new-zealand-travel-guide.webp | New Zealand travel guide |
| norway-travel-guide | mika-norway.jpg | norway-travel-guide.webp | Norway travel guide |
| peru-travel-guide | mika-peru.jpg | peru-travel-guide.webp | Peru travel guide |
| philippines-travel-guide | mika-philippines.jpg | philippines-travel-guide.webp | Philippines travel guide |
| poland-travel-guide | mika-poland.jpg | poland-travel-guide.webp | Poland travel guide |
| portugal-travel-guide | mika-portugal.jpg | portugal-travel-guide.webp | Portugal travel guide |
| romania-travel-guide | mika-romania.jpg | romania-travel-guide.webp | Romania travel guide |
| saudi-arabia-travel-guide | mika-saudi-arabia.jpg | saudi-arabia-travel-guide.webp | Saudi Arabia travel guide |
| singapore-travel-guide | mika-singapore.jpg | singapore-travel-guide.webp | Singapore travel guide |
| south-africa-travel-guide | mika-south-africa.jpg | south-africa-travel-guide.webp | South Africa travel guide |
| south-korea-travel-guide | mika-south-korea.jpg | south-korea-travel-guide.webp | South Korea travel guide |
| spain-travel-guide | mika-spain.jpg | spain-travel-guide.webp | Spain travel guide |
| sweden-travel-guide | mika-sweden.jpg | sweden-travel-guide.webp | Sweden travel guide |
| switzerland-travel-guide | mika-switzerland.jpg | switzerland-travel-guide.webp | Switzerland travel guide |
| tanzania-travel-guide | mika-tanzania.jpg | tanzania-travel-guide.webp | Tanzania travel guide |
| thailand-travel-guide | thailand-travel-guide.jpg | thailand-travel-guide.webp (already correct name, convert to webp) | Thailand travel guide |
| tunisia-travel-guide | mika-tunisia.jpg | tunisia-travel-guide.webp | Tunisia travel guide |
| turkey-travel-guide | mika-turkey.jpg | turkey-travel-guide.webp | Turkey travel guide |
| uae-travel-guide | mika-uae.jpg | uae-travel-guide.webp | UAE travel guide |
| uk-travel-guide | mika-uk.jpg | uk-travel-guide.webp | UK travel guide |
| ukraine-travel-guide | mika-ukraine.jpg | ukraine-travel-guide.webp | Ukraine travel guide |
| usa-travel-guide | mika-usa.jpg | usa-travel-guide.webp | USA travel guide |

#### Travel tips posts — alt tags only (filenames already keyword-based)

These posts have correct filenames but need `heroImageAlt` added:

| Post slug | Target alt tag |
|-----------|---------------|
| backpacking-packing-list | Backpacking packing list |
| best-flight-price-tracker-apps | Best flight price tracker apps |
| best-travel-apps | Best travel apps |
| best-trip-planner-apps | Best trip planner apps |
| cross-country-road-trip-planning | Cross country road trip planning |
| digital-nomad-lifestyle | Digital nomad lifestyle |
| digital-nomad-packing-list | Digital nomad packing list |
| first-time-flying-tips | First time flying tips |
| flying-with-a-newborn | Flying with a newborn |
| how-to-avoid-jet-lag | How to avoid jet lag |
| how-to-become-a-digital-nomad | How to become a digital nomad |
| how-to-find-cheap-flights | How to find cheap flights |
| how-to-get-airport-lounge-access | How to get airport lounge access |
| how-to-travel-on-a-budget | How to travel on a budget |
| how-to-use-your-phone-abroad | How to use your phone abroad |
| international-travel-checklist | International travel checklist |
| international-travel-tips | International travel tips |
| one-bag-travel | One bag travel |
| packing-list-for-traveling-abroad | Packing list for traveling abroad |
| road-trip-checklist | Road trip checklist |
| road-trip-packing-list | Road trip packing list |
| solo-female-travel-tips | Solo female travel tips |
| solo-travel-tips | Solo travel tips |
| things-to-do-on-a-long-flight | Things to do on a long flight |
| tips-for-flying-with-anxiety | Tips for flying with anxiety |
| tips-for-traveling-internationally | Tips for traveling internationally |
| toiletries-packing-list | Toiletries packing list |
| travel-guide-vs-winging-it | Travel guide vs winging it |
| travel-photography-tips | Travel photography tips |
| travel-safety-tips | Travel safety tips |
| ultimate-packing-list | Ultimate packing list |
| what-can-you-bring-on-a-plane | What can you bring on a plane |
| what-to-bring-on-a-road-trip | What to bring on a road trip |
| what-to-pack-in-a-carry-on | What to pack in a carry-on |
| working-from-cafes-abroad | Working from cafes abroad |

#### Execution plan for next session

1. For each travel guide in the rename map:
   - Convert/copy the image to the new `.webp` filename (compress to max 1600px, quality 85)
   - Delete the old file
   - Update `heroImage` in frontmatter to the new path
   - Add `heroImageAlt` to frontmatter
2. For Japan: generate a new `japan-travel-guide.webp` using the scenery skill before renaming
3. For travel tips posts: add `heroImageAlt` only (filenames already correct)
4. Commit and merge to master

---

## Build Status Reference

- Phase 1 (Comparison Guides): COMPLETE
- Phase 2 (Blog Posts): COMPLETE — 48 country travel guides written
- Phase 3 (Pillar Pages): COMPLETE — 8/8 done
- Phase 4 (Hero Images): COMPLETE — all comparison guides + pillar pages
- Phase 5 (Infrastructure): COMPLETE — sitemap, robots.txt, internal linking
- Phase 6 (Travel Tips): COMPLETE — 35/35 posts written, all hero images added
- Phase 7 (New Travel Guides): COMPLETE — 5 new posts (Bali, Vietnam, Taiwan, Dubai, Cambodia)
- Phase 8 (Image SEO): PENDING — rename 48 travel guide images + add heroImageAlt to 83 posts

**Current page count: ~153**

---

## Key Decisions

- **Blog hero images:** `travel-blog-scenery` skill (scenery, no character). Filename: `[slug].webp`.
- **Comparison post hero images:** Pexels stock photos. Filename: `best-esim-for-[country]-[landmark].jpg`.
- **`mika-photo` skill:** Reserved for comparison posts only. Do NOT use for blog/travel guide heroes.
- **`heroImageAlt`:** All posts should have this set explicitly. Pattern: `"[Main keyword]"` (plain keyword phrase, not a sentence).

---

## Routing Reference

| Content Type | Route Pattern | Page File |
|-------------|--------------|-----------|
| Comparison guides | `/best-esim-for/[slug]/` | `src/pages/best-esim-for/[...slug].astro` |
| Blog posts | `/blog/[slug]/` | `src/pages/blog/[...slug].astro` |
| Pillar pages | `/blog/[slug]/` | `src/pages/blog/[...slug].astro` (same catch-all) |

**Never use `/comparisons/[slug]/` in links.** That path doesn't exist.
