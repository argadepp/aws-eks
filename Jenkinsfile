pipeline {
    agent any
    environment {
        aws_region = "${params.aws_region}"
        
    }
    parameters {
        
       
         booleanParam(name: 'Refresh', defaultValue: false , description: 'Refresh this Job')
         choice(name: 'action' ,  choices: ['create','update'] , description: 'action regarding thr stack create or update , choose as per the requirment' )
         choice(name: 'environment', choices: ['dev', 'qa', 'stage', 'stage-or', 'prod','toolchain'], description: '')
         string(name: 'aws_region', defaultValue: 'ap-south-1' , description: 'AWS Region' )
         string(name: 'ClusterName',defaultValue: 'eksDev')
         string(name: 'nodeAmiId',defaultValue:'ami-0f140243dedd3b53c', description: 'Pass the proper value of AMI id by default it is 1.20' )
         string(name: 'ClusterVersion',defaultValue: '1.20', description: 'Specify the cluster name')
         choice(name: 'Product', choices:['eks-test1','eks-test-2'],description: 'Specify the product')
         choice(name: 'ApplicationName', choices: ['pratiktech-dev','pratiktech-stage'])
         string(name: 'stackName',defaultValue: 'eksCluster')
         string(name: 'ProductOwnerEmail',defaultValue: 'argadepp@gmail.com')
    }  
    stages {
        
        stage('Infra-Creation') {
            steps {
                
               sh 'chmod +x ${WORKSPACE}/template/*'
               withAWS(credentials: 'AWSCred' , region: 'ap-south-1') {
               sh(script: "${WORKSPACE}/template/find-vpc.sh")
               }
            }
        }
        
        
    }
}
