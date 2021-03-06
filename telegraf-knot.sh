#!/bin/sh

if [ "$1" = "-s" ] && [ -n "$2" ]; then
    knot_cmd="sudo knotc -f -s $2 stats"
else
    knot_cmd="sudo knotc -f stats"
fi

if stats_output=$($knot_cmd 2>/dev/null); then
    echo "$stats_output" | while read -r line; do
        stats_module=$( echo "$line" | cut -d "." -f 1 | cut -d '-' -f 2)
        stats_key=$( echo "$line" | cut -d "." -f 2 | cut -d " " -f 1)
        stats_value=$( echo "$line" | cut -d " " -f 3 )

        stats_tag_value=$(echo "$line" | awk -F"[][]" '{print $2}')

        if [ -n "$stats_tag_value" ]; then
            stats_tag_key=$( echo "$stats_key" | cut -d "[" -f 1 | cut -d "." -f 2 | cut -d '-' -f 2)
            stats_key=$( echo "$stats_key" | cut -d "[" -f 1 | cut -d "." -f 2)

            echo "$stats_module,$stats_tag_key=$stats_tag_value $stats_key=$stats_value"
        else
            echo "$stats_module $stats_key=$stats_value"
        fi
    done
fi
