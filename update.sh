#!/bin/bash

# This script is for CI updates

# Check to see if it has changed
git status --short LAST_SEEN | grep -s "M" || exit 0

# setup
git config user.email datatracker_bot@example.com
git config user.name bot
git remote set-url --push origin https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY
git checkout -B main origin/main

# Push the changes
git add LAST_SEEN
git commit -m "update LAST_SEEN"
git push origin main
