#!/bin/sh
MESSAGE="$1"
curl -H "Content-Type: application/json" -d "{\"content\": \"#TODO: $MESSAGE\"}" $DISCORD_WEBHOOK_TODO_URL
