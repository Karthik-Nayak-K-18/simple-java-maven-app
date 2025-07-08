pipeline {
    agent any

    tools {
        jdk 'JDK 17'
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
    }
}
