#!groovy
node ('agen1'){
	currentBuild.result = "SUCCESS"
		stage 'Github checking'
			git branch: 'production',
            credentialsId: 'github',
            url: 'https://github.com/ajjaiii/pesbuk.git'
			echo 'file checked out'
		stage 'Build'
			node ('agen1'){
				git branch: 'production',
                credentialsId: 'github',
                url: 'https://github.com/ajjaiii/pesbuk.git'
				print "Running on : ${env.NODE_NAME}"

				echo 'Building Image'
				sh 'docker build . -t ajjaiii/pesbukpro'
				sh 'docker tag ajjaiii/pesbuk ajjaiii/pesbukpro:$BUILD_NUMBER'
				sh 'docker login'
                                sh 'docker push ajjaiii/pesbukpro:latest'
				sh 'docker push ajjaiii/pesbukpro:$BUILD_NUMBER'
				echo 'new image has build'
			}
		stage 'Deploy'
			echo 'Deploying Aplication'
			sh 'kubectl apply -f deployment.yaml'
			echo 'Pesbuk aplication has deployed'

		stage 'Cleaning'
			echo 'Cleaning images'
			sh 'docker image prune -fa'
			echo 'images cleaned'
}
