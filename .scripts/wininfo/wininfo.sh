#!/bin/bash
#
#	~/.scripts/wininfo/wininfo.sh
#
#
#

get_title() {
    echo "window title"
}

get_class() {
    echo "window class"
}

get_id() {
    echo "window id"
}

case $1 in
    --title) get_title ;;
    --class) get_class ;;
    --id) get_id ;;
    *) tail ~/.scripts/wininfo/wininfo.sh ;;
esac
