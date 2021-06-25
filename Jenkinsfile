  
pipeline {
   agent any

   
   environment {

     
     SERVICE_NAME = "hello_microservice"
     REPOSITORY_TAG="${ORGANIZATION_NAME}-${SERVICE_NAME}:${BUILD_ID}"
   }   
   
   stages {
     
      stage('Preparation') {
         steps {
            cleanWs()
            git 'https://github.com/yash-demo/project.git'
         }
      }
      
      stage('Build Jar') {
          steps {
            sh './gradlew build'
          }
      }

      stage('Run ansible'){

         agent{
              docker {
                 image 'ansible_main_ansible'
                 reuseNode true
              }
         }

          steps{ 
                sh 'ansible-galaxy collection install community.kubernetes'
                sh 'ansible-playbook demo.yml -e "image=$REPOSITORY_TAG" '
             
              
          }    
      } 
   }
}
