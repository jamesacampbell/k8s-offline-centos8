#!/bin/bash
RED='\033[1;31m'
txtrst='\033[0m'
GREEN='\033[0;32m'

printf "${RED} [%%] ${txtrst} Installing Docker CE local rpm to prep for tarball (not installing on machine)...\n"
sudo yum-config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --enable docker-ce-nightly
sudo yum makecache
mkdir -p ${HOME}/docker
cd ${HOME}/docker
printf "${RED} [%%] ${txtrst} Getting all of the dependancies localized...\n"
sudo repoquery --requires --resolve --recursive docker-ce | xargs -r yumdownloader
printf "${RED} [%%] ${txtrst} Compressing the folder of docker stuff to a tarball and saves it to the user home directory as docker.tar.gz...\n"
tar cvzf ${HOME}/docker.tar.gz *
printf "${GREEN} [%%] ${txtrst} Docker prep complete. SCP docker.tar.gz to the offline server or manually transfer it over.\n"