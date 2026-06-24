pipeline {
    agent any

    environment {
        IMAGE_NAME = "smart-tracker"
        CONTAINER_NAME = "smart-tracker-app"
        APP_PORT = "8000"
        HOST_PORT = "80"
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Pulling latest code from GitHub'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image'
                sh 'docker build -t ${IMAGE_NAME}:latest .'
            }
        }

        stage('Stop Old Container') {
            steps {
                echo 'Removing old container if it exists'
                sh 'docker stop ${CONTAINER_NAME} || true'
                sh 'docker rm ${CONTAINER_NAME} || true'
            }
        }

        stage('Run New Container') {
            steps {
                echo 'Starting new container'
                sh '''
                    docker run -d \
                        --name ${CONTAINER_NAME} \
                        --restart unless-stopped \
                        -p ${HOST_PORT}:${APP_PORT} \
                        -e PORT=${APP_PORT} \
                        ${IMAGE_NAME}:latest
                '''
            }
        }

        stage('Health Check') {
            steps {
                echo 'Waiting for app to start'
                sh 'sleep 5'
                echo 'Checking app is responding'
                sh 'curl -f http://localhost:80/login'
            }
        }

    }

    post {
        success {
            echo 'Deployment successful. App is live on port 80.'
        }
        failure {
            echo 'Deployment failed. Check the logs above.'
        }
        always {
            echo 'Cleaning unused Docker images'
            sh 'docker image prune -f'
        }
    }
}