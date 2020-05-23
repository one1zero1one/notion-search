#!/usr/bin/env bash

INDEX_PATH="$HOME/.notion_pages_index" 
TOKEN_PATH="$HOME/.notion_token"
SPACE_ID="$HOME/.notion_space_id"

token=$(cat $TOKEN_PATH)
space=$(cat $SPACE_ID)

echo $1

if [[ $1 == '--build-index' ]]; then
    curl -s 'https://www.notion.so/api/v3/searchBlocks' \
      -H 'content-type: application/json' \
      -H "cookie: token_v2=$token;" \
      --data-binary "{\"query\":\"\",\"table\":\"space\",\"id\":\"$space\",\"limit\":10000}" \
      --compressed \
      | jq -r '.recordMap.block[].value | "\(.id)   \(.properties.title[0][0])"' \
      > $INDEX_PATH
else
    cat $INDEX_PATH\
      | fzf \
      | cut -f 1 -d ' ' \
      | sed -e 's/-//g' \
      | awk '{print "https://notion.so/"$1}' \
      | xargs open
fi
