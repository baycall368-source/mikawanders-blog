---
name: h1-hero-image
description: >
  Generate a hero image for a mikawanders.blog post by reading its H1 title and automatically
  building a scene matched to the content. Use this skill when the user says
  "generate a hero image for [post]", "create a hero image from the H1", "make a header image
  for this post", or similar. Always produces a 16:9 horizontal NO PEOPLE scene image
  derived from the post title. One generation per request — no retries.
---

# H1 → Hero Image Generator (mikawanders.blog)

Reads a blog post's H1, derives a scenery/concept scene (no people) from it, generates one 16:9 hero image via kie.ai, post-processes to webp, and saves it to `public/images/`.

## ⚠️ ONE GENERATION PER REQUEST — STRICT

**Run the generation script EXACTLY ONCE. No retries, no variations, no test runs.**
Each call costs 8 kie.ai credits. One request = one call, always.

## API Details

- **Model:** Nano Banana 2, 1K via kie.ai
- **Cost:** 8 credits per image
- **API Key:** `~/.config/gemini/api_key`
- **Script:** `C:\Users\Jade\Desktop\Claude\CB\Numerology\shaggy-star\.claude\skills\tarot-imagegen\scripts\generate_image.py`
- **Aspect ratio:** Always `16:9` (hero images are always horizontal)

## Workflow

1. **Find the file** — locate the markdown file for the given post in `src/content/blog/` or `src/content/pillars/`

2. **Extract the H1** — read the frontmatter `title:` field (preferred) or the first `# ` heading in the body

3. **Analyse the H1** — determine:
   - **Destination:** specific country, city, or region (if present)
   - **Topic type:** destination guide / packing / travel tips / transport / food / budget / general
   - **Tone:** adventurous, practical, relaxed, urban, nature-focused

4. **Choose a scene** using the NO PEOPLE column of the H1 → Scene mapping table below

5. **Build the prompt** using the scene template (no character anchor — no people in these images)

6. **Run the script once** — save raw output to `public/images/tmp_[slug]-hero-raw.jpg`

7. **Post-process** — convert to webp, max 1600px wide, quality 85, delete raw jpg

8. **Save final image** to `public/images/[slug].webp`

9. **Update frontmatter** — set `heroImage: "/images/[slug].webp"` in the markdown file

## H1 → Scene Mapping

**Step 1: Extract the core visual concept from the H1.** Ask: if you had to show this article's topic in a single image with no text, what object or environment would it be? That's the hero image subject — not just a generic travel backdrop.

**Step 2: Apply the concept** using the table below. All images are NO PEOPLE — no characters, no hands, no figures.

| H1 core concept | Scene (no people) |
|---|---|
| **Specific country / city** | Establishing wide shot of the most recognisable streetscape, landmark, or neighbourhood of that destination |
| **Packing / what to pack** | Open backpack or suitcase flat-lay surrounded by neatly arranged travel essentials on a bed or wooden floor |
| **Flights / airfare / flight tracker** | Wide airport terminal interior, large departures board prominent, planes visible through windows, motion-blurred crowds removed |
| **Travel apps / phone apps** | A smartphone lying face-up on a café table showing a travel app or maps screen, espresso beside it, European street softly blurred through window behind |
| **Trip planner / itinerary / routes** | Open paper map spread on a worn café table, espresso and a pen resting on it, Mediterranean street visible behind |
| **Jet lag / sleep / long-haul** | Empty airport gate seating area at dawn, plane visible on tarmac through large windows, soft low morning light |
| **Budget / cheap / save money** | Colourful local market stall with produce, goods, price signs — early morning empty market |
| **Safety / solo female** | Wide safe-looking city boulevard at golden hour, grand architecture, no people |
| **Food / eat / restaurant / cuisine** | Close-up of a beautifully plated local dish on a restaurant table, soft ambient light, no hands |
| **Beach / island / coast** | Unspoiled beach shoreline, clear water, no people, golden hour light |
| **eSIM / SIM / data / connectivity** | A phone on a map or travel surface showing signal bars or a data screen, passport nearby |
| **General / no clear concept** | Empty cobblestone European street at dawn, café chairs, soft golden light — but only if nothing more specific applies |

### The "generic backdrop" trap

**Never fall back to a generic travel scene when the H1 has a specific concept.** If the title mentions apps, the image must show a phone or device. If it mentions flights, the image must show an airport or plane. If it mentions packing, the image must show luggage or packed items. A beautiful street image that could illustrate any travel article is a failure for a concept-specific post.

## Prompt Template

```
[SCENE derived from H1 mapping — e.g. "Wide establishing shot of a bright modern airport terminal interior."]
No people, no figures, no hands, no human presence.
[ENVIRONMENT DETAILS — light, architecture, atmosphere, objects, textures].
Wide shot, environment stretching into background.
iPhone 15 f/1.8 aesthetic, slight film grain, zero HDR, muted warm tones, low saturation.
Travel blog editorial style, authentic atmospheric feel.
```

## Post-Processing (mandatory)

```bash
python -c "
from PIL import Image
import os
src = r'TEMP_PATH'
dst = r'FINAL_PATH'
img = Image.open(src)
if img.width > 1600:
    img = img.resize((1600, int(img.height * 1600 / img.width)), Image.LANCZOS)
img.save(dst, 'webp', quality=85)
os.remove(src)
print('Saved:', dst, '| Size:', img.size)
"
```

## Example Command

```bash
# Post: "The backpacking packing list" → open suitcase flat-lay, no people
export GEMINI_API_KEY=$(cat ~/.config/gemini/api_key)
python "C:\Users\Jade\Desktop\Claude\CB\Numerology\shaggy-star\.claude\skills\tarot-imagegen\scripts\generate_image.py" \
  --prompt "Open backpack flat-lay on a wooden floor surrounded by neatly arranged travel essentials: merino t-shirts, compression packing cubes, a headlamp, a travel adapter, a microfibre towel. No people, no figures, no hands. Soft window light from camera-left, muted earth tones (olive, rust, tan, navy). Wide overhead shot. iPhone 15 f/1.8 aesthetic, slight film grain, zero HDR, low saturation. Travel blog editorial style." \
  --output "C:\...\public\images\tmp_backpacking-packing-list-hero-raw.jpg" \
  --aspect-ratio "16:9"
```

## Output

- Raw temp: `public/images/tmp_[slug]-hero-raw.jpg` (deleted after post-processing)
- Final: `public/images/[slug].webp`
- Frontmatter: `heroImage: "/images/[slug].webp"`
