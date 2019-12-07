pipeline {
    agent { dockerfile true }
    environment {
        DOCKER_CREDS = credentials('dockerUAndP')
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
                sh 'svn --version'
            }
        }
    }
}
node {
    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', 'gcr:[dockerUAndP]') {

        def customImage = docker.build("my-image:${env.BUILD_ID}")

        customImage.push()
    }
}
