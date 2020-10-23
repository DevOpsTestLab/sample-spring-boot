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
                stash name: 'build', includes: '*'
            }
        }
        stage('sonarqube') {
            agent {
                docker { image 'gradle' }
            }
            steps {
                unstash 'build' 
                sh 'pwd'
                withSonarQubeEnv('SonarCloud')
                {
                    sh './gradlew sonarqube '
                }
                
            }
        }
        stage('docker build and push') {
            agent {
                docker { image 'docker' }
            }
            steps {
                unstash 'build'
                script {
                    docker.withTool('docker') {
                        repoId = "reblank/spring-app"
                        image = docker.build(repoId)
                        docker.withRegistry("", "DOCKER_HUB_TOKEN") {
                            image.push()
                        }
                    }
                }
            }
        }
        stage('docker push') {
            agent {
                docker { image 'busybox' }
            }
            steps {
                sh 'echo should I keep this?'
            }
        }
        stage('app deploy') {
            agent {
                docker { image 'bitnami/kubectl' }
            }
            steps {
                sh 'echo kube'
            }
        }
    }
}