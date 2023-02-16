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
                sh 'mvn clean install package'
            }
        }
        stage('Docker Image Build For My Java Application') {
            steps {
                sh 'docker build -t java-app .'
            }
        }
        stage('Tag Image with Repository Name') {
            steps {
                sh 'docker tag java-app artibhoir369/java-app'
            }
        }
        
        stage('DockerLogin') {
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                sh 'docker login --username artibhoir369 --password-stdin $pass'
                }
            }
        }
        
        stage('Pushing the image') {
            steps {
                sh 'docker push artibhoir369/java-app'
            }
        }
    }
}
