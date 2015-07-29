#!/bin/bash

cd "$(dirname "$0")/.."

for ext in wav png; do
  for dir in WAV*; do
    [ -d "$dir" ] || continue
    diff -U1000000 -u                 \
      <( grep '\.mov$' files | sort ) \
      <( cd "$dir"; find . -not -name '.*' -iname "*.$ext" | \
         sed -e "s/\.$ext\$/.mov/" | sort ) \
      | tail -n +4 \
      | perl -p -e 's/^ /1/; s/^-/0/; s/(.)(.+)/"$2",$1/' > "$dir.$ext.csv"
  done
done
