podTemplate(yaml: readTrusted('pod.yaml')) { 
  node(POD_LABEL) { 
     stage('Run Test') { 
            container('nginx') { 
                stage('Shell Execution') { 
                    sh 'sleep infinity'  
                } 
            } 
        } 
  } 
} 
