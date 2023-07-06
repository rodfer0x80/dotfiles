#!/bin/sh

# Prints out the date

PREFIX='祥'

get_date()
{
    echo "$PREFIX $(date '+%H:%M:%S')"
}

get_date
