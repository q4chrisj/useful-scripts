# Useful Scripts

## Lambda Vars (lambda-vars)

This script will search through all the lambdas in a given AWS account (based on
your local credentials) and will collect all the environment variables (if
present) from each lambda function in us-east-1.

The following example will collect all environment variables and write them to a
file located at `~/temp/lambda-vars-output.json`

`./lambda-vars.sh > ~/temp/lambda-vars-output.json`

The `lambda-vars-output.json` file will contain one JSON object per function
found.

```
{
   "FunctionName":"q4studio-publicapi-index-test-GetOwnershipSummary",
   "Environment":{
      "Variables":{
         "variable1":"variable1_value",
         "variable2":"variable2_value",
      }
   }
}
```
