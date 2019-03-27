#! /bin/bash

if [ $# -ne 1 ] ; then 
  echo "Usage: $0 <path-to-credential-xml>"
  exit 0
fi

USER=admin
PASSWORD=$(cat /var/jenkins_home/secrets/initialAdminPassword)
CLI="java -jar /var/jenkins_home/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ -auth $USER:$PASSWORD"

$CLI create-credentials-by-xml system::system::jenkins _  < $1