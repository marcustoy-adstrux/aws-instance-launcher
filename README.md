# AWS Instance Launcher

This kit includes convenience scripts to automate the setting up of EC2 instances.

## Prerequisite
1. Make sure to have docker installed and running in your local machine as this kit uses aws-cli tools and several other dependencies that relies on docker images.
2. Make sure to have set up the following in your aws account:
- VPC
- Subnets
- Routing Tables
- NACL
- Security Groups
3. Make sure to have a valid aws key-pair to use for the instance generation.
4. Make sure to enable CLI access for the IAM account you will be using for this instance generation.

## How To Use
1. Configure the config-sample.yaml to your desired settings and rename it to config.yaml.
2. Run `bash launch-instance.sh`.

## Notice
1. This kit is configured to only work with mac and linux file systems. If you are using windows, you may have to change the structure of the file paths used in the source codes, in order for the kit to work as intended.
