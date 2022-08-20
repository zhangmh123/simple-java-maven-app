pipeline {
  agent any
  stages {
      stage("Git Clone"){
          git credentialsId: '', url: '/var/jenkins_home/GitHub/simple-java-maven-app'
      }
    stage('Back-end') {
          agent {
            docker {
               image 'maven:3.6.1-jdk-8-alpine'
               args '-v /root/.m2:/root/.m2'
            }
          }
          steps {
            sh 'mvn -B -DskipTests clean package'
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