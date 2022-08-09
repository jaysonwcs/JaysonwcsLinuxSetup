#!/usr/bin/env bash


TMPDIR=/home/jayson/Downloads/Output

if [ "$#" -eq 0 ]
then
    echo "usage: midi2mp3 file1.mid [file2.mid, file3.mid, ...]"
    exit 0
else
    for filename in "$@"
    do
        echo "${filename}"
        OUTPUT="$TMPDIR/0-${filename%.*}.flac"

        sox "${filename}" "${OUTPUT}" silence 1 0.001 0.1% 1 0.001 0.03% : newfile
    done
fi
