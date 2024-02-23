pipeline {
    agent any
    environment {
        DOCKER_REGISTRY_CREDENTIALS = 'dockerhubid'
        DOCKER_IMAGE_NAME = 'venu1322/Jenkins-docker-springboot-helloworld-app'
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
                    docker.withRegistry(" ", ${DOCKER_REGISTRY_CREDENTIALS})
                    dockerImage.push()
                }
            }
        }
    }
}