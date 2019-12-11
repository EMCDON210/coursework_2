pipeline {
    agent { dockerfile true }
    stages {
        stage('Sonarqube') {
            environment {
                scannerHome = tool 'SonarQube'
            }
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
                timeout(time: 10, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
node {
    checkout scm

	def customImage = docker.build("emcd99/coursework_2")
	
	docker.withRegistry('https://registry.hub.docker.com', 'dockerUAndP') {

        customImage.push("V${env.BUILD_ID}")
    }
}
