pipeline {
  agent {
    docker { image 'hashicorp/terraform' }
  }
  stages {
    stage('checkout') {
      steps {
      checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-auth', url: 'https://github.com/Tusharsitu/CI-CD-sample.git']])
    }
    }
    stage('Test') {
      steps {
        sh '''
         ls -l CI-CD-sample
         withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'id')]) {
         export AWS_ACCESS_KEY_ID="$id"
         }
         withCredentials([string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'id')]) {
         export AWS_SECRET_ACCESS_KEY="$id"
         }
         
         terraform --version
         terraform init
         echo test
          '''
      }
    }
  }
}
