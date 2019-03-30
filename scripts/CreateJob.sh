#! /bin/bash

if [ $# -ne 1 ] ; then
  echo "Usage: $0 <job-name>"
  exit
fi

USER=admin
PASSWORD=$(cat /var/jenkins_home/secrets/initialAdminPassword)
CLI="java -jar /var/jenkins_home/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ -auth $USER:$PASSWORD"

JOB_NAME=$1

cat ${JOB_NAME}.xml | $CLI create-job $JOB_NAME
