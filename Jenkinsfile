pipeline {
    agent any

    environment {
        IMAGE_NAME = "demo-web-jenkins"
        CONTAINER_NAME = "web-app-container"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Dang dong goi Docker Image...'
                sh "docker build -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Deploy Container') {
            steps {
                echo 'Dang khoi chay Container moi...'
                // Xóa container cũ nếu đang chạy để tránh trùng port
                sh "docker rm -f ${CONTAINER_NAME} || true"
                // Chạy container mới ở cổng 8082
                sh "docker run -d -p 8082:80 --name ${CONTAINER_NAME} ${IMAGE_NAME}:latest"
            }
        }
    }

    post {
        success {
            echo 'Trien khai thanh cong! Truy cap http://localhost:8082'
        }
    }
}