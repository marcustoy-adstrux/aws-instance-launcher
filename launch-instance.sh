#! /bin/bash

# Setup dependencies
source ./lib/parse-yaml.sh
set_mount_directory_yq $(pwd)

source ./lib/aws-cli.sh
set_mount_directory_aws $(pwd)

#Configure AWS credentials if needed
aws_credential_directory=$(eval echo "~")/.aws
if [ ! -d "$aws_credential_directory" ]; then
    configure_aws
fi

# Load Configs
echo "Loading Configs.."

name=$(parse_arg config.yaml instance.name)
type=$(parse_arg config.yaml instance.type)
ami_id=$(parse_arg config.yaml instance.ami-id)
security_group=$(parse_arg config.yaml instance.security-group)
key_pair_name=$(parse_arg config.yaml instance.key-pair-name) 
subnet_id=$(parse_arg config.yaml instance.subnet-id) 

user_data_path=""
if [ $(parse_arg config.yaml instance.install-docker) = true ]; then
    user_data_path=file://$(get_working_directory)/install-scripts/install-docker.txt
fi

#Create Instance
echo "Creating Instance.."
create_instance $name $ami_id $type $key_pair_name $security_group $subnet_id $user_data_path
