 pipeline {
     environment {
        imagename = "zhangmh123/my-java-app"
        registryCredential = 'docker-hub-credentials'
        dockerImage = ''
      }
    agent {
        docker {
            image 'maven:3.6.1-jdk-8-alpine'
            args '-v /root/.m2:/root/.m2' 
        }
    }
    stages {
        stage('Maven Build') {
            steps {
                echo 'building application...'
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        stage('Building image') {
              steps{
                script {
                    dockerImage = build(imagename)
                }
              }
            }
            stage('Deploy Image') {
              steps{
                    script {
                        withRegistry('', registryCredential) {
                        dockerImage.push('v1')
                       }
                    }
              }
            }
    }
}
