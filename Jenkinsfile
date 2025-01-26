pipeline {
  agent {
    docker { image 'hashicorp/terraform:1.10' }
  }
  stages {
    stage('Test') {
      steps {
        sh '--version'
      }
    }
  }
}
