pipeline{
    agent any
    
    tools{
        maven "maven"
        jdk "jdk"
        dockerTool "docker"
    }
    
    stages{
        stage('Build Java Application') {
            steps {
                sh 'sudo mvn clean install package'
            }
        }
        stage('Docker Image Build For My Java Application') {
            steps {
                sh 'sudo docker build -t java-app .'
            }
        }
        stage('Tag Image with Repository Name') {
            steps {
                sh 'sudo  docker tag java-app artibhoir369/java-app'
            }
        }
        
        stage('DockerLogin') {
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                sh 'sudo docker login --username artibhoir369 --password-stdin $pass'
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
