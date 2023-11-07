#!/bin/bash

url="https://www.google.com/search?q="

for term in "$@"
do
	url=$url"+"$term
done

lynx -restrictions=shell,suspend,exec,download,telnet_port,outside_ftp -cookies -accept_all_cookies $url
