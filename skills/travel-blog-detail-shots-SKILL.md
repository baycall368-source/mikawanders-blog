---
name: travel-blog-detail-shots
description: >
  Generate close-up detail and lifestyle flat-lay images for travel blog articles: food dishes, drinks, the main
  character's hand holding a glass or item, open suitcases, passport and tickets, hotel amenities, local market
  produce, souvenirs, etc. Use this skill for any image where the focus is on an object, dish, drink, or intimate
  detail rather than a full scene or the main character's face. Triggers include: "generate a food photo", "create
  a close-up of the dish", "I need a drink shot", "generate a photo of her hand holding a wine glass", "create a
  flat-lay of a suitcase", "I need a detail shot of [item]", "generate a close-up for this food/restaurant section",
  "create a lifestyle product shot", "I need a packing flat-lay", or any request for an intimate or macro-style
  travel image. Always tailor the food, drink, or object to the destination and article context. When hands are
  included, use the main character's consistent hand (olive-toned skin, neat natural nails, delicate gold jewellery).
---

# Travel Blog — Detail & Close-Up Shot Generator

Generates close-up, macro, and lifestyle flat-lay images for travel blog articles.
Focus is on food, drinks, objects, hands, or intimate travel details — not full scenes.
When hands appear, they belong to the main character (consistent skin tone and jewellery).

## ⚠️ ONE GENERATION PER REQUEST — STRICT

**Run the generation script EXACTLY ONCE per user request. No retries, no variations, no test runs.**
- Do NOT run the script multiple times to "try different options"
- Do NOT run a test generation before the real one
- Do NOT regenerate if the result looks different than expected — show it and let the user decide
- Each script execution costs real credits. One request = one call, always.

## API Details

- **Model:** Nano Banana 2, 1K via kie.ai  
- **Cost:** 8 credits per image  
- **API Key:** `~/.config/gemini/api_key`
- **Script:** `C:\Users\Jade\Desktop\Claude\CB\Numerology\shaggy-star\.claude\skills\tarot-imagegen\scripts\generate_image.py`

## ⚠️ Hand Consistency — When Hands Appear

Any time a hand is in the shot, always include this anchor:

```
The hand belongs to a young woman: olive-toned skin, slim fingers,
neat short natural nails with a clear or nude polish, a delicate thin gold chain
bracelet or small gold ring. The hand is relaxed and natural, not posed stiffly.
```

## Workflow

1. **Read the article or section** to identify:
   - Destination (for food/drink localisation)
   - The specific subject: dish name, drink type, object
   - Context: restaurant, street food, hotel room, airport, market, etc.
   - Tone: luxurious, rustic, casual, vibrant, moody

2. **Choose a shot type** from the table below

3. **Build the prompt** using the relevant template

4. **Run the script** — use `1:1` for Instagram-style squares, `4:5` for editorial, `16:9` for wide flat-lays

5. **Save the raw output** to a temp path, then **post-process** (see mandatory step below)

6. **Save final webp to** `public/images/[destination]-detail-[subject].webp`

## ⚠️ MANDATORY POST-PROCESSING — Every Image

After generation, always convert, resize and compress before saving to `public/images/`:

```bash
python -c "
from PIL import Image
import os
src = 'TEMP_PATH'
dst = src.replace('.jpg', '.webp')
img = Image.open(src)
if img.width > 1600:
    img = img.resize((1600, int(img.height * 1600 / img.width)), Image.LANCZOS)
img.save(dst, 'webp', quality=85)
os.remove(src)
print('Saved:', dst)
"
```

- Output format is always **webp** — update filename and all frontmatter references accordingly
- Max width: **1600px** (preserve aspect ratio)
- Quality: **85**

## Photography Specs by Shot Type

