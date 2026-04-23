---
name: travel-blog-character
description: >
  Generate candid travel photos of the blog's main character — a specific young woman — placed in real locations
  relevant to the article's city or country. Use this skill whenever you need a lifestyle or travel photo featuring
  the main character as the subject: walking through a city, sitting at a café, exploring a market, standing near a
  landmark, or any candid moment set in the article's destination. Triggers include: "generate a photo of her in
  [city]", "create a candid shot of the main character", "I need a lifestyle photo of her in [location]",
  "generate a travel shot with her in it", "create an influencer-style photo", "I need a photo of her at [landmark]",
  or any request for a travel image featuring the blog's recurring character. Always adapt clothing, hair, and setting
  to the destination and season — but NEVER change her face, build, or core identity.
---

# Travel Blog — Main Character Candid Shot Generator

Generates candid lifestyle travel photos of the blog's consistent main character placed in destinations matching
the article. Her face, body type, and personal style identity remain IDENTICAL across all images — only her
outfit, hairstyle, and environment change.

## ⚠️ ONE GENERATION PER REQUEST — STRICT

**Run the generation script EXACTLY ONCE per user request. No retries, no variations, no test runs.**
- Do NOT run the script multiple times to "try different options"
- Do NOT run a test generation before the real one
- Do NOT regenerate if the result looks different than expected — show it and let the user decide
- Each script execution costs real credits. One request = one call, always.

## API Details

- **Model:** Nano Banana 2, 1K via kie.ai  
- **Cost:** 8 credits per image  
- **API Key location:** `/home/claude/.env` → `KIE_API_KEY`  
- **Script:** `/mnt/skills/user/gemini-imagegen/scripts/generate_image.py`

## Setup (run once per session)

```bash
export KIE_API_KEY=$(grep KIE_API_KEY /home/claude/.env | cut -d= -f2)
export GEMINI_API_KEY=$KIE_API_KEY
```

## ⚠️ Character Consistency — CRITICAL

**Reference image (read this before every generation):**
- `mikawanders.blog/Mika Persona/224a5b37405bba94d7906e978e649f56_1775521296_3uk9t9el.jpg` — front and side profile showing exact facial features. Read it with the Read tool before building the prompt so the description matches precisely.

The script is text-prompt only — no image input supported. Face consistency comes entirely from the anchor description below. Keep it verbatim.

Every prompt MUST include this exact character anchor block. Do not shorten or rephrase it:

```
The subject is a woman in her late twenties to early thirties with a specific consistent appearance:
dark brown hair, fine and straight, loosely pulled back into a casual messy bun with soft strands
falling around her face and neck, medium olive complexion with smooth skin and warm golden undertones,
dark brown eyes, oval face with soft feminine features, high cheekbones, a straight nose, and
full lips, calm natural expression with a slight softness, slim natural build, approximately 165cm tall.
She wears a delicate fine chain necklace as her signature jewellery.
Her personal style is quiet and natural — minimal, understated, high-quality linen and cotton basics
in neutral tones (white, cream, blush, camel, sand).
She always looks like the same person across all photos.
She is NEVER looking at the camera — always looking away, at the view, at something in the scene, or caught mid-movement.
```

**What CAN change:** outfit, hairstyle styling (up/down/loose), outerwear for climate, additional accessories
**What MUST stay the same:** dark brown hair, olive complexion, dark brown eyes, oval face with soft features, slim build, delicate chain necklace

## Workflow

1. **Read the article or section** to identify:
   - Destination (city, country, region)
   - Context (exploring, eating, transit, beach, market, etc.)
   - Season / weather
   - Tone (adventurous, relaxed, romantic, urban, etc.)

2. **Choose a scene type** from the table below

3. **Build the prompt** using the character anchor + scene + environment

4. **Run the script** with appropriate aspect ratio

5. **Save the raw output** to a temp path, then **post-process** (see mandatory step below)

6. **Save final webp to** `public/images/[destination]-character-[scene].webp`

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

## Photography Specs by Scene Type

Different scenes require different camera setups. Always include the full spec block in every prompt.

| Scene | Focal length | Aperture | ISO | Shutter | Light direction | Camera height |
|---|---|---|---|---|---|---|
| Walking city street | 35mm | f/1.8 | ISO 400 | 1/500s | 45° camera-left or backlit | Hip height, slightly low angle |
| Sitting at café | 85mm | f/2.0 | ISO 320 | 1/250s | Soft window light from left, 90° | Eye level |
| Standing near landmark | 35mm | f/2.8 | ISO 200 | 1/400s | Side light, 45° | Slightly low angle, full body |
| Looking at view / balcony | 50mm | f/1.8 | ISO 400 | 1/320s | Backlit, golden hour behind subject | Eye level or slightly below |
| Airport / train station | 35mm | f/2.0 | ISO 800 | 1/500s | Mixed terminal overhead + window | Hip height, walking motion |
| Market / browsing | 35mm | f/1.8 | ISO 640 | 1/400s | Dappled natural overhead | Eye level, 3/4 angle |
| Hotel room | 35mm | f/2.8 | ISO 800 | 1/200s | Soft window backlight | Eye level |
| Beach / coastal | 50mm | f/2.8 | ISO 200 | 1/800s | Golden hour side light | Low angle, full body |

## Prompt Template

