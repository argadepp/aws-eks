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
         string(name: 'vpcCIDR',defaultValue: '10.192.0.0/16',description: 'VPC CIDR Range')
         string(name: 'PublicSubnet1CIDR',defaultValue: '10.192.10.0/24',description: 'PublicSubnet1 CIDR Range')
         string(name: 'PublicSubnet2CIDR',defaultValue: '10.192.11.0/24',description: 'PublicSubnet2 CIDR Range')
         string(name: 'PrivateSubnet1CIDR',defaultValue: '10.192.20.0/24',description: 'PrivateSubnet1 CIDR Range')
         string(name: 'PrivateSubnet2CIDR',defaultValue: '10.192.21.0/24',description: 'PrivateSubnet1 CIDR Range')
         string(name: 'ClusterName',defaultValue: 'eksDev')
         string(name: 'Certificateauthority', defaultValue: 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM1ekNDQWMrZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJeU1Ea3lNekV6TXpRek1Wb1hEVE15TURreU1ERXpNelF6TVZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTDM4CjNtcUxNSFA3Y2cyc000bCsydFc1RFJKTkFkckVqbERnMVl3NlVDL2ZvankrUWgxbk9GU0thZ1BGMkZFb2lFaEMKTlZuWUxaNmRsMnN2MW1mMHlkVmV6ZmZZYlVEOXBSTXdFTStINVdKQ2gyK3R4bFNxanVYS1NtSW1CVjlSajlDawplVkEzY1ZqekR6eXEzTldoMXNEUm13ZkZ1cTg1dFJTdkNFNThwRVNJblU0Umcxd1g1eHJObzFBd3YyeG9hbk9MCkVKNHcrQWN3clo2b2JWMzQwbnpCZzEzVVBPVEZOZTAxRENONkIySWZoQ28vYjRaMUZacmpzazRsMThtRzY5bVMKdHU1blA5aEI2SEJSSFF5MWViYUxEVUNkVXdLbE90dDQrWnRMbm5UK3NrM3c1S1lCaWxHY2luVzBkam5CUUZYawo1Sk1nUnNRMnEwd2daOEFBZUdVQ0F3RUFBYU5DTUVBd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZGSUtnZzFKaE1lNzFkUVMxdFlIbm54YW5LSkVNQTBHQ1NxR1NJYjMKRFFFQkN3VUFBNElCQVFCNHpQRjhmeGZOWCtSaytsVmlrTEg3TWs3UnIrL1RsUktyMjVNTytYM0c5end6cytPbwpmMURrNGwxL3FydUh5N3BTV1lOSWF4ZEV6WUVUUjd0d2NKNnhPNm9kVDNiUkFoZkE5c01hR1Rlc0I1aVRxeFBsCldmY0R5QXNmbUlEUVpDQVdyeHVwWG44UitFTzVtZDZqaXBaZHE3ZFA1RzJuQ0NtaUE0TG92eXByOTQ2R0V3ekkKUUZWMm1WK1FsblZTTmpvTWVmbk50RXc5Yi9rS3JiSkZReHdQSnRNQ2pGVk5EdXZJNzN1L3QzR1ExMmg1MXRoeQptSkdHNW9tQklLWVNRckVkN3N1WWRIVlhGMVowbGFlSThjTWFxTi9UQm9weVl1ZkVMNjlnNy84M3NmVlYrYXdYCjhNN1ljNWkrMTE1SFpwcXh1Si9PV00rUGNQdnUveWR3bHNmWQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==')
         string(name: 'apiServerEndPoint', defaultValue:'https://D900972F9565AF43CADD637596B14EEA.gr7.ap-south-1.eks.amazonaws.com', description:'Pass the value of API Server end point from the cluster' )
         string(name: 'nodeAmiId',defaultValue:'ami-0f140243dedd3b53c', description: 'Pass the proper value of AMI id by default it is 1.20' )
         string(name: 'ClusterVersion',defaultValue: '1.20', description: 'Specify the cluster name')
         choice(name: 'Product', choices:['eks-test1','eks-test-2'],description: 'Specify the product')
         choice(name: 'ApplicationName', choices: ['pratiktech-dev','pratiktech-stage'])
         string(name: 'stackName',defaultValue: 'eksCluster')
         string(name: 'ProductOwnerEmail',defaultValue: 'argadepp@gmail.com')
         string(name: 'templateUrl',defaultValue: 'https://cf-templates-g2cqbboygucc-ap-south-1.s3.ap-south-1.amazonaws.com/launch-template.yaml')
    }  
    stages {
        
        stage('Infra-Creation') {
            steps {
                
               withAWS(credentials: 'AWSCred' , region: 'ap-south-1') {
               sh(script: "${WORKSPACE}/template/findvpc.sh"
               }
            }
        }
        
        
    }
}
