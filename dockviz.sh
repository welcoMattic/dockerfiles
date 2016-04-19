#!/bin/bash

USER="xataz"

echo "digraph g{" > dockviz.gviz
echo "rankdir=LR;ratio = fill;node [style=filled];" >> dockviz.gviz
	
	

for f in $(find . -iname Dockerfile | sed 's|^./||g');do
    image=${f%Dockerfile}
    base=${image%%\/*}
    build_dir=$(dirname $f)

    if [ -e ${build_dir}/.tags ]; then
	for tag in $(cat ${build_dir}/.tags); do
		echo "\"$(grep '^FROM' ${build_dir}/Dockerfile | awk '{print $2}')\" -> \"$USER/$base:$tag\"" >> dockviz.gviz	
	done
    else
        echo "\"$(grep '^FROM' ${build_dir}/Dockerfile | awk '{print $2}')\" -> \"$USER/$base:latest\"" >> dockviz.gviz
    fi
done

echo "}" >> dockviz.gviz
