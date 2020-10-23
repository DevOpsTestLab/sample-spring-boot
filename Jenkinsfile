pipeline {
    agent none
    stages {
        stage('test') {
            agent {
                label 'master'
            }
            steps {
                sh 'echo start test'
            }
        }
        stage('build') {
            agent {
                docker { image 'gradle' }
            }
            steps {
                git url: 'https://github.com/re-blank/sample-spring-boot/', branch: 'ld_fix'
                sh 'chmod +x gradlew && ./gradlew build'
            }
        }
        stage('sonarqube') {
            agent {
                docker { image 'busybox' }
            }
            steps {
                sh './gradlew sonarqube '
            }
        }
        stage('docker build') {
            agent {
                docker { image 'busybox' }
            }
            steps {
                sh 'echo docker build'
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