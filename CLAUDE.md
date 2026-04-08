# Mika Wanders — mikawanders.blog

Personal travel blog by "Mika Soren" — a Finnish-Australian digital nomad traveling full-time since 2019. Reviews eSIM providers country-by-country. #1 pick is always eSIMply.co.

---

## Image Generation — STRICT RULES

**NEVER run `mika-photo` or `travel-photo` scripts for testing, verification, or demonstration purposes.**
Both scripts consume paid kie.ai credits (8 credits per image). Only invoke them when the user has explicitly requested an image for a specific page. Do not generate test images, example images, or "let me verify this works" images under any circumstances.

---

## START HERE

**Before doing any work, read `HANDOFF.md` in this directory.** It contains the latest session handoff with exactly what was completed, what's in progress, and what needs to be done next. Always check it first so you don't duplicate work or miss context.

---

## Tone of Voice

**ALWAYS read `tone-of-voice.json` before writing any content for this site.**

Location: `mikawanders.blog/tone-of-voice.json`

Quick rules:
- Lead with personal experience in the location — never a connectivity problem, never an SEO hook
- Conversational, irreverent, self-deprecating — your funniest well-traveled friend
- Parentheticals are a signature move (asides, jokes, tangents)
- ALL CAPS for strategic emphasis (a few times per piece, never every paragraph)
- Varied rhythm: short punchy fragments next to longer winding ones
- **No em-dashes. Ever.** Use a period, comma, parentheses, or colon instead.
- Avoid: hidden gem, breathtaking, wanderlust, must-see, off the beaten path, AI vocabulary
- Never sound like a tourism board, guidebook, or airline magazine

---

## Routing

| Task | Read First | Then |
|------|-----------|------|
| Write comparison post | `tone-of-voice.json` + `content/REFERENCES.md` | Load pricing file, fetch NW query |
| Write blog/pillar post | `tone-of-voice.json` + `content/REFERENCES.md` | — |
| Generate hero image | `skills/mika-photo/SKILL.md` | Run generate_mika_photo.py |
| SEO gap analysis | `optimization/CONTEXT.md` | NeuronWriter via Chrome tab |
| Check pricing | `Pricing/[Country] Pricing.txt` | — |
| Full comparison post workflow | `content/CONTEXT.md` | Follows all steps |

---

## Comparison Post — Build Checklist

Every comparison post follows this sequence:

1. **Pricing** — load `Pricing/[Country] Pricing.txt`
2. **NeuronWriter** — fetch existing query for the country (project `bcc20b873b2410bc`), never create new
3. **Write** — follow structure in `content/REFERENCES.md`
4. **Gap analysis** — bash grep against NW term lists, fix until 0 missing
5. **Hero image** — generate with `skills/mika-photo` skill, read to verify, add to frontmatter
6. **Humanize** — run `/humanizer` before publishing
7. **Save** — `src/content/comparisons/[country-slug].md`

---

## Comparison Post Structure (summary)

```
H1: Best eSIM for [Country]: [Clickbait] ([Year])

## Quick Answer        ← TOP, before the intro
[eSIMply summary + CTA button]

[INTRO — 4-6 short paragraphs]
[Personal story about the place → segue to eSIMs]

## My Top 5 eSIM Providers for [Country]

### 1. eSIMply: best overall
#### Coverage
#### Pricing   ← pricing table + CTA button (green #6ab165)
#### Setup
#### Best for

### 2-5. [Provider]: [tagline]
#### Coverage
#### Pricing   ← pricing table, NO outbound link
#### Setup
#### Best for

## Quick Comparison Table
## How to Choose the Right eSIM for [Country]
## FAQ
## My Final Take + CTA button
```

---

## Skills

| Skill | When to Use | How |
|-------|------------|-----|
| `travel-blog-scenery` | Blog/travel guide hero images — scenery only, no character | `skills/travel-blog-scenery-SKILL.md` |
| `mika-photo` | Comparison posts only — hero image with Mika | `python skills/mika-photo/scripts/generate_mika_photo.py` |
| `humanizer` | Every post before publishing | `/humanizer` skill |
| `neuronwriter-seo` | Comparison posts only — after first draft | Via Chrome browser tab |
| `esim-pricing-lookup` | When pricing data is missing/outdated | Skill tool |
| `gemini-imagegen` | One-off image needs | Via skill |

