#! /bin/bash

directory_to_mount=""
working_directory_aws="/aws"

aws() {
 docker run --rm -it -v ~/.aws:/root/.aws -v $directory_to_mount:$working_directory_aws amazon/aws-cli:latest "$@" 
}

function set_mount_directory_aws {
  directory_to_mount=$1
}

function get_working_directory {
  echo $working_directory_aws
}

function configure_aws {
  aws configure
}

function create_instance {
  instance_name=ResourceType=instance,Tags=[{Key=Name,Value="$1"}]

  user_data=""
  if [ ! -z "$7" ]; then
    user_data="--user-data $7"
  fi

  aws ec2 run-instances \
  --image-id $2 \
  --count 1 \
  --instance-type $3 \
  --key-name $4 \
  --security-group-ids $5 \
  --subnet-id $6 \
  --tag-specifications $instance_name \
  $user_data
}