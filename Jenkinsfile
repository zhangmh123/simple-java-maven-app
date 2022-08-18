 pipeline {
    agent {
        docker {
            image 'maven:3.6.1-jdk-8-alpine'
            args '-v /root/.m2:/root/.m2' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                echo 'building application...'
                sh 'mvn -B -DskipTests clean package' 
            }
        }
         stage('Test') {
            steps {
                echo 'testing application...'
             }
         }
    }
}
