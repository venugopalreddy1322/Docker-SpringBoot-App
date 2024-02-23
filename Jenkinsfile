pipeline {
    agent any
    environment {
        DOCKER_REGISTRY_CREDENTIALS = 'dockerhubid'
        DOCKER_IMAGE_NAME = 'venu1322/jenkins-docker-springboot-helloworld-app'
        DOCKER_IMAGE_TAG = "V${BUILD_ID}"
    }
    stages {
        stage('Fetch code from GitRepository') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/venugopalreddy1322/Docker-SpringBoot-App'
                }
            }
        }
        stage('Build Image using Dockerfile') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}")
                }
            }
        }
        stage('Push Image to DockerHub Repository') {
            steps {
                script {
                    //docker.withRegistry(credentialsId: "${DOCKER_REGISTRY_CREDENTIALS}", url: 'https://index.docker.io/v1/')
                    withCredentials([string(credentialsId: 'docker_pwd', variable: 'dockerhubpwd')]) {
                        sh 'docker login -u venu1322 -p ${dockerhubpwd}'
                    }
                    dockerImage.push()
                }
            }
        }
    }
}