#!/bin/bash

find WAV* -not -name '.*' -iname '*.wav' | while read wav; do
  png="${wav%.*}.png"
  [ "$wav" -nt "$png" ] || continue

  echo "$wav -> $png"
  tmp="$png.tmp.png"

  sndfile-waveform          \
    -b -g 800x200           \
    --logscale --rectified  \
    -t 25 -T 172800000      \
    "$wav" "$tmp" && mv "$tmp" "$png" || rm -f "$tmp"

done
