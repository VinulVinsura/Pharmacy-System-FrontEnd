pipeline {
    agent any

    environment {
        IMAGE_NAME = 'pharmacy-app'
        CONTAINER_NAME = 'pharmacy-app-container'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'development', url: 'https://github.com/VinulVinsura/Pharmacy-System-FrontEnd.git'
            }
        }

        stage('Remove Old Container If Exists') {
            steps {
                sh """
                if docker ps -a --format '{{.Names}}' | grep -w ${CONTAINER_NAME}; then
                    echo "Stopping and removing old container..."
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                fi
                """
            }
        }

        stage('Remove Old Image If Exists') {
            steps {
                sh """
                if docker images -q ${IMAGE_NAME}; then
                    echo "Removing old Docker image..."
                    docker rmi -f ${IMAGE_NAME} || true
                fi
                """
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                echo "Building Docker image..."
                docker build -t ${IMAGE_NAME} .
                """
            }
        }

        stage('Run Docker Container') {
            steps {
                sh """
                echo "Running new container..."
                docker run -d --name ${CONTAINER_NAME} -p 80:80 ${IMAGE_NAME}
                """
            }
        }
    }

    post {
        success {
            echo "Deployed successfully!"
        }
        failure {
            echo "Deployment failed."
        }
    }
}
