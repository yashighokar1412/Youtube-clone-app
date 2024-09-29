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
                        sh 'docker images'
                    }
                }
            }
        }

        stage('Tag and Push Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker', url: 'https://index.docker.io/v1/') {
                        sh 'docker rmi -f 585f8087f30c'
                        sh 'docker rmi -f 585f8087f30c'
                        sh 'docker rmi -f 8fbc04d1d4ec'
                        sh 'docker rmi -f 6a31f26f816f'
                        sh 'docker rmi -f 51e9d8be3d21'
                        sh 'docker rmi -f 8febaace991d'
                        sh 'docker rmi -f aaa828f2be93'
                        sh 'docker rmi -f aae31105d7'
                        sh 'docker rmi -f 54526cc2362f'
                        sh 'docker rmi -f d698ce5b06b9'
                        sh 'docker rmi -f f0b0d0c27143'
                        sh 'docker rmi -f 1ddc7e4055fd'
                        sh 'docker rmi -f eb8b8b8a3610'
                    } 
                }
            }
        }

        stage('Deployment YML File') {
            steps {
                script {
                    withAWS(credentials: 'aws') {
                        withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'k8s', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                            sh 'kubectl delete deployment youtube-deployment'
                            sh ' rm -f deployment.yml'
                        }
                    }
                }
            }
        }

        stage('Deploy to K8s') {
            steps {
                script {
                    withAWS(credentials: 'aws') {
                        withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'k8s', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                            sh 'rm -f service.yml'
                            sh 'kubectl delete service youtube-service'
                            sh 'kubectl get pod'
                            sh 'kubectl get deployment'
                            sh  'kubectl get service'
                        }
                    }
                }
            }
        }
    }
}
