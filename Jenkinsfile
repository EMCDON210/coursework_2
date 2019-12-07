pipeline {
    agent { dockerfile true }
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

    docker.withRegistry('https://registry.hub.docker.com', 'dockerUAndP') {

        def customImage = docker.build("my-image:${env.BUILD_ID}")

        customImage.push()
		customImage.push("latest")
    }
}
