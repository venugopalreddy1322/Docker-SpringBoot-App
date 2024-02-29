pipeline {
    agent any
    /*tools {
        dockerTool "myDocker"
    }*/
    environment {
        DOCKER_USER_NAME = 'venu1322'
        DOCKER_REGISTRY_CREDENTIALS = 'dockerhub_pwd'
        DOCKER_IMAGE_NAME = 'venu1322/project_jenkins-docker-springboot-helloworld-app'
        DOCKER_IMAGE_TAG = "V${BUILD_ID}"
    }
    stages {
        stage('Fetch code from GitRepository') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/venugopalreddy1322/Project-Docker-SpringBoot-App'
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
        stage('SonarQube Test') {
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'sonarqube') {
                    sh 'mvn sonar:sonar'
                }
                }
            }
        }
        stage('Push Image to DockerHub Repository') {
            steps {
                script {
                                      
                    //withCredentials([string(credentialsId: "${DOCKER_REGISTRY_CREDENTIALS}", variable: 'dockerhub_pwd')]) {
                       // sh 'docker login -u ${DOCKER_USER_NAME} -p ${dockerhub_pwd}'
                       withDockerRegistry(credentialsId: 'dockerhub_pwd') {
                    //}
                    dockerImage.push()
                    }
                }
            }
        }
    }
}