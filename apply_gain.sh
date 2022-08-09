#!/usr/bin/env bash

for file in /home/jayson/Downloads/Output/*
do
OUTPUT="${file##*/}"
#OUTPUT="${OUTPUT%.*}"
OUTPUT="/home/jayson/Downloads/Output/1-${OUTPUT}"
GAIN_TAG=$(metaflac --show-tag=REPLAYGAIN_TRACK_GAIN "${file}")
GAIN=${GAIN_TAG:22:5}
echo "Applying ${GAIN} to ${file}"
#echo $OUTPUT
#echo $GAIN
#echo "sox -G ${file} ${OUTPUT} gain ${GAIN}"
echo "====================================="
echo ""
sox -G "${file}" "${OUTPUT}" gain ${GAIN}
done