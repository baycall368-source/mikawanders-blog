---
name: travel-blog-scenery
description: >
  Generate scenery, landscape, or architecture images for travel blog articles — NO people or main character in the shot.
  Use this skill when you need to produce an establishing shot, cityscape, landmark, street scene, neighbourhood view,
  or any environment-only image to accompany a travel article. The image is always tailored to the city, country, or
  region the article is about. Triggers include: "generate a scenery image for this article", "create a background shot",
  "I need a landscape photo", "generate a building/landmark photo", "make an establishing shot", "create a hero image
  of the city", "I need a location photo with no people", or any request for a travel image where the subject is the
  place itself rather than a person. Always read the article or section context before generating so the prompt matches
  the correct destination and vibe.
---

# Travel Blog — Scenery & Architecture Image Generator

Generates environment-only travel photos for blog articles: cityscapes, landmarks, streets, nature, and architecture.
No people, no main character. The scene is derived from the article's destination and tone.

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

## Workflow

1. **Read the article or section** to identify:
   - City / country / region
   - Specific landmark, neighbourhood, or environment type
   - Time of day and weather mood (if mentioned)
   - Overall tone: lively, quiet, romantic, gritty, luxurious, etc.

2. **Build the prompt** using the template below.

3. **Run the script** with `--aspect-ratio 16:9` (standard blog hero/banner).

4. **Save the raw output** to a temp path, then **post-process** (see mandatory step below)

5. **Save final webp to** `public/images/[destination]-scenery.webp`

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

## ⚠️ REALISM — CRITICAL

The image must look like a real photograph taken by a human. **If it could be mistaken for AI art, it has failed.**

**Avoid anything that triggers AI aesthetics:**
- No "perfect" reflections — specify "slightly rippled water, imperfect broken reflection"
- No oversaturated skies or clouds
- No hyper-smooth gradients or painterly smoothing
- No symmetry that wouldn't exist in real life
- No "postcard perfect" compositions — real travel photos have slight imperfections
- No AI gloss or synthetic texture

## Photography Specs by Scene Type

| Scene type | Camera | Lens | Aperture | ISO | Shutter | Light |
|---|---|---|---|---|---|---|
| Wide city / establishing | Sony A7R V | 16-35mm f/2.8 at 16mm | f/8 | ISO 100 | 1/250s | Golden hour or blue hour, side or front |
| Street / neighbourhood | Sony A7R V | 35mm f/1.4 | f/5.6 | ISO 400 | 1/500s | Natural dappled or overcast, camera-left |
| Landmark / monument | Sony A7R V | 24mm f/2.8 | f/8 | ISO 100 | 1/320s | Side light 45°, imperfect sky |
| Nature / coastline | Sony A7R V | 24mm f/2.8 | f/11 | ISO 100 | 1/500s | Golden hour side light |
| Interior (café / airport) | Sony A7R V | 24mm f/2.8 | f/2.8 | ISO 1600 | 1/60s | Mixed ambient + window, slight motion blur |
| Night scene | Sony A7R V | 35mm f/1.4 | f/2.0 | ISO 3200 | 1/30s | Practical light sources, natural neon |
| Detail / object (no people) | Sony A7R V | 50mm f/1.8 | f/3.5 | ISO 200 | 1/200s | Single window source, 90° side |
| Compressed telephoto | Sony A7R V | 70-200mm f/2.8 at 135mm | f/4 | ISO 400 | 1/800s | Natural daylight, stacked layers |

## Prompt Template

