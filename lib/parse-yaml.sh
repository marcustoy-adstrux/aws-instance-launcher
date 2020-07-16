#! /bin/bash

directory_to_mount=""

yq() {
  docker run --rm -i -v $directory_to_mount:/workdir mikefarah/yq yq "$@"
}

function set_mount_directory_yq {
  directory_to_mount=$1
}

function parse_arg {
  yq r $1 $2
}

function parse_array {
  yq r $1 --collect $2
}