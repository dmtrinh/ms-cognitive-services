#!/bin/bash

API_ENDPOINT=https://api.cognitive.microsoft.com/bing/v5.0/suggestions/

if [ $# -gt 1 ]
then
    # Grab all parameters, starting with the second, as one query string
    QUERY="${@:2}"
    echo "QUERY STRING: $QUERY"

    curl -v --get $API_ENDPOINT \
        -H "Ocp-Apim-Subscription-Key: $1" \
        --data-urlencode q="$QUERY" \
        | jq '.'
#        --data-ascii "{body}"
else
    printf "Syntax: \n   %s [APISubscriptionKey] [QueryString]\n" "$0"
fi
