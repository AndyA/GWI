#!/bin/bash

in_dir="$( dirname "$0" )/.."
cd "$in_dir"
out_dir="$PWD/WAV"

find . -not -name '.*' -name '*.mov' | while read mov; do
  wav="$out_dir/${mov%.*}.wav"
  [ "$wav" -nt "$mov" ] && continue
  echo "$mov -> $wav"
  mkdir -p "$(dirname "$wav")"
  tmp="$wav.tmp.wav"
  ffmpeg -nostdin -i "$mov" -vn -c:a pcm_s16le -y "$tmp" && mv "$tmp" "$wav" || rm -f "$tmp"
done

# vim:ts=2:sw=2:sts=2:et:ft=sh

