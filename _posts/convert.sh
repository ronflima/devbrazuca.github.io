#!/bin/bash

for a in *.html
do
    output="$(basename -s .html $a).md"
    pandoc -f html -t markdown_strict $a -o $output 
done
