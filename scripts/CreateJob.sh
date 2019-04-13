#! /bin/bash

if [ $# -ne 3 ] ; then
  echo "Usage: $0 <job-name> <username> <password>"
  exit
fi

USER=$2
PASSWORD=$3

CLI="java -jar /var/jenkins_home/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ -auth $USER:$PASSWORD"

JOB_NAME=$1

cat ${JOB_NAME}.xml | $CLI create-job $JOB_NAME