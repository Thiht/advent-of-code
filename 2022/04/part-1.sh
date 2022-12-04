#!/usr/bin/env bash
while read -r line; do
  first_start=$(echo "$line" | cut -d, -f1 | cut -d- -f1)
  first_end=$(echo "$line" | cut -d, -f1 | cut -d- -f2)

  second_start=$(echo "$line" | cut -d, -f2 | cut -d- -f1)
  second_end=$(echo "$line" | cut -d, -f2 | cut -d- -f2)

  if (( first_start >= second_start && first_end <= second_end )) || \
     (( second_start >= first_start && second_end <= first_end )); then
    echo 1
  fi
done < input.txt | \
paste -sd+ - | \
bc
