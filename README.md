# Useful Scripts

## Lambda Vars (lambda-vars)

> Environment: Linux / OSX

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

## Find in Files (windows)

> Environment: Windows

This command is super handy on windows machines. Ever need to look for a value
in a web.config, or searching a log file for a particular message? Just open a
powershell promt and run the following command

`findstr /S "<string you are looking for>" c:\Octopus\Applications\Q4WEB-PRD-VA\*.*`
