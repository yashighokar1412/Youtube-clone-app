pipeline {
    agent any
    stages {
        stage('Git Checkout') {
            steps {
               git branch: 'main', url: 'https://github.com/yashighokar1412/Youtube-clone-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
               withDockerRegistry(credentialsId: 'docker', url: 'https://index.docker.io/v1/') {
                        sh 'docker build -t youtube .'
                        sh 'docker images'
                    }
                }
            }
        }
        stage('Tag and Push Docker Image') {
            steps {
                script {
                  withDockerRegistry(credentialsId: 'docker', url: 'https://index.docker.io/v1/') {
                        sh 'docker tag youtube:latest yashthedocker/youtube:01'
                        sh 'docker push yashthedocker/youtube:01'
                    }
                }
            }
        }
        stage('deployment yml file') {
            steps {
                script {withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'k8s', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                        sh 'kubectl apply -f deployment.yml'          
    }
}
            }}}}
