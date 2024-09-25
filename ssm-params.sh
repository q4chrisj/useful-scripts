if [[ $1 = "" ]]
then
  echo "Please provide a path to get parameters from"
  exit 1
fi

paramPath=$1

echo "Getting parameters from path: $paramPath"

aws ssm get-parameters-by-path --region us-east-1 --path $paramPath --query 'Parameters[*].[Name]' --output text | 
  xargs -I {} aws ssm get-parameter --region us-east-1 --name {} | 
  jq -c '.Parameter | {Name, Value}'