| Shot type | Camera | Lens | Aperture | ISO | Shutter | Light | Aspect ratio |
|---|---|---|---|---|---|---|---|
| Food close-up | Sony A7R V | 90mm macro f/2.8 | f/3.5 | ISO 200 | 1/200s | Single window, 90° camera-left, no fill | 4:5 or 1:1 |
| Drink on table | Sony A7R V | 85mm f/1.8 | f/2.0 | ISO 320 | 1/250s | Soft window backlight, slight rim light on glass | 4:5 or 1:1 |
| Hand holding drink | Sony A7R V | 85mm f/1.8 | f/2.0 | ISO 400 | 1/500s | Golden hour backlight from behind subject's shoulder | 4:5 |
| Flat-lay overhead | Sony A7R V | 50mm f/1.8 | f/5.6 | ISO 200 | 1/160s | Even diffused window light, camera directly overhead | 16:9 or 1:1 |
| Passport / travel docs | Sony A7R V | 50mm f/1.8 | f/4.0 | ISO 200 | 1/200s | Raking side light from left, slight shadow for texture | 1:1 |
| Market produce | Sony A7R V | 50mm f/1.8 | f/2.8 | ISO 640 | 1/500s | Natural overhead daylight, slight dapple | 1:1 or 4:5 |
| Hotel amenity | Sony A7R V | 50mm f/1.8 | f/2.8 | ISO 800 | 1/200s | Warm ambient room light + window edge | 1:1 |
| Souvenir / object | Sony A7R V | 90mm macro f/2.8 | f/4.0 | ISO 200 | 1/250s | Raking 45° side light, textured surface shadow | 1:1 |
| Café table scene | Sony A7R V | 50mm f/1.8 | f/3.5 | ISO 320 | 1/200s | Window light from left, soft even wrap, no flash | 1:1 |

## Prompt Templates

### Food / Dish Close-Up
```
Close-up food photography of [DISH NAME] at a [RESTAURANT TYPE] in [CITY, COUNTRY].
[DESCRIBE DISH: plating, garnish, steam, texture, sauce.]
Shot on a [surface: worn marble / dark wood / rustic ceramic tile / linen tablecloth].
Sony A7R V, 90mm macro f/2.8 lens. Aperture f/3.5, ISO 200, 1/200s.
Single natural window light source at 90 degrees camera-left — hard directional side light, no fill flash,
natural shadow falling right, catching texture and steam.
Camera positioned slightly above and to the side, hero dish fills frame.
Shallow depth of field — front garnish sharp, background elements soft.
Muted natural colour grading, slight film grain, low saturation, no HDR.
Authentic, appetising, travel editorial.
```

### Drink / Hand Holding Drink
```
[CLOSE-UP / MEDIUM SHOT] of [DRINK] being held up by a woman's hand against [ENVIRONMENT BACKGROUND].
The hand belongs to a young woman: olive-toned skin, slim fingers, neat short natural nails with nude polish,
a delicate thin gold chain bracelet. The hand is relaxed and natural, not posed stiffly.
Sony A7R V, 85mm f/1.8 lens. Aperture f/2.0, ISO 400, 1/500s.
Golden hour backlight from behind the subject's shoulder — warm rim light on the glass edge and hand,
background environment falls to impressionistic warm bokeh.
Camera at mid-height, slight upward tilt, hand and glass sharp, background fully blurred.
Muted warm colour grading, slight film grain, low contrast, no HDR. Travel lifestyle editorial.
```

### Suitcase / Packing Flat-Lay
```
Overhead flat-lay photo of [an open hard-shell suitcase / a packing layout on a white hotel bed].
Contents include [LIST ITEMS].
Clean neutral surface: [linen / white duvet / light oak floor].
Sony A7R V, 50mm f/1.8 lens, camera mounted directly overhead on axis.
Aperture f/5.6, ISO 200, 1/160s — deep enough focus for all items to be sharp.
Even diffused natural window light from camera-left, no shadows, no specular highlights on items.
Flat overhead composition, items arranged with slight natural imperfection — not too perfect.
Muted pastel and earth tones, slight film grain, low saturation. Quiet luxury, aspirational travel packing.
```

### Market / Street Food Detail
```
Close-up detail shot of [ITEM] at a [TYPE: outdoor market / street stall] in [CITY, COUNTRY].
[DESCRIBE item: colours, textures, arrangement, vessel.]
Sony A7R V, 50mm f/1.8 lens. Aperture f/2.8, ISO 640, 1/500s.
Natural overhead daylight with slight dappling — warm, directional, uncontrolled authentic market light.
Camera at low angle, slightly above item, front elements sharp, background stall blurs to colour.
Authentic textures with micro-detail, no artificial enhancement.
Vibrant natural colours, slight film grain, low saturation. Travel documentary photography. No people.
```

