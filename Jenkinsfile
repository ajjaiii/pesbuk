#!groovy
node ('agen1'){
	currentBuild.result = "SUCCESS"
		stage 'Github checking'
			git branch: 'staging',
            credentialsId: 'github',
            url: 'https://github.com/ajjaiii/pesbuk.git'
			echo 'file checked out'
		stage 'Build'
			node ('agen1'){
				git branch: 'staging',
                credentialsId: 'github',
                url: 'https://github.com/ajjaiii/pesbuk.git'
				print "Running on : ${env.NODE_NAME}"

				echo 'Building Image'
				sh 'kubectl get pods'
				
			}
		stage 'Deploy'
			echo 'Running Container'
			print "branch : ${env.BRANCH_NAME}"
			echo 'Deploying pesbuk aplication'
}