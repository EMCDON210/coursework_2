pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}
node {

    stage('Build The Image') {
	    checkout scm
        def customImage = docker.build("emcd99/coursework_2")
	}
	
    stage('Sonarqube') {
        script {
            scannerHome = tool 'SonarQubeScanner'
        }
        withSonarQubeEnv('SonarQube') {
            sh "${scannerHome}/bin/sonar-scanner"
        }
            timeout(time: 10, unit: 'MINUTES') {
                waitForQualityGate abortPipeline: true
        }
    }

    stage('Push To Docker Hub') {
		docker.withRegistry('https://registry.hub.docker.com', 'dockerUAndP') {
		    customImage.push("V${env.BUILD_ID}")
		}
    }
}
