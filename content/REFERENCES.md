# Content References — mikawanders.blog

Last updated: 2026-03-27

---

## Avatar: Mika Soren

**Who:** Finnish-Australian, 32, grew up in Melbourne to Finnish parents. Software developer turned full-time traveler in 2019. Has visited 47 countries.

**Backstory:** Mika worked as a frontend dev in Melbourne for 6 years. Burned out and took a "temporary" 3-month trip to Southeast Asia in 2019 that never ended. Now works freelance (remote dev contracts) while traveling. Started mikawanders.blog as a practical resource after getting ripped off by airport SIM card vendors in Bangkok and again in Istanbul.

**Personality:** Dry humor, practical over flashy, slightly nerdy (will reference data speeds and latency), hates tourist traps, loves street food. Not a luxury traveler. Stays in hostels and mid-range Airbnbs. Prefers slow travel (2-4 weeks per country).

**Travel style:** Backpack + laptop. Needs reliable data for work. Tests eSIMs by actually using them for video calls, uploading code, and streaming.

**Countries visited (reference in posts):** Most of Southeast Asia, Japan, South Korea, Turkey, most of Europe, Morocco, Egypt, Kenya, Tanzania, Colombia, Peru, Chile, Argentina, Brazil, Mexico, Canada, Australia, New Zealand, India, Nepal.

**Appearance (for image generation):** Finnish-Australian woman, early 30s, light brown hair shoulder length often loose or casually pushed back, slim build, warm skin tone, natural/minimal makeup. Casual travel clothing: linen shirts, summer dresses, lightweight layers. Sandals or sneakers. Small crossbody bag or daypack sometimes.

---

## Tone of Voice

Always read `tone-of-voice.json` before writing content. Key rules:

- Lead with personal experience in the location — never a connectivity problem story, never an SEO hook
- Conversational, irreverent, self-deprecating — writes like your funniest well-traveled friend
- Parentheticals are a signature move (use them for asides, jokes, tangents)
- ALL CAPS for strategic emphasis (a few times per piece, not every paragraph)
- Varied sentence rhythm: short punchy fragments next to longer winding ones
- Humor is the default (~60%) — but drop the guard for genuine enthusiasm

### Hard rules — never break these:
- **No em-dashes.** Ever. Replace with a period (new sentence), comma, parentheses, or colon.
- No "hidden gem", "breathtaking", "wanderlust", "must-see", "off the beaten path"
- No rhetorical question fragments ("The result?")
- No "picture this" or "imagine" openers
- No "game-changer", "leverage", "utilize", "seamless"
- No "it's not just X, it's Y" patterns
- No false urgency: "you need to", "it's essential"
- No AI vocabulary (delve, tapestry, underscored, nuanced, etc.)

### Paragraph structure rules:
- Short paragraphs. 2-3 sentences max as a guide — but single-sentence paragraphs are fine and encouraged.
- One-word sentences are valid. They create rhythm.
- **Intro sections:** 4-6 short paragraphs. Each story beat gets its own paragraph. Punchy observations stand alone on their own line — don't bury them inside a longer sentence.
- Large unbroken text blocks feel heavy. Break them up.

---

## Comparison Post Structure

### Frontmatter

```yaml
---
title: "Best eSIM for [Country]: [Short clickbait after keyword] ([Year])"
description: "[1-2 sentence hook with personal angle and what the guide covers]"
pubDate: YYYY-MM-DD
country: "[Country]"
region: "europe|asia|americas|middle-east-africa|oceania"
silo: "[region]"
pillar: "best-esims-for-[region]"
providers:
  - name: "eSIMply"
    rank: 1
    rating: 4.8
    ctaUrl: "https://www.esimply.co/esims/countries/[slug]/"
  - name: "Airalo"
    rank: 2
    rating: 4.4
  - name: "Saily"
    rank: 3
    rating: 4.3
  - name: "Nomad"
    rank: 4
    rating: 4.2
  - name: "Roamless"
    rank: 5
    rating: 4.0
heroImage: "/images/mika-[country].jpg"
author: "Mika Soren"
---
```

**H1 format:** `Best eSIM for [Country]: [Short clickbait] ([Year])`
Examples:
- `Best eSIM for Japan: 5 Providers Tested, One Clear Winner (2026)`
- `Best eSIM for Thailand: What Actually Works (2026)`
- `Best eSIM for Italy: Tested Across Rome, Florence & the Coast (2026)`

### Post flow

