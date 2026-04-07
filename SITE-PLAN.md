# mikawanders.blog — Complete Site Plan

## The Site

**Domain:** mikawanders.blog
**Tagline:** "Travel stories and tips from a full-time nomad"
**Framework:** Astro (static site, blog layout)
**Style:** Simple personal blog. Think Nomadic Matt meets a tech review. Clean typography, minimal design, no flashy comparison widgets. Just good writing with pricing tables.

---

## The Avatar: Mika Soren

**Age:** 32
**From:** Melbourne, Australia (Finnish parents)
**Background:** Former frontend developer. Worked at a Melbourne agency for 6 years. Burned out during COVID lockdowns. Took a "3-month trip" to Southeast Asia in 2019 that became permanent. Now works freelance remote dev contracts while traveling full-time.

**Why eSIMs:** Mika got ripped off buying a SIM card at Bangkok's Suvarnabhumi Airport in 2019 ($30 for 3GB). Then again in Istanbul ($25 for basically nothing). Started testing eSIMs as a cheaper, faster alternative. Needs reliable data for work (video calls, Git pushes, deploying code). This isn't casual browsing; Mika's income depends on connectivity.

**Travel style:** Backpack + laptop. Hostels and mid-range Airbnbs. Slow travel (2-4 weeks per country). Street food over restaurants. Avoids tourist traps. Prefers neighborhoods where locals actually live.

**Countries visited:** Most of SE Asia, Japan, South Korea, Turkey, most of Western and Central Europe, Morocco, Egypt, Kenya, Tanzania, Colombia, Peru, Chile, Argentina, Brazil, Mexico, Canada, Australia, NZ, India, Nepal.

**Voice:** Dry humor, practical, slightly nerdy. Will casually reference ping times and 4G bands. Not trying to impress anyone. Writes like they're explaining something to a friend at a hostel common room.

---

## #1 Provider: eSIMply.co

- **Rating:** 4.8/5
- **CTA URL:** https://www.esimply.co/esims/countries/[slug]/
- **Why #1:** Best balance of price, coverage, and app usability. Mika's go-to recommendation.
- **Has outbound CTA links:** Yes (only brand with links on this site)

## Competitors (Positions 2-5, NO outbound links)

| Position | Provider | Rating | Angle |
|----------|----------|--------|-------|
| 2 | Airalo | 4.4 | Most popular, widest country coverage |
| 3 | Saily | 4.3 | By NordVPN team, privacy-focused |
| 4 | Nomad | 4.2 | Good unlimited plans |
| 5 | Roamless | 4.0 | Pay-as-you-go flexibility |

**BANNED from this site:** eSIM4, eSIM4Bitcoin, BuyTraveleSIM

---

## Content Strategy

### Content Types

1. **Comparison Posts (BoFu)** — "Best eSIM for [Country]" — 50 posts, one per country
2. **Pillar Pages (MoFu)** — Broad guides that link to multiple comparison posts
3. **Blog Posts (ToFu)** — Travel tips, connectivity stories, destination guides that link down to comparison posts

### Content Ratio Target

- 50 comparison posts (the money pages)
- 8-10 pillar pages (the silo hubs)
- 40-60 blog posts (the traffic drivers)

---

## Silo Structure

### Silo 1: Europe (17 countries)
**Pillar:** "Best eSIMs for Traveling Europe"
**Comparison posts:** France, Spain, Italy, Germany, UK, Austria, Netherlands, Poland, Greece, Portugal, Czech Republic, Belgium, Romania, Sweden, Denmark, Norway, Switzerland, Hungary

**Supporting blog posts:**
- "How I Stay Connected Across Europe on One eSIM"
- "Eurotrip Packing List: The Digital Essentials"
- "WiFi vs eSIM in Europe: What Actually Works"
- "Schengen Travel Tips: Borders, Data, and SIM Cards"
- "My Favorite Coworking Spaces in Europe (and the WiFi Situation)"

