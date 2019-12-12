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
	def customImage
    stage('Build The Image') {
	    checkout scm
		customImage = docker.build("emcd99/coursework2")
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
                    customImage.push("LatestBuild")
		}
    }
    stage('Update Kubernetes') {
        sh "ssh azureuser@40.85.164.246 kubectl set image deployment/emcd99-coursework2 emcd99-coursework2=emcd99/coursework2:V${env.BUILD_ID}"
    }
}
