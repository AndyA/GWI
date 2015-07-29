#!/bin/bash

find . -not -name '.*' -type f > "$(dirname "$0")/../files"
