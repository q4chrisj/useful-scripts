aws lambda list-functions --region us-east-1 --query 'Functions[*].[FunctionName]' --output text | 
  xargs -I {} aws lambda get-function-configuration --region us-east-1 --function-name {} | 
  jq -c 'select(.Environment.Variables!=null) | {FunctionName, Environment}'