```
[SPECIFIC SCENE: e.g. narrow cobblestone laneway in Naples, Italy, laundry strung between ochre buildings].
No people.
Sony A7R V, [LENS from table] lens. Aperture [f-stop], ISO [ISO], [SHUTTER]s.
[LIGHT: e.g. "Late afternoon golden hour light raking from camera-left at 30 degrees — warm directional shadows stretching right, catching the stone texture. Sky slightly overcast at the edges, no blown highlights."]
[CAMERA POSITION: e.g. "Camera at street level, lens at 16mm giving slight barrel distortion at the edges. Subject positioned by rule of thirds."]
Slight natural atmospheric haze, authentic worn textures with micro-detail, real-world imperfections visible.
No surreal colours, no painterly smoothing, no AI gloss. Slight barrel distortion from wide angle.
Muted natural colour grading, slight film grain, low saturation, soft vignette.
RAW photo, photojournalistic travel photography. Looks genuinely captured on location.
```

### Scene Type Modifiers

| Scene type | Add to prompt |
|---|---|
| City skyline | "natural atmospheric haze softening distant buildings, slight chromatic aberration at corners, no perfectly even sky" |
| Street / neighbourhood | "uneven dappled light, real-world grime and worn plaster visible, slight motion blur on any distant movement" |
| Landmark / monument | "slight barrel distortion from wide angle, imperfect sky with natural cloud movement, no tourist-brochure perfection" |
| Nature / coastline | "slightly choppy water, no boats, natural colour — no enhanced blues or greens, wind movement in any vegetation" |
| Water reflection | "slightly rippled water, broken imperfect reflection, natural movement distorting the surface" |
| Café / restaurant | "worn facade, faded signage, authentic street-level perspective, chairs at natural angles" |
| Airport / terminal | "mixed overhead fluorescent + window daylight, motion-blurred crowds at 1/60s, natural lens flare from skylights" |
| Night scene | "practical light sources only — neon, lanterns, street lamps. Slight halation around lights, natural noise from high ISO" |

## Example Commands

```bash
# Sydney harbour at blue hour
export GEMINI_API_KEY=$(cat ~/.config/gemini/api_key)
python "C:\Users\Jade\Desktop\Claude\CB\Numerology\shaggy-star\.claude\skills\tarot-imagegen\scripts\generate_image.py" \
  --prompt "Sydney Harbour at blue hour, Opera House and Harbour Bridge visible across the water. No people. Sony A7R V, 16-35mm f/2.8 at 24mm. Aperture f/8, ISO 100, 1/4s on tripod. Blue hour ambient light — cool blue sky fading to warm city glow on the horizon. Slightly rippled harbour water with broken imperfect city light reflections. Natural atmospheric haze over the CBD, distant buildings slightly soft. Slight barrel distortion at edges. No surreal colours, no AI gloss, no painterly smoothing. Muted cool-blue colour grading, slight film grain, low saturation. RAW photo, photojournalistic travel photography. Looks genuinely captured on location." \
  --output "C:\...\public\images\tmp_sydney-scenery-raw.jpg" \
  --aspect-ratio "16:9"

# Tokyo alley at night
export GEMINI_API_KEY=$(cat ~/.config/gemini/api_key)
python "C:\Users\Jade\Desktop\Claude\CB\Numerology\shaggy-star\.claude\skills\tarot-imagegen\scripts\generate_image.py" \
  --prompt "Narrow Tokyo alleyway at night, glowing izakaya lanterns, wet cobblestones with broken neon reflections. No people. Sony A7R V, 35mm f/1.4 lens. Aperture f/2.0, ISO 3200, 1/30s — natural high-ISO noise visible, practical light sources only. Warm lantern light from the right, cool neon blue-green from a sign to the left. Natural steam rising from a vent. Authentic urban grime and worn texture, real-world imperfections. Slight halation around light sources from high ISO. No painterly smoothing, no AI gloss. Muted colour grading, low saturation, slight grain. RAW photo. Looks genuinely captured at street level." \
  --output "C:\...\public\images\tmp_tokyo-scenery-raw.jpg" \
  --aspect-ratio "16:9"
```

## Output Notes

- Always use `16:9` for hero/banner images
- Use `4:5` or `1:1` if the article uses vertical/square sidebar images
- Keep output filenames as `[destination-slug]-scenery.webp` (after post-processing)
- Never include people, hands, or the main character in these shots
