#!/bin/sh

SOURCE_DIR=./examen01.assets/source
DEST_DIR=./examen01.assets

for i in $(ls "${SOURCE_DIR}"); do 
  convert "${SOURCE_DIR}/${i}" -channel RGB -negate "${DEST_DIR}/${i}"
done
