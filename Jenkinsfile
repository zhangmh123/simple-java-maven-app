pipeline {
  agent {
    docker { image 'node:16-alpine' }
  }
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
      steps {
        sh 'node --version'
      }
    }
  }
}