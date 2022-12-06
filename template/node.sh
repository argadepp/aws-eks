#!/bin/bash

cluster_endpoint=$(aws eks describe-cluster \
    --region "${aws_region}" \
    --name "${ClusterName}" \
    --query "cluster.endpoint" \
    --output text)

certificate_data=$(aws eks describe-cluster \
    --region "${aws_region}" \
    --name "${ClusterName}" \
    --query "cluster.certificateAuthority.data" \
    --output text)

echo    "endpoint=$cluster_endpoint" 

echo "cert_date=$certificate_data"

