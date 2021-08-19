#!groovy
  // Run docker build
  properties([disableConcurrentBuilds()])

pipeline {
  agent {
    label 'master'
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    timestamps()
  }
  stages {
    stage("create docker image") {
      steps {
        echo " ============== start building image =================="
        sh 'docker build -t kerzoll/helloworld:latest . '
      }
    }
    stage("login to Docker Hub") {
      steps {
        echo " ============== docker HUB login ================="
        withCredentials([usernamePassword(credentialsId: 'auth_for_docker_hub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh """
          docker login -u ${USERNAME} -p ${PASSWORD}
          """
        }
      }
    }
    stage("docker push") {
      steps {
        echo " ============== start pushing image ==================" 
        sh '''
        docker push kerzoll/hello_container:latest
        ''' 
      }
    }
  }
}
