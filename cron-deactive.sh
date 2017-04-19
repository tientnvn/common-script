#!/usr/bin/env bash
CONTENT_TYPE="Content-Type: application/json"
LINK="http://127.0.0.1:url"
HEADER="Authorization: JWT xxx"
DEST="/data/output/xxx"
OUTPUT=${DEST}"output-deactivate.json"

# Create folder if it's not exist
mkdir -p ${DEST}

curl -X PUT -H "${CONTENT_TYPE}" -k "${LINK}" --header "${HEADER}" >> ${OUTPUT}
echo "" >> ${OUTPUT}
