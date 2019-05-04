#!groovy
node ('master'){
	currentBuild.result = "SUCCESS"
//	try {
		stage 'Preparation'
			git branch: 'master',
            credentialsId: 'github',
            url: 'https://github.com/ajjaiii/pesbuk.git'
			echo 'file checked out'
		stage 'Build'
			node ('master'){
				git branch: 'master',
                credentialsId: 'ajjaiii',
                url: 'https://github.com/ajjaiii/pesbuk.git'
				print "Running on : ${env.NODE_NAME}"
				docker.image('mcr.microsoft.com/dotnet/core/sdk:2.2').inside('-u 0') {
					sh '''
						cd $PWD/src/RapidRainbow.Scheduler.UI
						dotnet --version
						dotnet restore
						dotnet publish -c Release -o obj/Docker/publish/
					'''
				}
				echo 'Building Image'
				sh '''
					cd src/RapidRainbow.Scheduler.UI
					docker build -t registry.gitlab.com/devstack-o/rapid-rainbow/email-service:1.0.0.hotfix140 .
					docker push registry.gitlab.com/devstack-o/rapid-rainbow/email-service:1.0.0.hotfix140
					docker rmi registry.gitlab.com/devstack-o/rapid-rainbow/email-service:1.0.0.hotfix140
				'''
				
			}
		stage 'Deploy'
			echo 'Pushed to repo'
			print "branch : ${env.BRANCH_NAME}"
			echo 'Deploying to Demo site'
			sshagent (credentials: ['ssh-server-key']) {
				sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.4.140 \"docker rm -f rr-scheduler-demo && docker run -d --add-host linux-demolive:172.31.4.140 --add-host db-demolive:172.31.4.245 --name rr-scheduler-demo -p 5900:80 -e ASPNETCORE_ENVIRONMENT=Demo --hostname rr-scheduler --restart always registry.gitlab.com/devstack-o/rapid-rainbow/email-service:1.0.0.hotfix140\""
			}
			
			
//	}
//	catch (err) {
//        final def SUBJECT = "${env.JOB_NAME} ${env.BRANCH_NAME} - Build #${env.BUILD_NUMBER} - FAILED!"
//        currentBuild.result = "FAILURE"
//            mail body: "project build error is here: ${env.BUILD_URL}" ,
//            from: 'jenkins@geekseat.ga',
//            replyTo: 'jenkins@geekseat.ga',
//            subject: 'Jenkins RBC-Scheduler Hotfix-Build',
//            to: 'irfan.herfiandana@geekseat.com.au'
//        throw err
//    }
}
