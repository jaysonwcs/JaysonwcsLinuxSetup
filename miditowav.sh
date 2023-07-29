#!/usr/bin/env bash


#SOUNDFONT=/Users/kroger/Dropbox/Sfonts/BOPLMEVF16.sf2
TMPDIR=/home/jayson/Downloads/Output

#if [[ ! -f $SOUNDFONT ]]
#then
#    echo "Couldn't find the soundfont: $SOUNDFONT"
#    exit 1
#fi


if [ "$#" -eq 0 ]
then
    echo "usage: midi2mp3 file1.mid [file2.mid, file3.mid, ...]"
    exit 0
else
    for filename in "$@"
    do
        echo "${filename}"
        WAVFILE="$TMPDIR/${filename%.*}.wav"

        fluidsynth -q -C 0 -f /home/jayson/config.fluidsynth -F "${WAVFILE}" "${filename}"
#        fluidsynth -f config.fluidsynth -F "${WAVFILE}" $SOUNDFONT "${filename}" && \
#            lame "${WAVFILE}" && \
#            rm "${WAVFILE}"
    done
fi
