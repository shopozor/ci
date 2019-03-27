#! /bin/bash

if [ $# -ne 1 ] ; then 
  echo "Usage: $0 <plugin-name>"
  exit 0
fi

USER=admin
PASSWORD=$(cat /var/jenkins_home/secrets/initialAdminPassword)
CLI="java -jar /var/jenkins_home/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ -auth $USER:$PASSWORD"

PLUGIN_NAME=$1

$CLI install-plugin $PLUGIN_NAME
