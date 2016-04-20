#!/bin/bash

USER="xataz"
FILE=dockviz.dot

echo "digraph g{" > $FILE
echo "rankdir=LR;ratio = fill;node [style=filled];" >> $FILE
	
	

for f in $(find . -iname Dockerfile | sed 's|^./||g');do
    image=${f%Dockerfile}
    base=${image%%\/*}
    build_dir=$(dirname $f)

    if [ -e ${build_dir}/.tags ]; then
	for tag in $(cat ${build_dir}/.tags); do
		echo "\"$(grep '^FROM' ${build_dir}/Dockerfile | awk '{print $2}')\" -> \"$USER/$base:$tag\"" >> $FILE
	done
    else
        echo "\"$(grep '^FROM' ${build_dir}/Dockerfile | awk '{print $2}')\" -> \"$USER/$base:latest\"" >> $FILE
    fi
done

echo "}" >> $FILE

if [ "$1" == "svg" ]; then
    cat $FILE | dot -Tsvg -o dockviz.svg
fi
