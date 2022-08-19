pipeline {
  agent none
  stages {
    stage('Back-end') {
          agent {
            docker { image 'maven:3.6.1-jdk-8-alpine' }
          }
          steps {
            sh 'mvn --version'
          }
    }
    stage('Test') {
     agent {
        docker { image 'node:16-alpine' }
      }
      steps {
        sh 'node --version'
      }
    }
  }
}