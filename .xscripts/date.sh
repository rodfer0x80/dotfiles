#!/bin/sh

# Prints out the date

PREFIX=''

get_date()
{
    echo "$PREFIX $(date '+%a %d/%m')"
}

get_date
