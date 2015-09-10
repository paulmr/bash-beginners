#!/bin/bash

TOTAL=0

for f in *
do
    TOTAL=$(($TOTAL + $(stat -c "%s" $f)))
done

echo $TOTAL
