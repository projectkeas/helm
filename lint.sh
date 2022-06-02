#!/bin/sh

for path in charts/*/ ; do
    #echo "Removing old dependencies..."
    #rm -rf "${path}charts"
    
    echo "Building dependencies..."
    helm dep up $path

    if [ -f "$path/test.values.yaml" ]; then
        helm lint "$path" --values "$path/test.values.yaml"

        echo "Templating Chart '$path' with test.values.yaml"
        helm template "$path" -n keas2 --name-template=template-test -f "$path/test.values.yaml" --debug --include-crds > $path/test.yaml
    else
        helm lint "$path"

        echo "Templating Chart '$path'"
        helm template "$path" -n keas2 --name-template=template-test --debug --include-crds > $path/test.yaml
    fi
done