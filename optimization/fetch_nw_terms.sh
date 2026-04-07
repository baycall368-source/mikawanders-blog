#!/bin/bash
# Fetch NeuronWriter terms for all 48 countries and save as JSON files

API_KEY="n-b4809f54358c340f81eca318de877936"
OUTDIR="C:/Users/Jade/Desktop/Claude/eSIM Review Sites/mikawanders.blog/optimization/neuronwriter"

declare -A QUERIES=(
  ["argentina"]="3614d683c6d34598"
  ["australia"]="228c9fa1f9c69aa4"
  ["austria"]="432ea770a1ad861f"
  ["belgium"]="348b3f04a236cd71"
  ["brazil"]="617215cb1a2edcd1"
  ["canada"]="3ac395affde35785"
  ["chile"]="84f32cfb0e6cecfc"
  ["china"]="765516735cb2774c"
  ["colombia"]="c19d5001fc01eeee"
  ["czech-republic"]="bfd0fefee14d87ee"
  ["denmark"]="87c05618a505a6ba"
  ["france"]="101bc523fa485d5b"
  ["germany"]="70639f9d87295f28"
  ["greece"]="6956d70c8fbd5dca"
  ["hong-kong"]="1a716dcfccd0969e"
  ["hungary"]="bb79760485fc996a"
  ["india"]="acbaaf9b3221aac4"
  ["indonesia"]="c3a9b3360c94c5a5"
  ["italy"]="e8d39dabf519dc5b"
  ["japan"]="eb1aef17cf19f0cf"
  ["kenya"]="039f3bd0f82bc6a1"
  ["malaysia"]="f210eea9467054a3"
  ["mexico"]="7d870be8355530c6"
  ["morocco"]="d79ff761faaf8f6c"
  ["nepal"]="aa6a91749537ab7e"
  ["netherlands"]="7b880fa83f321ed8"
  ["new-zealand"]="27968fab5eca6410"
  ["norway"]="4a3985489fc113be"
  ["peru"]="935ac1f0a2d73ba2"
  ["philippines"]="2643d7b1d638f238"
  ["poland"]="ae3a9cf5adae590d"
  ["portugal"]="24b4391dc1818a4d"
  ["romania"]="f72f3b41ab04021d"
  ["saudi-arabia"]="83450385472f3284"
  ["singapore"]="41b1bc26d41050f8"
  ["south-africa"]="cd05dbc1cb9d53f0"
  ["south-korea"]="bbc1144485fc6733"
  ["spain"]="7726b5c6a6ab3315"
  ["sweden"]="a5f69bc7bd259e0c"
  ["switzerland"]="695807867d52d344"
  ["tanzania"]="cced4e6a2d23c353"
  ["thailand"]="6e2016f505a04e47"
  ["tunisia"]="9f2da5aa61044695"
  ["turkey"]="aaa0cbe93c043ae0"
  ["uae"]="730a81db3c5cdd6c"
  ["ukraine"]="eca7b28a02e2c16e"
  ["united-kingdom"]="1669c133557907b4"
  ["united-states"]="89daecb8d496b02e"
)

count=0
total=${#QUERIES[@]}

for country in $(echo "${!QUERIES[@]}" | tr ' ' '\n' | sort); do
  qid="${QUERIES[$country]}"
  count=$((count+1))
  echo "[$count/$total] Fetching $country ($qid)..."

  raw=$(curl -s -X POST "https://app.neuronwriter.com/neuron-api/0.5/writer/get-query" \
    -H "Content-Type: application/json" \
    -H "X-API-KEY: $API_KEY" \
    -d "{\"api_key\":\"$API_KEY\",\"query\":\"$qid\"}")

  # Use node to parse and reshape the JSON
  echo "$raw" | node -e "
    const chunks = [];
    process.stdin.on('data', c => chunks.push(c));
    process.stdin.on('end', () => {
      const d = JSON.parse(chunks.join(''));
      const parse = s => s ? s.split('\n').filter(t => t.trim()) : [];
      const parseRanges = s => {
        if (!s) return [];
        return s.split('\n').filter(t => t.trim()).map(line => {
          const i = line.lastIndexOf(': ');
          if (i === -1) return { term: line, range: '' };
          return { term: line.substring(0, i), range: line.substring(i+2) };
        });
      };
      const out = {
        keyword: d.keyword || '',
        query_id: '$qid',
        basic_terms: parse(d.terms_txt?.content_basic),
        basic_terms_with_ranges: parseRanges(d.terms_txt?.content_basic_w_ranges),
        extended_terms: parse(d.terms_txt?.content_extended),
        extended_terms_with_ranges: parseRanges(d.terms_txt?.content_extended_w_ranges),
        entities: parse(d.terms_txt?.entities),
        paa: d.ideas?.people_also_ask || [],
        questions: d.ideas?.suggest_questions || []
      };
      console.log(JSON.stringify(out, null, 2));
    });
  " > "$OUTDIR/${country}-nw-terms.json"

  echo "  -> Saved ${country}-nw-terms.json (basic: $(node -e "const d=require('$OUTDIR/${country}-nw-terms.json'); console.log(d.basic_terms.length)") ext: $(node -e "const d=require('$OUTDIR/${country}-nw-terms.json'); console.log(d.extended_terms.length)") ent: $(node -e "const d=require('$OUTDIR/${country}-nw-terms.json'); console.log(d.entities.length)"))"
done

echo ""
echo "Done! $total countries saved to $OUTDIR"
