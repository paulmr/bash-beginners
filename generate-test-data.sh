#!/bin/bash

LIPSUM_FILE="./lipsum.txt"
LENGTH=$(wc -l $LIPSUM_FILE | awk '{ print $1}')

SEP=","

APPS=("jumper" "runner" "swimmer" "shooter")

function rand {
    echo $(($RANDOM % $1))
}

function random_text {
    local NUM
    MAX=$(($LENGTH - 1))
    NUM=$(($(rand $MAX) + 1))
    sed -ne "${NUM}p" <$LIPSUM_FILE 
}

function random_app {
    echo ${APPS[$(rand ${#APPS[@]})]}
}

function random_date {
    local NUM=$(rand 168)
    date -d"$NUM hours ago"
}

function random_line {
    echo $(random_date)${SEP}$(random_app)${SEP}\"$(random_text)\"
}

COUNT=${1:-10000}

for ((i=0 ; i < $COUNT ; i++))
do
    random_line
done