```
[CHARACTER ANCHOR BLOCK]
Candid travel lifestyle photo of her [SCENE DESCRIPTION].
She is wearing [OUTFIT appropriate to climate and destination].
[ENVIRONMENT DETAILS — architecture, light, atmosphere, background activity].
Shot on a Fujifilm X-T5 with a [FOCAL LENGTH from table above] lens.
[APERTURE from table], ISO [ISO from table], [SHUTTER] — [describe resulting motion/sharpness e.g. "subject sharp, background motion-blurred pedestrians"].
[LIGHT DIRECTION from table — e.g. "Natural light raking from camera-left at 45 degrees, catching her hair and left cheekbone. No fill, slight shadow on right side."]
Camera held at [HEIGHT from table], [ANGLE — slightly low / eye level], subject positioned [left / right / center] of frame.
Shallow depth of field — subject in sharp focus, background falls to soft bokeh.
Fujifilm film simulation: Classic Chrome. Slight grain, muted earth tones, low contrast, no HDR.
RAW photo aesthetic, authentic travel editorial, looks genuinely captured on location.
```

## Scene Type Reference

| Scene | Shot framing | Aspect ratio |
|---|---|---|
| Walking city street | Full body or 3/4, from side/behind, mid-stride | 4:5 |
| Sitting at café / restaurant | Medium seated, looking away or at the table | 4:5 |
| Standing near landmark | Full body, landmark fills background | 4:5 |
| Looking at view / balcony | Side profile or 3/4, contemplative, wide environment | 16:9 |
| Airport / train station | Walking, bag in hand, motion energy | 4:5 |
| Market / shopping street | 3/4 candid, mid-browse, slight motion | 4:5 |
| Hotel room / accommodation | Sitting on bed, looking toward window light | 16:9 |
| Beach / coastal | Full body, relaxed, looking at water, low angle | 4:5 |

## Outfit Guidelines by Climate

| Climate | Outfit |
|---|---|
| Cool / European autumn | Oversized wool coat, ribbed knit, straight leg trousers or mini skirt, ankle boots |
| Warm / Mediterranean | Linen co-ord or slip dress, sandals, light cardigan draped over shoulders |
| Tropical / Southeast Asia | Cotton sundress or linen shirt + shorts, flat sandals, tote bag |
| Winter / cold city | Long puffer or trench coat, turtleneck, wide-leg trousers, knee boots |
| Urban neutral | Tailored blazer, simple tee, straight-leg jeans, white sneakers or loafers |

## Example Commands

```bash
# Character in Paris — walking street
export GEMINI_API_KEY=$(cat ~/.config/gemini/api_key)
python "C:\Users\Jade\Desktop\Claude\CB\Numerology\shaggy-star\.claude\skills\tarot-imagegen\scripts\generate_image.py" \
  --prompt "[CHARACTER ANCHOR BLOCK] Candid travel lifestyle photo of her walking along a quiet Parisian cobblestone street, glancing slightly to the side. She is wearing a long camel wool trench coat, simple white tee at the neck, straight-leg dark jeans, tan leather ankle boots. Haussmann-era stone buildings line the street, autumn plane trees shedding leaves. Shot on a Fujifilm X-T5 with a 35mm f/1.4 lens. Aperture f/1.8, ISO 400, 1/500s — subject sharp, background pedestrians softly blurred mid-stride. Natural light raking from camera-left at 45 degrees, catching her coat and left shoulder. Camera held at hip height, slightly low angle. Subject positioned left of frame, street receding to the right. Shallow depth of field, Fujifilm Classic Chrome simulation, slight grain, muted earth tones, low contrast, no HDR. RAW photo aesthetic, authentic travel editorial, looks genuinely captured on location." \
  --output "C:\...\public\images\tmp_paris-character-street-raw.jpg" \
  --aspect-ratio "4:5"

# Character at Sydney café balcony
export GEMINI_API_KEY=$(cat ~/.config/gemini/api_key)
python "C:\Users\Jade\Desktop\Claude\CB\Numerology\shaggy-star\.claude\skills\tarot-imagegen\scripts\generate_image.py" \
  --prompt "[CHARACTER ANCHOR BLOCK] Candid travel lifestyle photo of her sitting at an outdoor café balcony table overlooking Sydney Harbour, the Harbour Bridge visible and softly blurred behind her, looking out toward the water. She is wearing an oversized taupe-brown wool wrap coat, white ribbed cropped cardigan, black mini shorts, sheer tights. Ornate wrought iron railing foreground, bare branches framing top-left, overcast flat grey sky. Shot on a Fujifilm X-T5 with an 85mm f/1.8 lens. Aperture f/2.0, ISO 320, 1/250s — face and upper body sharp, harbour background falls to impressionistic soft bokeh. Soft diffused overcast light from the left, even wrap-around, no harsh shadows. Camera at eye level, medium shot. Fujifilm Classic Chrome simulation, muted cool greys and soft whites, slight grain, low contrast, no HDR. RAW photo aesthetic, authentic travel editorial." \
  --output "C:\...\public\images\tmp_sydney-character-cafe-raw.jpg" \
  --aspect-ratio "4:5"
```

## Output Notes

- Use `4:5` for portrait editorial shots (standard blog inline image)
- Use `16:9` for wide scenic shots where she appears small in frame
- Keep filenames as `[destination]-character-[scene-type].jpg`
- If generating multiple shots for one article, vary the scene type and outfit slightly but keep the character anchor identical