### Silo 2: Asia (10 countries)
**Pillar:** "Best eSIMs for Traveling Asia"
**Comparison posts:** China, Thailand, Japan, Malaysia, Singapore, India, Hong Kong, Indonesia, South Korea, Philippines

**Supporting blog posts:**
- "The Great Firewall Problem: Getting Online in China"
- "Southeast Asia on a Budget: Connectivity Edition"
- "Japan's Pocket WiFi vs eSIM: Which One Wins?"
- "Digital Nomad Hubs in Asia and Their Internet Situation"
- "India's eSIM Restrictions: What Travelers Need to Know"

### Silo 3: Americas (8 countries)
**Pillar:** "Best eSIMs for the Americas"
**Comparison posts:** United States, Mexico, Canada, Brazil, Colombia, Peru, Argentina, Chile

**Supporting blog posts:**
- "Crossing Borders in South America: One eSIM or Many?"
- "US Road Trip Connectivity: eSIM Coverage State by State"
- "Mexico's Digital Nomad Scene and Staying Online"
- "Patagonia to Cartagena: My South America eSIM Experience"

### Silo 4: Middle East & Africa (8 countries)
**Pillar:** "Best eSIMs for Africa and the Middle East"
**Comparison posts:** Turkey, Saudi Arabia, UAE, Morocco, Tunisia, South Africa, Kenya, Tanzania

**Supporting blog posts:**
- "Safari Connectivity: Will Your eSIM Work in the Bush?"
- "Middle East Travel Tech: eSIMs, VPNs, and What's Blocked"
- "Morocco on a Shoestring: Staying Connected in the Medina"
- "Dubai vs Budget Destinations: Is the Same eSIM Enough?"

### Silo 5: Oceania & Misc (4 countries)
**Pillar:** "Best eSIMs for Australia, NZ, and the Pacific"
**Comparison posts:** Australia, New Zealand, Nepal, Iran

**Supporting blog posts:**
- "Outback Connectivity: Where eSIMs Actually Work in Australia"
- "New Zealand Campervan Trip: My eSIM Setup"
- "Iran Travel: Internet Restrictions and Workarounds"

### Cross-Silo Pillar Pages (link to all silos)
- "The Complete Guide to Travel eSIMs" (master pillar — links to everything)
- "eSIM vs Physical SIM Card: The Full Comparison"
- "How to Set Up an eSIM on iPhone and Android"
- "How Much Data Do You Actually Need When Traveling?"
- "What is an eSIM? A Simple Explanation for Travelers"

---

## Astro Site Structure

```
mikawanders.blog/
├── astro.config.mjs
├── package.json
├── public/
│   ├── favicon.svg
│   └── images/
│       ├── avatar-mika.jpg
│       └── countries/           ← Hero images per country
├── src/
│   ├── layouts/
│   │   ├── BaseLayout.astro     ← HTML shell, nav, footer
│   │   ├── BlogPost.astro       ← Blog/pillar post layout
│   │   └── ComparisonPost.astro ← eSIM comparison layout
│   ├── components/
│   │   ├── Header.astro
│   │   ├── Footer.astro
│   │   ├── PricingTable.astro   ← Reusable pricing table component
│   │   ├── ProviderCard.astro   ← Provider review card
│   │   ├── ComparisonTable.astro ← Side-by-side comparison
│   │   ├── CTAButton.astro      ← eSIMply CTA button
│   │   ├── FAQ.astro            ← Accordion FAQ component
│   │   └── Sidebar.astro        ← Blog sidebar (recent posts, categories)
│   ├── pages/
│   │   ├── index.astro          ← Homepage
│   │   ├── about.astro          ← Mika's story
│   │   ├── blog/
│   │   │   └── [...slug].astro  ← Dynamic blog post pages
│   │   └── best-esim-for/
│   │       └── [...slug].astro  ← Dynamic comparison pages
│   ├── content/
│   │   ├── config.ts            ← Content collection schemas
│   │   ├── comparisons/         ← Comparison .md files
│   │   ├── blog/                ← Blog post .md files
│   │   └── pillars/             ← Pillar page .md files
│   └── styles/
│       └── global.css           ← Simple, clean blog styles
└── tailwind.config.mjs          ← Minimal Tailwind config
```

