pipeline {
    agent any

    stages {

        stage('Pull') {
            steps {
                git url: "https://github.com/mattbecker5/sample-spring-boot.git", branch: "dev"
            }
        }

        stage('Test') {
            steps {
                sh 'echo test'
            }
        }
        // stage('build') {
        //     agent {
        //         docker { image 'gradle' }
        //     }
        //     steps {
        //         sh 'chmod +x gradlew && ./gradlew build'
        //     }
        // }
        // stage('sonarqube') {
        //     agent {
        //         docker { image 'busybox' }
        //     }
        //     steps {
        //         sh 'echo sonarqube'
        //     }
        // }
        // stage('docker build') {
        //     agent {
        //         docker { image 'busybox' }
        //     }
        //     steps {
        //         sh 'echo docker build dev'
        //     }
        // }
        // stage('docker push') {
        //     agent {
        //         docker { image 'busybox' }
        //     }
        //     steps {
        //         sh 'echo docker push'
        //     }
        // }
        // stage('app deploy') {
        //     agent {
        //         docker { image 'busybox' }
        //     }
        //     steps {
        //         sh 'echo kube deploy'
        //     }
        // }
    }
}