---

## Provider Config

- **#1 Provider:** eSIMply.co — rating 4.8/5
- **CTA URL:** `https://www.esimply.co/esims/countries/[country-slug]/`
- **CTA style:** green `#6ab165` background, white text
- **Competitors (no outbound links):** Airalo, Saily, Nomad, Roamless
- **BANNED from this site:** eSIM4, eSIM4Bitcoin, BuyTraveleSIM

---

## Images

| Image | Path | Notes |
|-------|------|-------|
| Mika avatar | `public/images/mika-avatar.jpg` | Used in header, footer, meta bar |
| Comparison hero images | `public/images/best-esim-for-[country]-[landmark].jpg` | Pexels stock photos |
| Blog hero images | `public/images/[country-slug]-travel-guide.webp` | Generated with travel-blog-scenery skill (no character) |

### Hero Image Rules

- **Source:** Use the `pexels-images` skill to find and download hero images for comparison guides.
- **Subject:** Always an iconic, instantly recognizable landmark for that country. Think postcard-level recognition: Christ the Redeemer for Brazil, Hallstatt for Austria, Sydney Opera House for Australia. Not beaches, not generic cityscapes.
- **Freshness:** Images must look like they were taken within the last year. If it looks faded, grainy, washed-out, or has an old film quality, skip it and find another.
- **Naming:** `best-esim-for-[country]-[short-landmark-description].jpg` (lowercase kebab-case).
- **Compression:** Always compress. `--compress --max-width 1600 --quality 85 --format jpg`.
- **Frontmatter:** `heroImage: "/images/best-esim-for-[country]-[landmark].jpg"`
- **Selection:** Pick the best image yourself and apply it. Don't present multiple options.
- **Uniqueness:** Every page must use a different hero image. Never reuse the same image file across multiple pages. Before assigning a hero image, check `public/images/` to confirm no other page is already using that file.

---

## File Locations

| Type | Location |
|------|---------|
| Comparison posts | `src/content/comparisons/[slug].md` |
| Blog posts | `src/content/blog/[slug].md` |
| Pillar pages | `src/content/pillars/[slug].md` |
| Hero images | `public/images/` |
| Pricing data | `Pricing/[Country] Pricing.txt` |
| Components | `src/components/` |
| Layouts | `src/layouts/` |
| Pages | `src/pages/` |

---

## Folder Structure

```
mikawanders.blog/
├── CLAUDE.md                    ← You are here
├── tone-of-voice.json           ← Read before writing anything
├── skills/
│   └── mika-photo/              ← Generate hero images of Mika
│       ├── SKILL.md
│       └── scripts/generate_mika_photo.py
├── content/
│   ├── CONTEXT.md               ← Full comparison post workflow
│   └── REFERENCES.md            ← Post structure, writing rules, image guide
├── research/
│   └── CONTEXT.md               ← Keyword research
├── optimization/
│   └── CONTEXT.md               ← NeuronWriter process
├── Pricing/                     ← Country pricing .txt files
└── src/
    ├── content/
    │   ├── comparisons/         ← Published comparison posts (.md)
    │   ├── blog/                ← Blog posts (.md)
    │   └── pillars/             ← Pillar pages (.md)
    ├── components/              ← Astro components
    ├── layouts/                 ← BaseLayout, ComparisonPost, BlogPost
    ├── pages/                   ← index.astro, about.astro, dynamic routes
    └── styles/                  ← global.css
```

---

## Naming Conventions

| Type | Pattern | Example |
|------|---------|---------|
| Comparison post | `[country-slug].md` | `japan.md` |
| Blog post | `[descriptive-slug].md` | `staying-connected-in-southeast-asia.md` |
| Pillar page | `[topic-slug].md` | `best-esims-for-europe.md` |
| Comparison hero image | `best-esim-for-[country]-[landmark].jpg` | `best-esim-for-brazil-christ-redeemer.jpg` |
| Blog hero image | `mika-[country-slug].jpg` | `mika-japan.jpg` |
| Pricing file | `[Country] Pricing.txt` | `Japan Pricing.txt` |
