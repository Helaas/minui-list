#!/bin/sh
PAK_DIR="$(dirname "$0")"
PAK_NAME="$(basename "$PAK_DIR")"
PAK_NAME="${PAK_NAME%.*}"
set -x

rm -f "$LOGS_PATH/$PAK_NAME.txt"
exec >>"$LOGS_PATH/$PAK_NAME.txt"
exec 2>&1

echo "$0" "$@"
cd "$PAK_DIR" || exit 1

main_screen() {
    echo -e "item1\nitem2\nitem3" >"$PAK_DIR/list.txt"
    "$PAK_DIR/minui-list-tg5050" --format text --file "$PAK_DIR/list.txt"
    # echo "main_screen"
    exit 0
}

main() {
    output=$(main_screen)
    echo "output: $output"
}

main