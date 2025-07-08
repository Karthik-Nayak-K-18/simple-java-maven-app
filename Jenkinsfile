pipeline {
    agent any

    tools {
        jdk 'JDK 21'
        maven 'Maven 3.9.10'
    }

    stages {
        stage('git checkout') {
            steps {
                echo 'checkout to remote git repo'
                git branch: 'master', url: 'https://github.com/Karthik-Nayak-K-18/simple-java-maven-app.git'
            }
        }
        stage('compile') {
            steps {
                echo 'compiling source code'
                sh 'mvn clean package'
            }
        }

        stage('test') {
            steps {
                echo 'running unit tests'
                sh 'mvn test'
            }
        }

        stage('Docker Build & Push') {
            steps {
                echo 'Building Docker image and pushing to Docker Hub'

            withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
            sh '''
                docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
                docker build -t $DOCKER_USERNAME/simple-java-maven-app:latest .
                docker push $DOCKER_USERNAME/simple-java-maven-app:latest
            '''
                 }
            }
        }   
    }
}