pipeline { 
  environment { 
    dockerimagename = "khiemdevops0902/test" 
    dockerImage = "" 
  } 
  agent any 
  stages { 
    stage('Checkout Source') { 
      steps { 
        git branch: 'main', credentialsId: 'githubCred', url: 'https://github.com/khiemict0902/Jenkinsk8sTest.git' 
      } 
    } 
    
    stage('Build image') { 
      steps{ 
        script { 
          sh 'whoami'
          sh 'groups'
          withEnv(['DOCKER_BUILDKIT=0']) {
                dockerImage = docker.build("${dockerimagename}:${BUILD_NUMBER}", "-f src/Dockerfile src")
            }
        } 
      } 
    }
    
    stage('Pushing Image') { 
      environment { 
          registryCredential = 'DockerCred' 
           } 
      steps{ 
        script { 
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) { 
            dockerImage.push("${BUILD_NUMBER}") 
          } 
        } 
      } 
    } 

    stage('Deploying container to Kubernetes') { 
      agent { 
        kubernetes { 
          cloud 'kubernetes' 
          yamlFile 'pod.yaml' 
        } 
      } 

      steps { 
            container('jnlp') { 
              sh "sed -i 's|khiemdevops0902/test:.*|khiemdevops0902/test:${BUILD_NUMBER}|g' ./k8s/deployment.yaml"
              sh 'kubectl apply -f ./k8s/deployment.yaml' 
          }      
      } 
    } 
  }
}
