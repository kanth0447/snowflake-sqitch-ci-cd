pipeline {
    options {
      timeout(time: 1, unit: 'HOURS') 
  }
  agent {
    docker {
      image 'hashmapinc/sqitch:snowflake-dev'
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
        withCredentials(bindings: [usernamePassword(credentialsId: 'snowflake', usernameVariable: 'Username', passwordVariable: 'Password')]) {
          sh '''
              sqitch deploy "db:snowflake://kanth0447:Kanth_957@hashmap.snowflakecomputing.com/flipr?Driver=Snowflake;warehouse=sqitch_wh"
              '''           
        }
      }
    }
    stage('Verify changes') {
      steps {
        withCredentials(bindings: [usernamePassword(credentialsId: 'snowflake', usernameVariable: 'Username', passwordVariable: 'Password')]) {
          sh '''
              sqitch verify "db:snowflake://kanth0447:Kanth_957@hashmap.snowflakecomputing.com/flipr?Driver=Snowflake;warehouse=sqitch_wh"
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
