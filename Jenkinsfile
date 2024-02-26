pipeline {
    agent any
    tools {
        docker "myDocker"
    }
    environment {
        DOCKER_USER_NAME = 'venu1322'
        DOCKER_REGISTRY_CREDENTIALS = 'docker_pwd'
        DOCKER_IMAGE_NAME = 'venu1322/project_jenkins-docker-springboot-helloworld-app'
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
                    // To use the method withRegistry need to validate the script permission in ManageJenkins
                    //docker.withRegistry(credentialsId: "${DOCKER_REGISTRY_CREDENTIALS}", url: 'https://index.docker.io/v1/')
                    withCredentials([string(credentialsId: "${DOCKER_REGISTRY_CREDENTIALS}", variable: 'dockerhubpwd')]) {
                        sh 'docker login -u ${DOCKER_USER_NAME} -p ${dockerhubpwd}'
                    }
                    dockerImage.push()
                }
            }
        }
    }
}