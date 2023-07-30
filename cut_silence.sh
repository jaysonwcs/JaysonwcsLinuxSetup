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
        OUTPUT="$TMPDIR/1-${filename%.*}.flac"

        #fluidsynth -q -C 0 -f /home/jayson/config.fluidsynth -F "${WAVFILE}" "${filename}"
        sox "${filename}" "${OUTPUT}" silence -l 1 0.0 0%
    done
fi
