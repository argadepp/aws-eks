pipeline {
    agent any
    environment {
        aws_region = "${params.aws_region}"
        
    }
    parameters {
        
       
         booleanParam(name: 'Refresh', defaultValue: false , description: 'Refresh this Job')
         choice(name: 'action' ,  choices: ['create','update'] , description: 'action regarding thr stack create or update , choose as per the requirment' )
         choice(name: 'environment', choices: ['dev', 'qa', 'stage', 'stage-or', 'prod','toolchain'], description: '')
         string(name: 'AWSRegion', defaultValue: 'ap-south-1' , description: 'AWS Region' )
         string(name: 'VPCId', defaultValue: 'vpc-062c05abf261884de')
         string(name: 'appsubnets',defaultValue: 'subnet-0642101628122b197,subnet-010c9e5041538922b,subnet-0e9b7bad3671f58a3')
         string(name: 'ClusterName',defaultValue: 'eksDev')
         string(name: 'nodeAmiId',defaultValue:'ami-0f140243dedd3b53c', description: 'Pass the proper value of AMI id by default it is 1.20' )
         string(name: 'ClusterVersion',defaultValue: '1.20', description: 'Specify the cluster name')
         choice(name: 'Product', choices:['eks-test1','eks-test-2'],description: 'Specify the product')
         choice(name: 'ApplicationName', choices: ['pratiktech-dev','pratiktech-stage'])
         string(name: 'stackName',defaultValue: 'eksCluster')
         string(name: 'ProductOwnerEmail',defaultValue: 'argadepp@gmail.com')
    }  
    stages {
        
        stage('Controle_Plane_Create') {
            steps {
                
               sh 'chmod +x ${WORKSPACE}/template/*'
               withAWS(credentials: 'AWSCred' , region: 'ap-south-1') {
               sh(script: "${WORKSPACE}/template/find-vpc.sh")
               }
            }
        }
        
        stage('NodeGroup Create') {
            steps {
               
               sh 'chmod +x ${WORKSPACE}/template/*'
               withAWS(credentials: 'AWSCred' , region: 'ap-south-1') {
                   env.APIEndPoint="${APIEndPoint}"    
               sh(script: "${WORKSPACE}/template/node.sh")
               }
            }
        }
        
        
    }
}
