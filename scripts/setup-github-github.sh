#!/bin/bash
# Used to setup the .github folder in a repo

# To use user/pass instead
# Replace: "-H "Authorization: token $TOKEN" "
# with: "--user "$USER:$PASS""
# echo -n "GitHub User: "
# read USER
#
# echo -n "GitHub Password: "
# read -s PASS

cd ..
DIR="$(pwd)"

TYPE=group


echo -n "Token: "
read TOKEN

echo ""
echo -n "GitHub Repo (e.g. foo/bar): "
read REPO

REPO_USER=$(echo "$REPO" | cut -f1 -d /)

REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

REPO_DIR=$DIR/ignore/githubreposetup
echo $REPO_DIR
git clone git@github.com:$REPO_USER/$REPO_NAME.git $REPO_DIR
cd $REPO_DIR
echo $(pwd)
git checkout -B github-folder
mkdir .github
cp $DIR/markdowns/.github/contributing-$TYPE.md .github/CONTRIBUTING.md
cp $DIR/markdowns/.github/issue-$TYPE.md .github/ISSUE_TEMPLATE.md
cp $DIR/markdowns/.github/pull-$TYPE.md .github/PULL_REQUEST_TEMPLATE.md
