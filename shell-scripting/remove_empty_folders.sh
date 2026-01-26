#!/bin/bash

all_folders=( $(ls -d */) )

for dir in ${all_folders[@]}; do
    all_files=( $(find "./$dir" -maxdepth 1 -type f) )
    if [ ${#all_files[@]} -eq 0 ]; then
        echo "Empty folder: $dir"
        rm -rf "./$dir"
    fi
done
     