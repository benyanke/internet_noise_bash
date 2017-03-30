#!/bin/bash

upperWaitTime=""
lowerWaitTime=""

threads="3"

wordFile="nouns.list"


urlencode() {
    # urlencode <string>
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C

    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done

    LC_COLLATE=$old_lc_collate
}

function getRandomWord() {
#  sort -R $wordFile | head -n 100
  shuf -n 2 $wordFile
}


function makeRequestFromWords() {

  encodedWords="$(urlencode "$@")"
  echo $@
  echo $encodedWords

#  curl "https://www.google.com/search?btnI&q="$encodedWords
  echo "https://www.google.com/search?btnI&q="$encodedWords

}


makeRequestFromWords `getRandomWord` `getRandomWord`


