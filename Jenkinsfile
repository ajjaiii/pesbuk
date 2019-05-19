#!groovy
node ('master'){
	currentBuild.result = "SUCCESS"
		stage 'Github checking'
			git branch: 'master',
            credentialsId: 'github',
            url: 'https://github.com/ajjaiii/pesbuk.git'
			echo 'file checked out'
		stage 'Build'
			node ('master'){
				git branch: 'master',
                credentialsId: 'github',
                url: 'https://github.com/ajjaiii/pesbuk.git'
				print "Running on : ${env.NODE_NAME}"

				echo 'Building Image'
				sh '''
					docker build -t pesbuk .
					docker tag pesbuk ajjaiii/php-mysql:$BUILD_NUMBER
					docker push ajjaiii/php-mysql:$BUILD_NUMBER
				'''
				
			}
		stage 'Deploy'
			echo 'Running Container'
			print "branch : ${env.BRANCH_NAME}"
			echo 'Deploying pesbuk aplication'
			sh '''
			      docker rm -f pesbuk
			      docker run -d -p 80:80 --name pesbuk ajjaiii/php-mysql:$BUILD_NUMBER
			      docker image prune -fa
			'''
}
