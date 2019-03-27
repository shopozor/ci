#! /bin/bash

if [ $# -ne 1 ] ; then 
  echo "Usage: $0 <path-to-plugins-list>"
  exit 0
fi

USER=admin
PASSWORD=$(cat /var/jenkins_home/secrets/initialAdminPassword)
CLI="java -jar /var/jenkins_home/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ -auth $USER:$PASSWORD"

PATH_TO_PLUGINS_LIST=$1

while read plugin
do
  list=$list" "$plugin
done < $PATH_TO_PLUGINS_LIST

for plugin in $list
do
  $CLI install-plugin $plugin
done
