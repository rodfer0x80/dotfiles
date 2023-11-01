#!/bin/bash
cat ./packages.txt | xargs apt install
rm ./packages.txt
