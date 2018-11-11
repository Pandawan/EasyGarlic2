#!/bin/bash

RELEASE=$(curl -s https://api.github.com/repos/PandawanFr/EasyGarlic2/releases/latest)
RELEASE_ID=$(node -pe 'JSON.parse(process.argv[1]).id' "$RELEASE")

RELEASES=$(find dist/ -maxdepth 1 | grep -i 'EasyGarlic' | grep -v 'blockmap')

IFS=$'\n'
for f in $RELEASES; do
    BN=$(node -pe 'encodeURIComponent(process.argv[1])' $(basename $f))
    UPLOAD_URL="https://uploads.github.com/repos/PandawanFr/EasyGarlic2/releases/$RELEASE_ID/assets?name=$BN"
    TYPE=$(file --mime-type "$f" | awk '{print $NF}')
    curl -v --data-binary "@$f" -H "Content-Type: $TYPE" -H "Authorization: token $GH_TOKEN" $UPLOAD_URL
done