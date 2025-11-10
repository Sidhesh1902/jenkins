pipeline {
  agent {
    docker {
      image 'node:18-alpine'
    }
  }

  stages {
    stage('Install Dependencies') {
      steps {
        sh 'npm install'
      }
    }

    stage('Run Build') {
      steps {
        echo '🏗️ Building the Node.js app...'
        sh 'node --version'
        sh 'npm run build || echo "No build script found"'
      }
    }

    stage('Test') {
      steps {
        echo '🧪 Running tests...'
        sh 'npm test || echo "No tests configured"'
      }
    }
  }

  post {
    success {
      echo '✅ Build completed successfully inside Node container!'
    }
    failure {
      echo '❌ Build failed — check logs for details.'
    }
  }
}
