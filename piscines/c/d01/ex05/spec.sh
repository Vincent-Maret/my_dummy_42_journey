#!/bin/bash

FILE_NAME=\"\\\?$\*\'KwaMe\'\*$\?\\\"

mustFindFile() {
  match_count=$(ls | cat -e | grep -F --count $FILE_NAME)
  if [ "$match_count" -eq 1 ]; then
    echo "File found"
  else
    echo "Error: Files matching count should be equal to 1"
    exit 1
  fi 
}

mustBeStrictlyEqualTo42() {
  file_contents=$(cat $FILE_NAME)
  if [ "$file_contents" -eq 42 ]; then
    echo "File contents are strictly equal to 42"
  else
    echo "Error: File contents should be strictly equal to 42"
    exit 1
  fi
}

test() {
  mustFindFile
  mustBeStrictlyEqualTo42
}

test
