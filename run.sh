#!/bin/bash

[ $# -ne 1 ] && (echo "usage: $0 <recipe>"; exit 1)

recipe=$1
permissive_mode=0

while read line; do
    [ -z "$line" ] && continue
    cmd=$(echo $line | cut -d' ' -f1)
    case $cmd in
        ENV)
            export $(echo $line | cut -d' ' -f2) $(echo $line | cut -d' ' -f3-)
        ;;
        COOK)
            cookbook=$(echo $line | cut -d' ' -f2)
            "find ./cookbooks/$cookbook -name '*.sh' | sort | xargs -I{} -- /bin/bash {}"
        ;;
        *)
        echo "unknown command $cmd"
        [ "$permissive_mode" -eq 0 ] && exit 1
        ;;
    esac
done < recipes/$recipe