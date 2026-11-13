#!/bin/bash

# Inputs
FREQ_RESULT=$1
GITHUB_USER=$2
TIMESTAMP=$(date)

cd /app

# Update README
echo -e "\n[$GITHUB_USER - $FREQ_RESULT - $TIMESTAMP]" >> README.md

# Configure Git to use GitHub Actions user and email
git config --global --add safe.directory /app
git config --global user.name "github-actions"
git config --global user.email "github-actions@users.noreply.github.com"

# Use the workflow token so the push is allowed
if [ -n "$GITHUB_TOKEN" ] && [ -n "$GITHUB_REPOSITORY" ]; then
  git remote set-url origin "https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
fi

# Add README.md to git, commit, and push the changes
git add README.md
git commit -m "Update README with vowel frequency results" || echo "No changes to commit"
git pull --rebase origin main || true
git push origin HEAD:main
