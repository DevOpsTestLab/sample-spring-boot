pipeline {
    agent any

    sonarqube {
        properties {
            property "sonar.projectKey", "mattbecker5_jenkins"
            property "sonar.organization", "mattbecker5"
            property "sonar.host.url", "https://sonarcloud.io"
        }
    }

    stages {

        stage('build') {
            agent {
                docker { image 'gradle' }
            }
            steps {
                sh 'chmod +x gradlew && ./gradlew build'
            }
        }
        stage('sonarqube') {
            agent {
                docker { image 'busybox' }
            }
            steps { 
                sh './gradlew sonarqube'
            }
        }
        stage('docker build') {
            agent {
                docker { image 'busybox' }
            }
            steps {
                sh 'echo docker build dev'
            }
        }
        stage('docker push') {
            agent {
                docker { image 'busybox' }
            }
            steps {
                sh 'echo docker push'
            }
        }
        stage('app deploy') {
            agent {
                docker { image 'busybox' }
            }
            steps {
                sh 'echo kube deploy'
            }
        }
    }
}