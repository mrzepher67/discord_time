#!/bin/bash

date_override="$(date +%s)"
format="t"

display_help() {
        echo "-h,                       show help"
        echo "-d,                       override time (man date --date)"
        echo "-f,                       discord display format, "t" by default"
        echo "          "t"     short time      00:00 AM"
        echo "          "T"     long time       00:00:00 AM"
        echo "          "d"     short date      MM/DD/YY"
        echo "          "D"     long date       Month DD, YYYY"
        echo "          "f"     D + t           Month DD, YYYY at 00:00 AM"
        echo "          "D"     f + weekday     Day, Month DD, YYYY at 00:00AM"
        echo "          "R"     relative        00 minutes/hours/days ago"
        echo "sh dtime.sh -d 9:00AM tomorrow -f D"
        echo ""
}

while getopts ":h:d:f:" opt; do
        case ${opt} in
                h) display_help; exit 0;;
                d) date_override="$(date -d "${OPTARG}" +%s)";;
                f) format="${OPTARG}";;
                *) echo "unknown arg ${OPTARG}"; display_help; exit 0;;
        esac
done

echo "<t:${date_override}:${format}>"
