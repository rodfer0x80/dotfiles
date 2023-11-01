#!/bin/sh

# Prints out the date

PREFIX='󰔛'

get_date()
{
    echo "$PREFIX $(date '+%H:%M:%S')"
}

get_date
