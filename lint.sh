#!/bin/sh

for path in charts/*/ ; do
    if [ -f "$path/test.values.yaml" ]; then
        helm lint "$path" --values "$path/test.values.yaml"
        
        echo "Templating Chart '$path' with test.values.yaml"
        helm template "$path" -n test --name-template=template-test -f "$path/test.values.yaml" --debug > $path/test.yaml
    else
        helm lint "$path"
        
        echo "Templating Chart '$path'"
        helm template "$path" -n test --name-template=template-test --debug > $path/test.yaml
    fi
done