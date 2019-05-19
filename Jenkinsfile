<<<<<<< HEAD
#!groovy
node (agen1) {  
    stage('Build') { 
        echo 'building'
    }
    stage('Test') { 
        echo 'testing'
    }
    stage('Deploy') { 
        echo 'deploy'
    }
}
=======
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
				sh 'sed -i "s/BUILD_NUMBER/$BUILD_NUMBER/g" deployment.yaml'
				sh 'docker build . -t pesbuk'
				sh 'docker tag pesbuk ajjaiii/pesbuk:$BUILD_NUMBER'
				sh 'docker push ajjaiii/pesbuk:$BUILD_NUMBER'
				
			}
		stage 'Cleaning'
			echo 'Cleaning image'
			print "branch : ${env.BRANCH_NAME}"
			sh 'docker images prune -fa'
			echo 'image cleaned'
			
		stage 'Deploy'
			echo 'Deploying Aplication'
			print "branch : ${env.BRANCH_NAME}"
			sh 'kubectl apply -f deployment.yaml'
			echo 'Pesbuk aplication has deployed'
}
>>>>>>> f2d8967e86b90514c6638bf0210788f21758dca3
