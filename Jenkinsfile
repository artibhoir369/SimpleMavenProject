pipeline{
    agent any
    
    tools{
        maven "maven"
        jdk "jdk"
    }
    
    stages{
        stage(checkout){
            steps{
                git 'https://github.com/artibhoir369/SimpleMavenProject.git'
            }
        }
        stage(Test){
            steps{
                sh "mvn test"
            }
        }
        stage(build){
            steps{
                sh "mvn clean install"
            }
        }
    }
}
