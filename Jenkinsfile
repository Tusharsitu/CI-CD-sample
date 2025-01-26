pipeline {
  agent {
    docker { image 'alpine:latest' }
  }
  stages {
    stage('Test') {
      steps {
        sh '''
          apk add --no-cache curl unzip bash
          curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_1.5.7_linux_amd64.zip -o terraform.zip
          unzip terraform.zip
          mv terraform /usr/local/bin/
          chmod +x /usr/local/bin/terraform
          terraform --version 
      }
    }
  }
}
