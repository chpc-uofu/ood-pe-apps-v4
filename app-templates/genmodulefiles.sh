#!/bin/bash

apps=("matlab")

# no Lmod in non-interactive shell, so need to source it
source /uufs/chpc.utah.edu/sys/etc/profile.d/module.sh

for str in ${apps[@]}; do
  module -t spider $str 2> $str.txt
  # grep out empty line
  # grep -v -e '^$' $str.txt
done



