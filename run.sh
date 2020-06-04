#!/bin/bash


strict_mode=1
dry_run=0

while [[ -n "$2" ]]; do
    case $1 in
        --dry-run) dry_run=1
        ;;
        --no-strict) strict_mode=0
        ;;
        -h) echo "usage: $0"; exit 1;
        ;;
        --) shift; break;
        ;;
    esac
    shift
done
recipe=$1
[ -z "$recipe" ] && echo "usage: $0 [options] <recipe>" && exit 1

while read line; do
    [ -z "$line" ] && continue
    cmd=$(echo $line | cut -d' ' -f1)
    case $cmd in
        \#*) echo "skipping comment $line"
            continue
        ;;
        ENV)
            [[ "$dry_run" -eq 1 ]] && echo "$line" && continue
            export $(echo $line | cut -d' ' -f2) $(echo $line | cut -d' ' -f3-)
        ;;
        COOK)
            cookbook=$(echo $line | cut -d' ' -f2)
            [[ "$dry_run" -eq 1 ]] && echo "DRY-RUN COOK $cookbook" && continue
            find ./cookbooks/$cookbook -name '*.sh' | sort | xargs -I{} -- /bin/bash {}
        ;;
        *)
            echo "ERROR: unknown command $cmd"
            [ "$strict_mode" -eq 1 ] && echo "strict mode enabled, exiting" && exit 1
        ;;
    esac
done < recipes/$recipe