#!/bin/bash

set -e

EMOJI_WORKING=(
    "👷 Working..."
    "🏃 Running..."
    "🏗 Building..."
    "🚧 Building..."
)
STARTING_MESSAGE=${EMOJI_WORKING[$[$RANDOM % ${#EMOJI_WORKING[@]}]]}

EMOJI_SUCCESS=(
    "💯 Done!"
    "🚢 Ship it!"
    "🚀 Awesome!"
  )
SUCCESS_MESSAGE=${EMOJI_SUCCESS[$[$RANDOM % ${#EMOJI_SUCCESS[@]}]]}

echo "$STARTING_MESSAGE"
echo ""

echo "   Building with marp..."
echo ""
mkdir output
marp ${MARP_ARGS}
echo "✔  Built Successfully!"
echo ""

echo "   Publishing to ${GITHUB_REPOSITORY} ${REMOTE_BRANCH}..."
echo ""

cd output/
remote_repo="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" && \
git init && \
git config user.name "marp-action" && \
git config user.email "marp-action@users.noreply.github.com" && \
git add . && \
echo -n 'Files to Commit:' && ls -l | wc -l && \
git commit -m'action build' > /dev/null 2>&1 && \
git push --force $remote_repo master:${REMOTE_BRANCH}> /dev/null 2>&1 && \
echo "✔  Pushed Successfully!"
echo ""

echo "$SUCCESS_MESSAGE"