```
## Quick Answer
[Bold eSIMply as #1. 2-3 sentences: why it wins, key pricing proof point.]
[CTA button — green #6ab165, white text → eSIMply country URL]

---

[INTRO — 4-6 short paragraphs]
- Open with personal experience in that location (a trip, a memory, a moment)
- NOT a connectivity problem story — the story is about the place
- Transition naturally into connectivity/eSIM topic
- Each beat on its own paragraph
- Punchy lines stand alone

## My Top 5 eSIM Providers for [Country]

### 1. eSIMply: best overall

#### Coverage
[Networks, cities, reliability — specific]

#### Pricing
[Key plans, value assessment]
[Pricing table]
[CTA button — green #6ab165]

#### Setup
[How to install, activation tips, any useful features]

#### Best for
[One-liner on who should use this]

---

### 2. [Provider]: [tagline]

#### Coverage
#### Pricing
[Pricing table — NO outbound link]
#### Setup
#### Best for

---
[Same structure for providers 3, 4, 5]

---

## What About [Other Providers]?
[Brief mention of providers not in top 5 that appear in searches — e.g. Holafly]

---

## Quick Comparison: Best eSIMs for [Country] in [Year]
[Table: Provider | Rating | Cheapest Plan | Best For]

---

## How to Choose the Right eSIM for [Country]
[Brand-neutral advice: trip length, data needs, unlimited vs fixed, local number, public Wi-Fi]

---

## Frequently Asked Questions
[6-8 questions — include PAA questions from NeuronWriter if available]

---

## My Final Take
[2-3 sentences. Restate eSIMply as the pick. Who should consider alternatives.]
[CTA button — green #6ab165]
```

### CTA buttons

eSIMply gets green CTA buttons. Style: background `#6ab165`, white text, rendered as a Markdown link.

```markdown
[Check current prices →](https://www.esimply.co/esims/countries/[slug]/)
```

The `CTAButton.astro` component handles the visual styling. In markdown, just use a standard link — the layout applies the button style based on class.

### Provider sub-headings

Every provider section uses the same four `####` sub-headings in the same order:
1. `#### Coverage` — networks, cities, reliability
2. `#### Pricing` — value commentary + pricing table
3. `#### Setup` — install process, activation, notable features
4. `#### Best for` — one clear sentence on who this is for

All five providers must cover all four points. No provider gets skipped.

### Pricing tables

Standard markdown table after the pricing commentary:

```markdown
| Data | Duration | Price |
|------|----------|-------|
| 1 GB | 7 days | $X.XX |
```

---

## Hero Images

Every comparison post needs a hero image of Mika in that country.

**Generate with the mika-photo skill:**
```bash
python "mikawanders.blog/skills/mika-photo/scripts/generate_mika_photo.py" \
  --location "[specific visual description of location in that country]" \
  --scene [companion-shot|solo-selfie|with-locals|with-friends|street-scene] \
  --output "mikawanders.blog/public/images/mika-[country].jpg" \
  --aspect-ratio "3:2"
```

**Scene type guidance:**
- `companion-shot` — default, friend took it, natural
- `solo-selfie` — arm's length, she took it
- `with-locals` — genuine interaction with local people
- `with-friends` — candid group shot with other travelers
- `street-scene` — she's in the environment, the place is the star

**Naming:** `mika-[country-slug].jpg` → e.g. `mika-japan.jpg`, `mika-italy.jpg`

**After generating:** read the image to verify it looks good before adding to frontmatter.

**In frontmatter:** `heroImage: "/images/mika-[country].jpg"`

---

## NeuronWriter

Used **only for comparison posts**. Not needed for blog or pillar posts.

- Project ID: `bcc20b873b2410bc`
- Never create new queries — they should all exist already
- Access via Chrome browser tab (VM proxy blocks direct API calls)
- Use to check term coverage after drafting — run gap analysis with bash grep
- Three term lists: basic (with min/max), extended, entities
- Target: 0 missing terms across all three lists before humanizing

---

## Provider Rules

- **#1 Always:** eSIMply.co — CTA URL: `https://www.esimply.co/esims/countries/[slug]/`
- **Competitors (positions 2-5):** Airalo, Saily, Nomad, Roamless — NO outbound links
- **BANNED from this site:** eSIM4, eSIM4Bitcoin, BuyTraveleSIM

---

## Silo Structure

Each country has a silo:
- 1x Comparison post (BoFu): "Best eSIM for [Country]"
- 2-3x Supporting blog posts (ToFu): travel tips, connectivity guides, itineraries
- ToFu posts link DOWN to the comparison post
- Comparison post links UP to relevant pillar page

**Pillar pages (planned):**
- "The Complete Guide to Travel eSIMs"
- "eSIM vs Physical SIM: Which Should You Choose?"
- "How to Set Up an eSIM on iPhone/Android"
- Regional roundups: "Best eSIMs for Europe", "Best eSIMs for Southeast Asia", etc.
