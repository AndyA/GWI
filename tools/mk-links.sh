#!/bin/bash

find . -name '*.mp4' -not -name '*.tmp.mp4' -not -path '*/preview/*' | cpio -pld preview

# vim:ts=2:sw=2:sts=2:et:ft=sh