### Coffee / Café Table Scene
```
[Overhead / 45-degree side angle] of [DRINK] and [ACCOMPANIMENT]
on a [SURFACE: worn marble / dark wood] at a café in [CITY, COUNTRY].
[Optional: open notebook, pen, folded city map.]
Sony A7R V, 50mm f/1.8 lens. Aperture f/3.5, ISO 320, 1/200s.
Soft natural window light from the left — even wrap-around, no harsh shadows, slight warm cast.
[Overhead: camera directly above / Side: camera at 45 degrees, eye-level to table surface].
Items sharp throughout, muted neutral tones, slight film grain, low saturation.
Minimal lifestyle composition, quiet and calm. Authentic café atmosphere.
```

## Example Commands

```bash
# Hand holding wine glass in Tuscany
export GEMINI_API_KEY=$(cat ~/.config/gemini/api_key)
python "C:\Users\Jade\Desktop\Claude\CB\Numerology\shaggy-star\.claude\skills\tarot-imagegen\scripts\generate_image.py" \
  --prompt "Medium shot of a classic stemmed glass of deep red Chianti wine being held up by a woman's hand against a backdrop of rolling Tuscan hills and cypress trees at golden hour. The hand belongs to a young woman: olive-toned skin, slim fingers, neat short natural nails with nude polish, a delicate thin gold chain bracelet. The hand is relaxed and natural. Sony A7R V, 85mm f/1.8 lens. Aperture f/2.0, ISO 400, 1/500s. Golden hour backlight from behind the subject's shoulder — warm rim light catching the glass edge and hand, wine glowing deep ruby, Tuscan hills behind falling to soft impressionistic warm bokeh of greens and golds. Camera at mid-height, slight upward tilt. Muted warm colour grading, slight film grain, low contrast, no HDR. Travel lifestyle editorial." \
  --output "C:\...\public\images\tmp_tuscany-detail-wine-raw.jpg" \
  --aspect-ratio "4:5"

# Sydney seafood dish
export GEMINI_API_KEY=$(cat ~/.config/gemini/api_key)
python "C:\Users\Jade\Desktop\Claude\CB\Numerology\shaggy-star\.claude\skills\tarot-imagegen\scripts\generate_image.py" \
  --prompt "Close-up food photography of freshly shucked Sydney rock oysters on a bed of crushed ice with a lemon wedge and mignonette sauce, at an upscale waterfront restaurant in Sydney. Shot on a worn marble surface with a linen napkin folded to the side. Sony A7R V, 90mm macro f/2.8 lens. Aperture f/3.5, ISO 200, 1/200s. Single natural window light at 90 degrees camera-left — hard side light, no fill, natural shadow falling right, catching the ice texture and oyster sheen. Camera slightly above and to the side, oysters fill the frame. Shallow depth of field, front oysters sharp, background soft. Muted cool-toned colour grading, slight film grain, low saturation. Appetising, authentic, travel editorial." \
  --output "C:\...\public\images\tmp_sydney-detail-oysters-raw.jpg" \
  --aspect-ratio "4:5"

# Packing flat-lay for European trip
export GEMINI_API_KEY=$(cat ~/.config/gemini/api_key)
python "C:\Users\Jade\Desktop\Claude\CB\Numerology\shaggy-star\.claude\skills\tarot-imagegen\scripts\generate_image.py" \
  --prompt "Overhead flat-lay of an open taupe hard-shell carry-on suitcase on a white hotel bed. Neatly folded inside: camel wool wrap coat, white ribbed cropped cardigan, black mini shorts, sheer black tights rolled, a silk slip dress, gold jewellery in a cream linen pouch, miniature skincare bottles, AirPods case, a worn paperback. Sony A7R V, 50mm f/1.8 lens, camera directly overhead on axis. Aperture f/5.6, ISO 200, 1/160s — full depth, all items sharp. Even diffused window light from camera-left, no shadows, no specular highlights. Slight natural imperfection in the arrangement. Muted earth tones and soft whites, slight film grain, low saturation. Quiet luxury, aspirational travel packing." \
  --output "C:\...\public\images\tmp_europe-detail-packing-raw.jpg" \
  --aspect-ratio "1:1"
```

## Output Notes

- `1:1` for Instagram-optimised or sidebar detail shots  
- `4:5` for editorial inline images  
- `16:9` for wide packing flat-lays or table scenes  
- Keep filenames as `[destination]-detail-[subject].jpg`
- Never show the character's face in these shots — hands only, or no person at all
