#!/bin/sh
set -e

case "$*" in
  npm*start*)
    baseDir="$GHOST_SOURCE/content"
    for dir in "$baseDir"/*/ "$baseDir"/themes/*/; do
      targetDir="$GHOST_CONTENT/${dir#$baseDir/}"
      mkdir -p "$targetDir"
      if [ -z "$(ls -A "$targetDir")" ]; then
        tar -c -C "$dir" . | tar xC "$targetDir"
      fi
    done

    if [ ! -e "$GHOST_CONTENT/config.js" ]; then
      cp "$GHOST_SOURCE/config.example.js" "$GHOST_CONTENT/config.js"
    fi

    ln -sf "$GHOST_CONTENT/config.js" "$GHOST_SOURCE/config.js"

    set -- gosu user "$@"
  ;;
esac
exec "$@"