### Frontmatter Schema (Comparison Posts)

```yaml
---
title: "Best eSIM for France: My Top 5 Picks After Testing"
description: "I tested 5 eSIM providers in France. Here's my honest ranking with real pricing and coverage details."
pubDate: 2026-03-27
updatedDate: 2026-03-27
country: "France"
region: "europe"
silo: "europe"
pillar: "best-esims-for-europe"
providers:
  - name: "eSIMply"
    rank: 1
    rating: 4.8
    ctaUrl: "https://www.esimply.co/esims/countries/france/"
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
heroImage: "/images/countries/france.jpg"
author: "Mika Soren"
---
```

### Frontmatter Schema (Blog Posts)

```yaml
---
title: "How I Stay Connected Across Europe on One eSIM"
description: "My setup for traveling 12 European countries without swapping SIM cards."
pubDate: 2026-03-27
category: "travel-tips"
region: "europe"
silo: "europe"
relatedComparisons: ["france", "spain", "italy", "germany"]
heroImage: "/images/blog/europe-connectivity.jpg"
author: "Mika Soren"
---
```

---

## URL Structure

| Content Type | URL Pattern | Example |
|-------------|-------------|---------|
| Comparison | /best-esim-for/[country]/ | /best-esim-for/france/ |
| Pillar | /[slug]/ | /best-esims-for-europe/ |
| Blog | /blog/[slug]/ | /blog/how-i-stay-connected-across-europe/ |
| About | /about/ | /about/ |

---

## Build Order (Recommended)

### Phase 1: Foundation
1. Set up Astro project with Tailwind
2. Create base layouts (BaseLayout, BlogPost, ComparisonPost)
3. Create core components (PricingTable, ProviderCard, CTAButton, FAQ)
4. Build homepage and about page
5. Create content collection schemas

### Phase 2: Comparison Posts (start with highest-volume countries)
1. France, Spain, Italy, Germany, UK (Europe high-traffic)
2. Japan, Thailand, USA, Australia (global high-traffic)
3. Turkey, Mexico, Canada, India (next tier)
4. Remaining countries in batches of 5-10

### Phase 3: Pillar Pages
1. "Complete Guide to Travel eSIMs" (master pillar)
2. Regional pillars (Europe, Asia, Americas, Africa/ME, Oceania)
3. Educational pillars (eSIM vs SIM, how to set up, data calculator)

### Phase 4: Blog Posts
1. 2-3 posts per silo to start internal linking
2. Expand based on keyword opportunities from NeuronWriter

### For each comparison post:
1. Pull pricing from /Pricing/[Country] Pricing.txt
2. Check NeuronWriter for existing query (project bcc20b873b2410bc)
3. Write draft in Mika's voice
4. Run NeuronWriter gap analysis
5. Optimize for missing terms
6. Run /humanizer
7. Final review and publish

---

## SEO Notes

- **Primary KW per comparison post:** "Best eSIM for [Country]"
- **NeuronWriter project:** eSIM4 (bcc20b873b2410bc) — has queries for most countries
- **Title format:** "Best eSIM for [Country]: My Top 5 Picks After Testing"
- **Meta description format:** "I tested [N] eSIM providers in [Country]. Here's my honest ranking with real pricing, coverage maps, and speed test results."
- **Internal linking:** Every blog post links to at least 1 comparison post. Every comparison post links to its pillar. Every pillar links to its comparison posts.
- **No year in titles or body copy** — only in "Last updated" date
