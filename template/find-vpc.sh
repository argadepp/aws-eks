#!/bin/bash

echo "Finding VPCs"
aws ec2 describe-vpcs  > vpc.json

vpcid=$(jq -r '.Vpcs[].VpcId' vpc.json)

#echo $vpcid

echo "Finding Subnets"

aws ec2 describe-subnets > subnets.json

appsubnets=$(jq -r '.Subnets[].SubnetId' subnets.json | sed ':a;N;$!ba;s/\n/,/g')
subnet_list=$(jq -r '.Subnets[].SubnetId' subnets.json)

echo $appsubnets

parameterfilepath="file://${WORKSPACE}/template/parameters.json"

echo "!!!!!!!!!!!!!!!!!!!!!!!Substitute the parameters!!!!!!!!!!!!!!!!"
envsubst < "${WORKSPACE}/template/eks_parameters.json.tmpl" > "${WORKSPACE}/template/parameters.json"
templateUrl="file://${WORKSPACE}/template/control-plane.yaml"
echo "Temp File"
cat "${WORKSPACE}/template/eks_parameters.json.tmpl"
echo "!!!!!!!!!!!!!!!!Final Parameters!!!!!!!!!!!!!!!!"
cat "${WORKSPACE}/template/parameters.json"

echo "!!!!!!!!!!!!! ${action} of ${environment}-${stackName} stack is initiated !!!!!!!!!!!!!!!!!!!!!!!!"
aws cloudformation "${action}"-stack \
--template-body "${templateUrl}" --region "${aws_region}" \
--stack-name "eks-${environment}-${stackName}" \
--parameters  "${parameterfilepath}" \
--capabilities CAPABILITY_NAMED_IAM

echo "Waiting for the '${action}' operation to complete on CloudFormation stack: ${environment}-${stackName}"
aws cloudformation wait stack-${action}-complete \
    --stack-name "eks-${environment}-${stackName}" \
    --region ${aws_region}
    
echo "${stackName} is created successfully !!!!!!!!!!!!!!!!"   

