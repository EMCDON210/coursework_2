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

	def customImage = docker.build("EMCDON210/coursework_2")
	
	docker.withRegistry('https://registry.hub.docker.com', 'dockerUAndP') {

        customImage.push("${env.BUILD_ID}")
	customImage.push("latest")
    }
}
