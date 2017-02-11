#!/bin/bash

API_ENDPOINT=https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/languages

buildRequestBody () {
    if [ $# -gt 0 ]
    then
      printf "{  \"documents\": [ { \"id\": \"string\", \"text\": \"%s\" } ] }" "${*:1}"
    else
      printf ""
    fi
}

if [ $# -gt 1 ]
then
    REQUESTBODY=$(buildRequestBody "${*:2}")
    echo "REQUESTBODY: $REQUESTBODY"

    curl -v $API_ENDPOINT \
        -H "Content-Type: application/json" \
        -H "Ocp-Apim-Subscription-Key: $1" \
        --data-ascii "$REQUESTBODY" \
        | jq '.'
else
    printf "Syntax: \n   %s [APISubscriptionKey] [RequestBody]\n" "$0"
fi

