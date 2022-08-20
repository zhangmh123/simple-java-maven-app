pipeline {
  agent any
  stages {

    stage('Back-end') {
          agent {
            docker { image 'maven:3.6.1-jdk-8-alpine' }
          }
          steps {
            sh 'mvn clean package'
          }
    }
     stage('Docker build image'){
         steps {
           sh 'docker build -t my-java-app:v1 .'
         }
     }
       stage('Docker push'){
          steps {
              withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'docker_pwd', usernameVariable: 'docker_user')]) {
                  // login docker
                  sh "docker login -u ${docker_user} -p ${docker_pwd}"
                  // tag
                  sh "docker tag my-java-app:v1 zhangmh123/my-java-app:v1"
                  // docker push
                  sh "docker push zhangmh123/my-java-app:v1"
              }
          }
       }
  }
}