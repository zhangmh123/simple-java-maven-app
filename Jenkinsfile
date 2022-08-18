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
             docker.withRegistry('https://hub.docker.com/', 'registryCredential') {

                         def customImage = docker.build("${imagename}:${env.BUILD_ID}")

                         /* Push the container to the custom Registry */
                         customImage.push()
              }
         }

//               steps{
//                 sh 'docker build -t zhangmh123/my-java-app:v1 .'
//               }
         }
//             stage('Deploy Image') {
//               steps{
//                     script {
//                         withRegistry('', registryCredential) {
//                         dockerImage.push('v1')
//                        }
//                     }
//               }
//             }
    }
}
