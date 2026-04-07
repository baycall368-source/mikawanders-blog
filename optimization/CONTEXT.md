# Optimization Workspace

Last updated: 2026-03-27

## What This Workspace Is

SEO optimization for mikawanders.blog using NeuronWriter. Upstream: `/content/` (draft posts). Downstream: back to `/content/` (optimized drafts move to final/).

---

## What to Load

| Task | Load These | Skip These |
|------|-----------|------------|
| Run NW gap analysis | The draft content file, NW terms from `neuronwriter/` | REFERENCES.md |
| Optimize content | The draft + NW term lists | Competitor files |
| Verify optimization | The optimized file only | Everything else |

---

## Folder Structure

```
optimization/
├── CONTEXT.md          ← You are here
├── neuronwriter/       ← NW recommendation exports ([country]-nw-terms.json)
└── seo-reports/        ← Gap analysis reports ([country]-gap-report.md)
```

---

## The Process

1. **Fetch NW recommendations** — Use NeuronWriter API via browser JS (project: `bcc20b873b2410bc`). Save terms to `neuronwriter/[country]-nw-terms.json`
2. **Run gap analysis** — Count every basic, extended, and entity term against the draft content
3. **Optimize** — Weave missing terms into the content naturally. Priority: basic terms > entity terms > extended terms > PAA questions
4. **Verify** — Re-run gap analysis. Target: 0 missing terms across all three lists
5. **Save report** to `seo-reports/[country]-gap-report.md`
6. **Return optimized content** to `/content/` for humanizer pass

---

## Skills & Tools

| Skill / Tool | When to Use | How |
|-------------|-------------|-----|
| /neuronwriter-seo | **For every comparison post.** | Fetch terms via API, run gap analysis, optimize |
| /humanizer | **After SEO optimization, before final.** | Remove AI patterns from the optimized text |

---

## What NOT to Do

- **Don't skip the verification step** — always re-run the gap analysis after optimization
- **Don't force terms unnaturally** — if a term genuinely can't fit, note it in the report
- **Don't create new NW queries without asking** — check existing queries first
