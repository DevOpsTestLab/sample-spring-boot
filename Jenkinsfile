pipeline {
    agent none
    stages {
        stage('build') {
            agent {
                docker { image 'gradle' }
            }
            steps {
                sh 'chmod +x gradlew && ./gradlew build'
            }
        }
        // stage('sonarqube') {
        //     agent {
        //         docker { image 'gradle' }
        //     }
        //     steps {
        //         withSonarQubeEnv("SonarCloud") {
        //             sh 'chmod +x gradlew && ./gradlew sonarqube'
        //         }
        //     }
        // }
        stage('docker build') {
            agent {
                docker { image 'gradle' }
            }
            steps {
                script {
                    docker.withTool('docker') {
                        repoId = "aarondownward/sample-spring-boot"
                        image = docker.build(repoId)
                    }
                }
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