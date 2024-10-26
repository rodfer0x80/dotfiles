#!/bin/sh

echo $(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1)
