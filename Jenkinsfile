pipeline{

  agent any
  stages{
        stage("build"){
           echo 'building the application'
           def mvnHome = tool name: 'maven', type: 'maven'
           def mvnCMD = "${mvnHome}/bin/mvn"
           sh "${mvnCMD} clean package"
        }

      stage("test"){
          steps{
                echo 'testing the application'
          }
      }

      stage("deploy"){
            steps{
                echo 'deploying the application'
            }
      }

  }

}