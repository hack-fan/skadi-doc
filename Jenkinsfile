pipeline {
    agent any
    environment {
        IMAGE_NAME = "doc"
        JOB_NAME = "ServerRun Doc"
        CODING_DOCKER_REG_HOST = "${env.CCI_CURRENT_TEAM}-docker.pkg.${env.CCI_CURRENT_DOMAIN}"
        DOCKER_IMAGE_NAME = "${env.CODING_DOCKER_REG_HOST}/${env.PROJECT_NAME}/images/${IMAGE_NAME}"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: env.GIT_BUILD_REF]],
                extensions: [[
                    $class: 'SubmoduleOption',
                    disableSubmodules: false,
                    parentCredentials: false,
                    recursiveSubmodules: true,
                    reference: '',
                    trackingSubmodules: false
                ]],
                userRemoteConfigs: [[url: env.GIT_REPO_URL, credentialsId: env.CREDENTIALS_ID]]])
            }
        }
        stage('Build & Push') {
            steps {
                script {
                    docker.withRegistry("https://${env.CODING_DOCKER_REG_HOST}", "${env.CODING_ARTIFACTS_CREDENTIALS_ID}") {
                        def img = docker.build("${env.DOCKER_IMAGE_NAME}:latest")
                        img.push()
                    }
                }
            }
        }
    }
}