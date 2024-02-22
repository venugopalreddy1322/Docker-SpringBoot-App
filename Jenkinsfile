pipeline {
    agent any
    tools {
        maven "MAVEN3"
        jdk "OracleJDK11"
    }
    stages {
        stage('Fetch code') {
            steps {
                git branch: 'main', url: 'https://github.com/venugopalreddy1322/Docker-SpringBoot-App'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
            post {
                success {
                    echo "Build completed Successfully"
                    //echo "Archiving artifacts"
                    archiveArtifacts artifacts: '**/*.jar'
                }
            }
        }
    }
}