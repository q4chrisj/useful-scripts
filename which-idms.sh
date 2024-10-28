# Get a list of instances that have HttpTokens set to 'ooptional' which indicates they are running IDMSV1

if [[ $1 = "" ]]
then
  echo "Please provide a region to check instances for IDMSV1"
  exit 1
fi

region=$1
aws ec2 describe-instances --query "Reservations[*].Instances[*].{InstanceId:InstanceId,  MetadataOptions:MetadataOptions.HttpTokens, Name:Tags[?Key=='Name']|[0].Value}" --region $region --output json | 
  jq -r '.[] | .[] | [.InstanceId, .MetadataOptions, .Name] | @tsv'

