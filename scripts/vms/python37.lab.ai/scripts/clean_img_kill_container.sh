#!/bin/sh
docker kill $(docker ps -aqf "name=^rodfer0x80/python37.lab.ai$")
docker images rm -f rodfer0x80/python37.lab.ai 
