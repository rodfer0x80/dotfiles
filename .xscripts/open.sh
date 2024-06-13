#!/bin/sh

open()
{
    if [ "$1" == "" ]; then
        url=$(xclip -o)
    else
        url="$1"
    fi

    if [ -z "$url" ]; then
        exit 1
    fi

    case "$url" in 
        *mkv|*webm|*mp4|*mp3|*youtube.com/watch|*youtube.com/playlist*|*youtube.com/shorts|*youtu.be|*hooktube.com|*bichute.com|*videos.lukesmith.xyz|*odysee.com*)
            setsid -f mpv -quiet "$url" >/dev/null 2>&1 ;;
        ^http*png|^http*jpg|http*jpe|http*jpeg|http*svg|http*bmp|https*svg|https*svg|http*gif|^https*png|^https*jpg|https*jpe|https*jpeg|https*gif)
            curl -sL "$url" > "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")";  setsid -f display -a "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")" >/dev/null 2>&1 & ;;
        *png|*jpg|*jpeg|*bmp|*svg|*gif)
            setsid -f display "$url" >/dev/null 2>&1 & ;;
        ^http*pdf|^https*pdf) 
            curl -sL "$url" > "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")" &&  setsid -f zathura "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")" >/dev/null 2>&1 &;;
        *pdf)
            setsid -f zathura "$url" >/dev/null 2>&1 & ;;
        *txt|*html|*csv|*yaml|Dockerfile|dockerfile|makefile|Makefile|*c|*cpp|*h|*hpp|*py|*hs|*rs|*css|*js|*pl|*php)
            setsid -f vim "$url" ;;
        ^http*|^https*)
            setsid -f "$BROWSER" "$url" >/dev/null 2>&1 & ;;
        ^http*odg|^http*docx)
            curl -sL "$url" > "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")" &&  setsid -f libreoffice "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")" >/dev/null 2>&1 &;;
        *odg|*docx|*odt)
            setsid -f libreoffice "$url" >/dev/null 2>&1 & ;;
        *)
            return 2
    esac
}

open "$1"
