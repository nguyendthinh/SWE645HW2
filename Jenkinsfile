pipeline {
    agent any
    environment {
        DOCKERHUB_PASS = credentials('docker-pass')
        LATEST_BUILD_NAME = "hw2v3"
    }
    stages {
        stage('Building the Student Survey Image') {
            steps {
                script {
                    checkout scm
                    sh 'rm -rf *.war'
                    sh 'jar -cvf HW_2.war -C Assignment2/hw_2/WebContent/ .'
                    sh "docker login -u risshie -p ${DOCKERHUB_PASS}"
                    def customImage = docker.build("risshie/swe642:${LATEST_BUILD_NAME}")
                }
            }
        }
        stage('Pushing Image to DockerHub') {
            steps {
                script {
                    sh 'docker push risshie/swe642:${LATEST_BUILD_NAME}'
                }
            }
        }
        stage('Deploying to Rancher as single pod') {
            steps {
                echo "Hello there!"
                sh 'kubectl set image deployment/survey-server swe642=risshie/swe642:${LATEST_BUILD_NAME}'
                echo "hello again"
            }
        }

    }
}
