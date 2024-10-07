#!/bin/sh


CWD="$PWD"
BIN=~/library/spleeter
OUTPUT=~/music/splits
SOUND_FILE="$1"
STEMS="$2"

if [ "$SOUND_FILE" == "" ];then
    # stems
    # 2 == vocals + instrumental
    # 4 == vocals + bass + drums + instrumental
    # 5 == vocals + bass + dums + piano + instrumental
    echo "Usage: spleezer <sound_file> <stems(2/4/5)>"
    exit 1
fi
if [ "$STEMS" == "" ];then
    echo "Usage: spleezer <sound_file> <stems(2/4/5)>"
    exit 2
fi

cd "$BIN"
test -e "$OUTPUT" || mkdir -p "$OUTPUT"
test -e "$SOUND_FILE" || SOUND_FILE="$CWD/$SOUND_FILE"
poetry run spleeter separate -p spleeter:"$STEMS"stems -o "$OUTPUT" "$SOUND_FILE"

cd "$CWD"
exit 0

