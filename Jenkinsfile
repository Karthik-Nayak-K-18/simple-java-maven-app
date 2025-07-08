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

        stage('build') {
            steps {
                echo 'building docker image'
                sh 'docker build -t simple-java-maven-app .'
            }
        }

        stage ('push') {
            steps {
                echo 'pushing docker image to docker hub'
                sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                sh 'docker tag simple-java-maven-app:latest karthiknayak/simple-java-maven-app:latest'
                sh 'docker push karthiknayak/simple-java-maven-app:latest'
            }
        }
    }
}
