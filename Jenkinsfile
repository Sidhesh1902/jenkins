pipeline {
  agent any

  environment {
    IMAGE_NAME = 'sidhesh2005/hello-ci'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          echo '🐳 Building Docker image...'
          sh "docker build -t ${IMAGE_NAME}:latest ."
        }
      }
    }

    stage('Push to Docker Hub') {
      steps {
        script {
          echo '📦 Pushing image to Docker Hub...'
          withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
            sh '''
              echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
              docker push ${IMAGE_NAME}:latest
            '''
          }
        }
      }
    }
  }

  post {
    success {
      echo '✅ CI/CD Pipeline successful — image pushed to Docker Hub!'
    }
    failure {
      echo '❌ Pipeline failed — check logs.'
    }
  }
}
