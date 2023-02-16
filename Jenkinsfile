pipeline{
    agent any
    
    tools{
        maven "maven"
        jdk "jdk"
    }
    
    stages{
        stage('Build Java Application') {
            steps {
                sh 'mvn clean install package'
            }
        }
        stage('Docker Image Build For My Java Application') {
            steps {
                sh 'sudo docker build -t java-app .'
            }
        }
        stage('Tag Image with Repository Name') {
            steps {
                sh 'sudo docker tag java-app artibhoir369/java-app'
            }
        }
        
        stage('DockerLogin') {
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	    sh "sudo docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                }
            }
        }
        
        stage('Pushing the image') {
            steps {
                sh 'sudo docker push artibhoir369/java-app'
            }
        }
    }
}
