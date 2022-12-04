#!/usr/bin/env bash
for letter in {{a..z},{A..Z}}; do
  export "alpha_$letter"=$((++index))
done

while read -r line; do
  head=$(echo "${line:0:${#line}/2}" | grep -o . | sort -u)
  tail=$(echo "${line:${#line}/2}" | grep -o . | sort -u)

  {
    echo "$head"
    echo "$tail"
  } | \
  sort | \
  uniq -d
done < input.txt | \
xargs -n1 -I% sh -c 'echo $alpha_%' | \
paste -sd+ - | \
bc
