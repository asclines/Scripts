#!/bin/bash

# TO use user/pass instead
# Replace: "-H "Authorization: token $TOKEN" "
# with: "--user "$USER:$PASS""
# echo -n "GitHub User: "
# read USER
#
# echo -n "GitHub Password: "
# read -s PASS

echo -n "Token: "
read -s TOKEN

echo ""
echo -n "GitHub Repo (e.g. foo/bar): "
read REPO

REPO_USER=$(echo "$REPO" | cut -f1 -d /)

REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

# Delete default labels

curl -H "Authorization: token $TOKEN" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug"
curl -H "Authorization: token $TOKEN" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate"
curl -H "Authorization: token $TOKEN" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement"
curl -H "Authorization: token $TOKEN" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help%20wanted"
curl -H "Authorization: token $TOKEN" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/invalid"
curl -H "Authorization: token $TOKEN" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/question"
curl -H "Authorization: token $TOKEN" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/wontfix"

# Create labels
curl -H "Authorization: token $TOKEN" --include --request POST --data '{"name":"Priority","color":"d93f0b"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -H "Authorization: token $TOKEN" --include --request POST --data '{"name":"Discussion","color":"CC317C"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -H "Authorization: token $TOKEN" --include --request POST --data '{"name":"Question","color":"CC317C"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -H "Authorization: token $TOKEN" --include --request POST --data '{"name":"Bug","color":"e74c3c"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -H "Authorization: token $TOKEN" --include --request POST --data '{"name":"Enhancement","color":"5EBEFF"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -H "Authorization: token $TOKEN" --include --request POST --data '{"name":"Feature Request","color":"91CA55"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -H "Authorization: token $TOKEN" --include --request POST --data '{"name":"Testing","color":"f1c40f"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -H "Authorization: token $TOKEN" --include --request POST --data '{"name":"Documentation","color":"FEF2C0"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -H "Authorization: token $TOKEN" --include --request POST --data '{"name":"Chore","color":"FEF2C0"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"



# Language & Technology Specific, UNCOMMENT per project
# curl -H "Authorization: token $TOKEN" --include --request POST --data '{"name":"TECH","color":"BFD4F2"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -H "Authorization: token $TOKEN" --include --request POST --data '{"name":"Java","color":"BFD4F2"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -H "Authorization: token $TOKEN" --include --request POST --data '{"name":"Gradle","color":"BFD4F2"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -H "Authorization: token $TOKEN" --include --request POST --data '{"name":"XML","color":"BFD4F2"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
