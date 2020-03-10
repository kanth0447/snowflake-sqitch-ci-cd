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
        withCredentials(bindings: [usernamePassword(credentialsId: 'snowflake', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh '''
<<<<<<< HEAD
              sqitch deploy "db:snowflake://kanth0447:Kanth_957@cla38590.us-east-1.snowflakecomputing.com/flipr?Driver=Snowflake;warehouse=COMPUTE_WH"
=======
              sqitch deploy "db:snowflake://kanth0447:Kanth_957@cla38590.us-east-1/flipr?Driver=Snowflake;warehouse=COMPUTE_WH"
>>>>>>> e26097a223d267a9e49ecf038a7b314d9aa3b641
              '''           
        }
      }
    }
    stage('Verify changes') {
      steps {
        withCredentials(bindings: [usernamePassword(credentialsId: 'snowflake', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh '''
<<<<<<< HEAD
              sqitch verify "db:snowflake://kanth0447:Kanth_957@cla38590.us-east-1.snowflakecomputing.com//flipr?Driver=Snowflake;warehouse=COMPUTE_WH"
=======
              sqitch verify "db:snowflake://kanth0447:Kanth_957@cla38590.us-east-1/flipr?Driver=Snowflake;warehouse=COMPUTE_WH"
>>>>>>> e26097a223d267a9e49ecf038a7b314d9aa3b641
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
