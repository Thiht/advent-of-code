#!/usr/bin/env bash
for letter in {{a..z},{A..Z}}; do
  export "alpha_$letter"=$((++index))
done

while read -r line1 ; read -r line2 ; read -r line3 ; do
  line1=$(echo "$line1" | grep -o . | sort -u)
  line2=$(echo "$line2" | grep -o . | sort -u)
  line3=$(echo "$line3" | grep -o . | sort -u)

  {
    echo "$line1"
    echo "$line2"
    echo "$line3"
  } | \
  sort | \
  uniq -cd | \
  sort -nr | \
  head -n1 | \
  xargs | \
  cut -d' ' -f2
done < input.txt | \
xargs -n1 -I% sh -c 'echo $alpha_%' | \
tr $'\n' '+' | \
sed 's/\+$//' | \
bc
