pipeline {
  agent {
    docker { image 'hashicorp/terraform' }
  }
  stages {
    stage('checkout') {
      steps {
      checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-auth', url: 'https://github.com/Tusharsitu/CI-CD-sample.git']])
    }
    stage('Test') {
      steps {
        sh '''
         ls -l CI-CD-sample
         terraform --version
         terraform init
        terraform plan
          '''
      }
    }
  }
}
