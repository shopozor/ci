#! /bin/bash

installDocker() {
    # this move is necessary otherwise the installation asks whether we want to keep it
    mv /etc/init.d/kmod /etc/init.d/kmod.back
    apt -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    apt-key fingerprint 0EBFCD88
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    apt update
    apt -y install docker-ce docker-ce-cli containerd.io
    service docker start
    usermod -aG docker jenkins
}

installDockerCompose() {
    local remoteBin=docker-compose-Linux-x86_64
    curl -s https://api.github.com/repos/docker/compose/releases/latest \
    | grep browser_download_url \
    | grep $remoteBin \
    | cut -d '"' -f 4 \
    | wget -qi -
    chmod +x $remoteBin
    mv $remoteBin /usr/local/bin/docker-compose
}

installDocker 
installDockerCompose