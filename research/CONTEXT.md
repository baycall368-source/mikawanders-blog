# Research Workspace

Last updated: 2026-03-27

## What This Workspace Is

Keyword research and competitor analysis for mikawanders.blog. Upstream: nothing (this is where work starts). Downstream: feeds into `/content/` with keyword targets and competitor gaps.

---

## What to Load

| Task | Load These | Skip These |
|------|-----------|------------|
| Find keywords for a country | `REFERENCES.md` | Nothing |
| Analyze competitor content | `REFERENCES.md`, competitor SERP data | Pricing files |
| Check NeuronWriter queries | Nothing — use NW API directly | Everything |

---

## Folder Structure

```
research/
├── CONTEXT.md          ← You are here
├── REFERENCES.md       ← SEO strategy notes
├── keywords/           ← Country keyword files (best-esim-for-[slug]-kw.md)
└── competitors/        ← SERP analysis per country
```

---

## The Process

1. **Identify target keyword** — Primary: "Best eSIM for [Country]". Secondary: "eSIM [Country]", "[Country] eSIM plans", "travel SIM [Country]"
2. **Check NeuronWriter** — Use `/list-queries` on eSIM4 project (`bcc20b873b2410bc`) to find existing query. If none, flag for creation.
3. **Pull SERP data** — Note top 10 competitors, their word counts, content angles
4. **Document gaps** — What are competitors missing? What questions aren't answered?
5. **Save to keywords/** — One file per country with primary KW, secondary KWs, NW query ID, content angle

---

## Skills & Tools

| Skill / Tool | When to Use | How |
|-------------|-------------|-----|
| NeuronWriter SEO | **Before writing any content.** Get term lists for the target keyword. | Use `/list-queries` then `/get-query` via browser JS. Project: `bcc20b873b2410bc` |
| DataForSEO | **When checking search volume or SERP competition.** | Use `/keyword-research` or `/serp-analysis` commands |

---

## What NOT to Do

- **Don't create NeuronWriter queries without asking** — they cost credits
- **Don't research competitors that are our own brands** — eSIM4, eSIM4Bitcoin, BuyTraveleSIM are off-limits for this site
- **Don't skip the NeuronWriter check** — every comparison post needs NW data before writing
