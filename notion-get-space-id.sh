#!/usr/bin/env bash

TOKEN_PATH="$HOME/.notion_token"
token=$(cat $TOKEN_PATH)

curl -s 'https://www.notion.so/api/v3/getPublicPageData' \
  -H 'content-type: application/json' \
  -H "cookie: token_v2=$token;" \
  --data-binary "{\"spaceDomain\":\"$1\"}" \
  --compressed \
  | jq -r '.spaceId'
