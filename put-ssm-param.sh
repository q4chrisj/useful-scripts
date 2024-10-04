#!/bin/bash

set -e

if [[ $1 = "" ]]
then
  echo "Please provide a name for the parameter"
  exit 1
fi

if [[ $2 = "" ]]
then
  echo "Please provide a value for the parameter"
  exit 1
fi

if [[ $3 = "" ]]
then
  echo "Please provide a region"
  exit 1
fi

paramName=$1
paramValue=$2
region=$3
overwrite=$4
secure=$5

if [[ $region = "" ]]
then
  region="us-east-1"
fi

echo "Adding parameter: $paramName with value: $paramValue"

command=("aws ssm put-parameter --region $region --name $paramName --value $paramValue --type String --no-cli-pager")

if [[ $overwrite = "overwrite" ]]
then
  echo "Overwriting parameter"
  command+=("--overwrite")
fi

if [[ $secure = "secure" ]]
then
  command+=("--type SecureString")
fi

${command[@]}
