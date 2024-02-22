#!/bin/sh -e
# https://maven.apache.org/download.cgi
MAVEN_DOWNLOAD_LINK="https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz"

sudo rm -rf /opt/maven

sudo wget -O /opt/maven.tar.gz  $MAVEN_DOWNLOAD_LINK

sudo tar -xzf /opt/maven.tar.gz -C /opt

FOLDER_NAME=$(sudo find /opt -type d -name "apache-maven-*" | head -1)

sudo mv -f $FOLDER_NAME /opt/maven

sudo rm /opt/maven.tar.gz