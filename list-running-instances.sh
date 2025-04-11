#!/bin/bash

# Description: List all running EC2 instances in all regions of a specific AWS account

echo "Fetching all AWS regions..."
regions=$(aws ec2 describe-regions --query "Regions[].RegionName" --output text)

echo "Listing running EC2 instances in all regions..."
for region in $regions; do
    echo "Checking region: $region"
    
    instances=$(aws ec2 describe-instances \
        --region "$region" \
        --filters "Name=instance-state-name,Values=running" \
        --query "Reservations[].Instances[].InstanceId" \
        --output text)

    if [ -n "$instances" ]; then
        echo "Running instances in $region:"
        for instance in $instances; do
            echo "  $instance"
        done
    else
        echo "  No running instances found in $region."
    fi
done
