#!/bin/bash

# Auto-commit and push git repos every 2 hours
# 
# CRON SETUP:
#   Run: crontab -e
#   Add the following line:
#   0 */2 * * * /Users/apple/Documents/config/git-autocommit.sh >> /tmp/git-autocommit.log 2>&1
#
#   To verify it's set: crontab -l
#   To remove it: crontab -e  (then delete the line)

# List of directories to check
DIRS=(
    "$HOME/Documents/files"
    "$HOME/Documents/dotfiles"
    "$HOME/Documents/config"
)

# Commit message: e.g. "30apr"
COMMIT_MSG=$(date +"%d%b" | tr '[:upper:]' '[:lower:]')

for DIR in "${DIRS[@]}"; do
    if [ ! -d "$DIR/.git" ]; then
        echo "[$(date)] Skipping $DIR — not a git repo"
        continue
    fi

    cd "$DIR" || continue

    # Check for changes
    if git status --porcelain | grep -q .; then
        echo "[$(date)] Changes found in $DIR — committing..."
        git add -A
        git commit -m "$COMMIT_MSG"
        git push
        echo "[$(date)] Done: $DIR"
    else
        echo "[$(date)] No changes in $DIR"
    fi
done
