pipeline {
    agent any
    environment {
        pom = readMavenPom file: 'pom.xml'
        mven = tool 'MavenTool'
    }
    tools{
        maven 'MavenTool'
    }
    stages {
        stage("Ramas PR") {
            steps {
                sh "./ramas.sh build"
            }
        }
        stage("SonarQube Analysis") {
            steps {
                withSonarQubeEnv('SonarQubeServer') {
                    sh "mvn sonar:sonar -Dsonar.projectKey=PR-proyect"
                }
             }
        }
    }
}

