#!/bin/bash

if [ "${DOWNLOAD_PATH_SCRIPT}" ]
then
    echo "Downloading .mp3 in ${DOWNLOAD_PATH_SCRIPT}"
else 
    DOWNLOAD_PATH_SCRIPT=$(pwd)
fi

url="${1}"
videoname=$(youtube-dl "${url}" --get-title | tr "/" " ")

youtube-dl -f 140 "${url}" -o "${videoname}.m4a"

ffmpeg -i "${videoname}.m4a" "${DOWNLOAD_PATH_SCRIPT}/${videoname}.mp3" 

rm "${videoname}.m4a"


