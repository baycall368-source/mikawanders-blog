# Content Workspace — mikawanders.blog

Last updated: 2026-03-27

---

## What to Load Before Writing

| Task | Load These |
|------|-----------|
| Write comparison post | `REFERENCES.md` + `tone-of-voice.json` + `/Pricing/[Country] Pricing.txt` |
| Write pillar page | `REFERENCES.md` + `tone-of-voice.json` |
| Write blog post | `REFERENCES.md` + `tone-of-voice.json` |
| Edit existing content | `REFERENCES.md` + the file |
| Generate hero image | `skills/mika-photo/SKILL.md` |
| SEO check | NeuronWriter (comparison posts only) |

---

## Comparison Post Workflow

### Step 1 — Pricing data
Load `/Pricing/[Country] Pricing.txt`. This is the source of truth for all plan prices. Never fabricate pricing.

### Step 2 — NeuronWriter (comparison posts only)
Fetch the existing query for this country from NeuronWriter project `bcc20b873b2410bc`.
- Access via Chrome browser tab (VM proxy blocks direct HTTPS)
- Never create new queries — they already exist
- Extract: basic terms (with min/max counts), extended terms, entities, PAA questions
- Use PAA questions for the FAQ section

### Step 3 — Write the draft
Follow the structure in `REFERENCES.md` exactly:
- H1: `Best eSIM for [Country]: [Clickbait] ([Year])`
- Quick Answer at the top (before the intro)
- Intro: 4-6 short paragraphs, personal story about the location, segue into eSIM topic
- Provider sections: each has `#### Coverage` / `#### Pricing` / `#### Setup` / `#### Best for`
- All 5 providers cover all 4 sub-headings
- Pricing tables for all providers
- CTA buttons for eSIMply only (green `#6ab165`, white text)

### Step 4 — Gap analysis
Run bash grep to check term coverage against NW basic, extended, and entity lists.
Fix until 0 missing terms.

### Step 5 — Hero image
Generate with the mika-photo skill. See `REFERENCES.md` → Hero Images section.
- Pick a location that's specific and visual
- Choose scene type based on the country/post feel
- Read the generated image to verify before saving to frontmatter

### Step 6 — Humanizer
Run `/humanizer` on the full post before saving to `src/content/comparisons/`.

### Step 7 — Save
File goes to: `src/content/comparisons/[country-slug].md`
Naming: `france.md`, `spain.md`, `japan.md` etc.

---

## Writing Rules (non-negotiable)

- **No em-dashes.** Ever. Use a period, comma, parentheses, or colon instead.
- **Short paragraphs.** Single-sentence paragraphs are fine and encouraged.
- **Intro structure:** Each beat on its own paragraph. Punchy lines stand alone.
- **Open with the place**, not a connectivity problem.
- **Tone:** See `tone-of-voice.json`. Conversational, irreverent, self-deprecating.
- **eSIMply is always #1.** Give it the most detailed review. Always.

---

## File Locations

| Content type | Save to |
|-------------|---------|
| Comparison posts | `src/content/comparisons/[slug].md` |
| Blog posts | `src/content/blog/[slug].md` |
| Pillar pages | `src/content/pillars/[slug].md` |
| Hero images | `public/images/mika-[country].jpg` |
| Pricing data | `Pricing/[Country] Pricing.txt` |

---

## Provider Rules

- **#1 Always:** eSIMply.co — `https://www.esimply.co/esims/countries/[slug]/`
- **Competitors (2-5):** Airalo, Saily, Nomad, Roamless — no outbound links
- **Never include:** eSIM4, eSIM4Bitcoin, BuyTraveleSIM

---

## Skills

| Skill | When | Command |
|-------|------|---------|
| `mika-photo` | Every comparison post needs a hero image | `python skills/mika-photo/scripts/generate_mika_photo.py` |
| `humanizer` | Before every post goes live | `/humanizer` |
| `neuronwriter-seo` | Comparison posts only — gap analysis | Via Chrome browser tab |
| `esim-pricing-lookup` | When pricing data is missing or outdated | Skill tool |
