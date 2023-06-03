pipeline {
    agent any
    environment {
        pom = readMavenPom file: 'pom.xml'
        name = sh(returnStdout: true, script: "echo $pom | awk -F':' '{print \$2}'")
        version = sh(returnStdout: true, script: "echo $pom | awk -F':' '{print \$4}'")
        tag = sh(returnStdout: true, script: "echo $pom | awk -F':' '{print \$2 \":\" $env.BUILD_NUMBER}'")
    }
    tools{
        maven 'MavenTool'
    }
    stages {
        stage("SonarQube Analysis") {
            steps {
                withSonarQubeEnv('SonarQubeServer') {
                    sh "mvn sonar:sonar"
                }
             }
        }
    }
}

