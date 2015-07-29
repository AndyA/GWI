#!/bin/bash

find . -iname '90000.dpx' | while read dpx; do
  base="$( dirname "$dpx" )"
  in="$base/9%04d.dpx"
  out="$base-1024.mp4"
  echo "$in -> $out"
  [ -e "$out" ] && continue
  tmp="$out.tmp.mp4"
  ffmpeg -i "$in" -pix_fmt yuv420p -c:v libx264 -b:v 8000k -s 1024x778 -y "$tmp" </dev/null && mv "$tmp" "$out"
done

# vim:ts=2:sw=2:sts=2:et:ft=sh

