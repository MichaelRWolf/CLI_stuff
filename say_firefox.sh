#! /bin/bash

typeset ff_cpu
typeset ff_cpu_int
typeset say_rate_in_wpm=400
typeset sleep_in_seconds=5
typeset ff_high_threshold=80
typeset ff_executable=/Applications/Firefox.app/Contents/MacOS/firefox
while true; 
do
    ps -A -o%cpu -ocommand | 
        grep -v grep |
        grep $ff_executable |
        # tee /dev/tty |
    while read ff_cpu junk
    do
        ff_cpu_int=${ff_cpu%.*}
        echo Firefox CPU = $ff_cpu_int
        if (( ff_cpu_int > ff_high_threshold)); then
            say -r ${say_rate_in_wpm} $ff_cpu_int
        fi
    done        

    sleep ${sleep_in_seconds};
done
