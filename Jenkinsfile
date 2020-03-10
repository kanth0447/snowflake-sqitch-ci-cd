pipeline {
    options {
      timeout(time: 1, unit: 'HOURS') 
  }
  agent {
    docker {
      image 'hashmapinc/sqitch:jenkins'
      args "-u root -v /var/run/docker.sock:/var/run/docker.sock --entrypoint=''"
    }
  }
  stages {
    stage('Installing Latest snowsql') {
        steps {
            sh 'snowsql --help'
        }
    }
    stage('Deploy changes') {
      steps {
        withCredentials(bindings: [usernamePassword(credentialsId: 'snowflake', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh '''
              sqitch deploy "db:snowflake://kanth0447:Kanth_957@cla38590.us-east-1.snowflakecomputing.com/flipr?Driver=Snowflake;warehouse=COMPUTE_SH"
             '''           
        }
      }
    }
    stage('Verify changes') {
      steps {
        withCredentials(bindings: [usernamePassword(credentialsId: 'snowflake', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh '''
              sqitch verify "db:snowflake://kanth0447:Kanth_957@cla38590.us-east-1.snowflakecomputing.com//flipr?Driver=Snowflake;warehouse=COMPUTE_SH"
             ''' 
        }
      }
    }      
  }  
post {
    always {
      sh 'chmod -R 777 .'
    }
  }
}
