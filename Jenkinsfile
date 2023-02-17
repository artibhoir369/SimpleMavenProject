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
        
//         stage('Tag Image with Repository Name') {
//             steps {
//                 sh 'sudo docker tag java-app:latest 091137789371.dkr.ecr.us-east-1.amazonaws.com/web1:latest'
//             }
//         }
        
        stage('DockerLogin') {
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	    sh "sudo docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                }
            }
        
//         stage('DockerLogin') {
//             steps{
//                 sh 'sudo aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 091137789371.dkr.ecr.us-east-1.amazonaws.com'
//                 }
//             }
        
        stage('Pushing the image') {
            steps {
                sh 'sudo docker push artibhoir369/java-app'
//                 sh 'sudo docker push 091137789371.dkr.ecr.us-east-1.amazonaws.com/web1:latest'
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'ansible-playbook create_docker_container.yml'
            }
        }          
    }
}
