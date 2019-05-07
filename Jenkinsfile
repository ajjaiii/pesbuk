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
					cd pesbuk
					docker build -t pesbuk .
					docker tag pesbuk ajjaiii/php-mysql:$BUILD_NUMBER
					docker push ajjaiii/php-mysql:$BUILD_NUMBER
				'''
				
			}
		stage 'Deploy'
			echo 'Pushed to repo'
			print "branch : ${env.BRANCH_NAME}"
			echo 'Deploying to Demo site'
			sshagent (credentials: ['ssh-server-key']) {
				sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.4.140 \"docker rm -f rr-scheduler-demo && docker run -d --add-host linux-demolive:172.31.4.140 --add-host db-demolive:172.31.4.245 --name rr-scheduler-demo -p 5900:80 -e ASPNETCORE_ENVIRONMENT=Demo --hostname rr-scheduler --restart always registry.gitlab.com/devstack-o/rapid-rainbow/email-service:1.0.0.hotfix140\""
			}
}
