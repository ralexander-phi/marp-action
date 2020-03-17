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
marp ${MARP_ARGS}
echo "✔  Built Successfully!"

exit 0



remote_repo="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" && \
remote_branch="gh-pages" && \
git init && \
git config user.name "${GITHUB_ACTOR}" && \
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com" && \
git add . && \
echo -n 'Files to Commit:' && ls -l | wc -l && \
git commit -m'action build' > /dev/null 2>&1 && \
git push --force $remote_repo master:$remote_branch > /dev/null 2>&1 && \

echo "$SUCCESS_MESSAGE"

