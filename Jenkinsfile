pipeline {
    agent any

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
                docker { image 'gradle' }
            }
            steps { 
                sh 'chmod +x gradlew && ./gradlew sonarqube'
            }
        }
        stage('docker build') {
            agent {
                docker { image 'busybox' }
            }
            steps{
                sh 'docker build -t mattbecker5/sample-spring-boot'
            }
        }
        stage('docker push') {
            agent {
                docker { image 'busybox' }
            }
            steps {
                script {
                   docker.withTool('docker') {
                        repoId = "mattbecker5/sample-spring-boot"
                        image = docker.build(repoId)
                        docker.withRegistry("https://registry.hub.docker.com", "dockerlogin") {
                            image.push()
                        }
                    }
                }
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