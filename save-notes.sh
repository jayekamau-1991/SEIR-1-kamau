#!/bin/bash

NOTES_FILE="$HOME/Class_7_ZION/Class 7.5/SEIR-1-notes/notes.txt"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$NOTES_FILE"
echo "Note saved to $NOTES_FILE"
