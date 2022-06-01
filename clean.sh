#!/bin/sh

for path in charts/*/charts/*.tgz ; do
    [[ -e $path ]] || continue
    echo "Removing... $path"
    rm $path
done
