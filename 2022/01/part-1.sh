#!/usr/bin/env bash
< input.txt \
tr '\n' '+' | \
sed 's/\+$//' | \
sed 's/\+\+/\n/g' | \
bc | \
sort -rn | \
head -n1
