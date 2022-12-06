#!/bin/bash

APIEndPoint=$(aws eks describe-cluster \
    --region "${aws_region}" \
    --name "${ClusterName}" \
    --query "cluster.endpoint" \
    --output text)

CertData=$(aws eks describe-cluster \
    --region "${aws_region}" \
    --name "${ClusterName}" \
    --query "cluster.certificateAuthority.data" \
    --output text)

echo    "endpoint=$APIEndPoint" 

echo "cert_date=$CertData"


aws ec2  describe-security-groups > "${WORKSPACE}/template/sg.json"
aws iam get-role --role-name eksDev-node-role > "${WORKSPACE}/template/iam.json"
SG=$(jq -r '.SecurityGroups[].GroupId' "${WORKSPACE}/template/sg.json" | sed ':a;N;$!ba;s/\n/,/g')
RoleArn=$(jq -r '.Role.Arn' "${WORKSPACE}/template/iam.json")

parameterfilepath="file://${WORKSPACE}/template/nodeparameters.json"

echo "!!!!!!!!!!!!!!!!!!!!!!!Substitute the parameters!!!!!!!!!!!!!!!!"
envsubst < "${WORKSPACE}/template/node_parameters.json.tmpl" > "${WORKSPACE}/template/nodeparameters.json"
templateUrl="file://${WORKSPACE}/template/controle-plane.yaml"
#cat "${WORKSPACE}/template/asg_parameters.json.tmpl"
echo "!!!!!!!!!!!!!!!!Final Parameters!!!!!!!!!!!!!!!!"
cat "${WORKSPACE}/template/nodeparameters.json"







