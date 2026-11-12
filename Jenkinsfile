pipeline {
    agent any
    environment {
        DOCKER_HOST = 'tcp://host.docker.internal:2375'
        IMAGE_NAME = "demo-web-jenkins"
        CONTAINER_NAME = "web-app-container"
    }
    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Dang dong goi Docker Image qua TCP...'
                sh "docker build -t \${IMAGE_NAME}:latest ."
            }
        }
        stage('Deploy Container') {
            steps {
                echo 'Dang khoi chay Container moi...'
                sh "docker rm -f \${CONTAINER_NAME} || true"
                sh "docker run -d -p 8082:80 --name \${CONTAINER_NAME} \${IMAGE_NAME}:latest"
            }
        }
    }
    post {
        success {
            echo 'Trien khai thanh cong! Truy cap http://localhost:8082'
        }
    }
}