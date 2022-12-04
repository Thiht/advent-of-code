#!/usr/bin/env bash
< input.txt \
paste -sd+ - | \
sed 's/\+\+/\n/g' | \
bc | \
sort -rn | \
head -n1
