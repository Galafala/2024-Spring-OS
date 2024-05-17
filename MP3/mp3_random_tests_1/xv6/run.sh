#!/bin/bash

while true; do
    res=$(python3 custom-owo.py --color=always | tee /dev/tty | grep "FAIL")
    if [[ -n "$res" ]]; then
        echo "oh no"
        echo "$res"
        echo "terminating"
        break
    fi
done
