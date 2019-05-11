#! /bin/bash

if [ $# -ne 4 ] ; then
  echo "Usage: $0 <username> <password> <adminUsername> <adminPassword>"
  exit
fi

ADMIN_USER=$3
ADMIN_PASSWORD=$4

CLI="java -jar /var/jenkins_home/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ -auth ${ADMIN_USER}:${ADMIN_PASSWORD}"

USER=$1
PASSWORD=$2

echo "jenkins.model.Jenkins.instance.securityRealm.createAccount(\"$USER\", \"$PASSWORD\")" | $CLI -noKeyAuth groovy = –