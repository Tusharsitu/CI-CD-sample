pipeline {
  agent {
    docker { image 'hashicorp/terraform' }
  }
  stages {
    stage('Test') {
      steps {
        sh '''
         terraform --version
         terraform init
        terraform plan
          '''
      }
    }
  }
}
