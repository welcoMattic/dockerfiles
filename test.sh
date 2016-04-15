#!/bin/bash

# this is kind of an expensive check, so let's not do this twice if we
# are running more than one validate bundlescript
VALIDATE_REPO='https://github.com/xataz/dockerfiles.git'
VALIDATE_BRANCH='master'
VALIDATE_USER='xataz'


VALIDATE_HEAD="$(git rev-parse --verify HEAD)"

git fetch -q "$VALIDATE_REPO" "refs/heads/$VALIDATE_BRANCH"
VALIDATE_UPSTREAM="$(git rev-parse --verify FETCH_HEAD)"

VALIDATE_COMMIT_DIFF="$VALIDATE_UPSTREAM...$VALIDATE_HEAD"

validate_diff() {
	if [ "$VALIDATE_UPSTREAM" != "$VALIDATE_HEAD" ]; then
		git diff "$VALIDATE_COMMIT_DIFF" "$@"
	else
		git diff HEAD~ "$@"
	fi
}


deps_pull() {
    image=$1
    # alpine/3.3/.tags:3.3 latest


    if [[ $image == ${VALIDATE_USER}* ]];then
        local image_name=$(echo $image | sed 's|\(.*\)/\(.*\):\(.*\)|\2|g')
        local image_tag=$(echo $image | sed 's|\(.*\)/\(.*\):\(.*\)|\3|g')
        local image_path=$(dirname $(grep $image_tag $(find $image_name -type f -name .tags) | cut -d: -f1))
    else
        local image_name=$(echo $image | sed 's|\(.*\):\(.*\)|\1|g')
        local image_tag=$(echo $image | sed 's|\(.*\):\(.*\)|\2|g')
    fi

    if [ -z $image_path ];then
        deps_pull $image_name
        docker build -t ${VALIDATE_USER}/${image_name}:${image_tag} ${image_path}
    else
        docker pull ${image_name}
    fi
}

build_image() {
    image_name=$1
    image_dir=$2

    if [ -x "${image_dir}/.tags" ]; then
        tags_list=$(cat ${image_dir}/.tags)
    else
        tags_list="latest"
    fi

    for tag in $tags_list; do
        docker build -t ${image_name}:${image_tag} ${image_dir}
    done
}

# get the dockerfiles changed
IFS=$'\n'
files=( $(validate_diff --name-only -- '*Dockerfile') )
unset IFS

# build the changed dockerfiles
for f in "${files[@]}"; do
	image=${f%Dockerfile}
	base=${image%%\/*}
	build_dir=$(dirname $f)

    deps_pull $(grep 'FROM' ${build_dir}/Dockerfile | awk '{print $2}')
    build_image ${base} ${build_dir}

	echo "                       ---                                   "
	echo "Successfully built ${base}:${suite} with context ${build_dir}"
	echo "                       ---                                   "
done
