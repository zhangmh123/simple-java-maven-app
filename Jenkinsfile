pipeline {
  agent any
  stages {

    stage('Back-end') {
          agent {
            docker { image 'maven:3.6.1-jdk-8-alpine' }
          }
          steps {
            sh 'mvn --version'
          }
    }
     stage('Docker build image'){
         steps {
           sh 'docker version'
           sh 'docker build -t my-java-app:v1 .'
         }
     }
  }
}