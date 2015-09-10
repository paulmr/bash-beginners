#!/bin/bash

shopt -s extglob                # make sure it's set

echo gzip !(*.gz)

# recursion? A bit more tricky ... (see `man find`)
