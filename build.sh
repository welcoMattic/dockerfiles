#!/bin/bash
# this is kind of an expensive check, so let's not do this twice if we
# are running more than one validate bundlescript
REPO='https://gogs.boxobox.xyz/xataz/dockerfiles.git'
BRANCH='master'
USER='xataz'
DOCKER_PULL=$1

HEAD="$(git rev-parse --verify HEAD)"

git fetch -q "$REPO" "refs/heads/$BRANCH"
UPSTREAM="$(git rev-parse --verify FETCH_HEAD)"

COMMIT_DIFF="$UPSTREAM...$HEAD"

validate_diff() {
	if [ "$UPSTREAM" != "$HEAD" ]; then
		git diff "$COMMIT_DIFF" "$@"
	else
		git diff HEAD~ "$@"
	fi
}


deps_pull() {
    image=$1
    images_list=""
    image_path=${build_dir}

    while true; do
        image=$(grep 'FROM' ${image_path}/Dockerfile | awk '{print $2}')
        if [[ $image == ${USER}* ]];then
            image_name=$(echo $image | cut -d/ -f 2 | cut -d: -f1)
            image_tag=${latest-$(echo $image | cut -d: -f2)}
            [ $image_name == $image_tag ] && image_tag='latest'
            
            if [ "$(find ${image_name} -type f -name .tags)" == "" ]; then
                image_path=${image_name}
            else
                image_path=$(dirname $(grep ${image_tag} $(find ${image_name} -type f -name .tags) | cut -d: -f1))
            fi
            images_list="${image_name}|${image_tag}|${image_path} "${images_list}
        else
            docker pull ${image}
            break
        fi
    done

    for f in ${images_list[@]}; do
        f_name=$(echo $f | cut -d"|" -f1)
        f_tag=$(echo $f | cut -d"|" -f2)
        f_path=$(echo $f | cut -d"|" -f3)
        build_image ${f_name} ${f_path}
    done 

}

deps_pull_test() {
    image=$1
    images_list=""
    image_path=$2

    while true; do
        image=$(grep 'FROM' ${image_path}/Dockerfile | awk '{print $2}')
        if [[ $image == ${USER}* ]];then
            image_name=$(echo $image | cut -d/ -f 2 | cut -d: -f1)
            image_tag=${latest-$(echo $image | cut -d: -f2)}
            echo $image_name $image_tag $image_path
            [ $image_name == $image_tag ] && image_tag='latest' && image_name=$(echo $image_name | cut -d/ -f2)
            
            if [ "$(find ${image_name} -type f -name .tags)" == "" ]; then
                image_path=${image_name}
            else
                image_path=$(dirname $(grep ${image_tag} $(find ${image_name} -type f -name .tags) | grep -v ${image_path} cut -d: -f1))
            fi
            images_list="${image_name}|${image_tag}|${image_path} "${images_list}
        else
            echo "docker pull ${image}"
            break
        fi
    done
    echo ${images_list[@]}
    for f in ${images_list[@]}; do
        f_name=$(echo $f | cut -d"|" -f1)
        f_tag=$(echo $f | cut -d"|" -f2)
        f_path=$(echo $f | cut -d"|" -f3)
        echo "build_image_test ${f_name} ${f_path}"
        build_image_test ${f_name} ${f_path}
    done 

}

build_image() {
    image_name=$1
    image_dir=$2

    if [ -e "${image_dir}/.tags" ]; then
        tags_list=$(cat ${image_dir}/.tags)
    else
        tags_list="latest"
    fi

    for tag in $tags_list; do
        docker build -t ${USER}/${image_name}:${tag} ${image_dir}
        if [ $? == 0 ]; then
            echo "                       ---                                   "
            echo "Successfully built ${USER}/${image_name}:${tag} with context ${image_dir}"
            echo "                       ---                                   "
            if [ "$DOCKER_PULL" == "push" ]; then
                docker push ${USER}/${image_name}:${tag}
                echo "                       ---                                   "
                echo "Successfully push ${USER}/${image_name}:${tag}"
                echo "                       ---                                   "
            fi
        else
            echo "                       ---                                   "
            echo "Failed built ${USER}/${image_name}:${tag} with context ${image_dir}"
            echo "                       ---                                   "
            exit 1
        fi
    done
}

build_image_test() {
    image_name=$1
    image_dir=$2

    if [ -e "${image_dir}/.tags" ]; then
        tags_list=$(cat ${image_dir}/.tags)
    else
        tags_list="latest"
    fi

    for tag in $tags_list; do
        echo "build ${USER}/${image_name}:${tag} ${image_dir}"
        if [ $? == 0 ]; then
            echo "                       ---                                   "
            echo "Successfully built ${USER}/${image_name}:${tag} with context ${image_dir}"
            echo "                       ---                                   "
            if [ "$DOCKER_PULL" == "push" ]; then
                echo "push ${USER}/${image_name}:${tag}"
                echo "                       ---                                   "
                echo "Successfully push ${USER}/${image_name}:${tag}"
                echo "                       ---                                   "
            fi
        else
            echo "                       ---                                   "
            echo "Failed built ${USER}/${image_name}:${tag} with context ${image_dir}"
            echo "                       ---                                   "
            exit 1
        fi
    done
}

# get the dockerfiles changed
IFS=$'\n'
files=( $(validate_diff --diff-filter=ACMRTUX --name-only -- '*Dockerfile') )
unset IFS

# build the changed dockerfiles
for f in "${files[@]}"; do
	image=${f%Dockerfile}
	base=${image%%\/*}
	build_dir=$(dirname $f)
    
    echo $f $image $base $build_dir

    #deps_pull ${base}
    #build_image ${base} ${build_dir}
    deps_pull_test ${base} ${build_dir}
    build_image_test ${base} ${build_dir}
done
