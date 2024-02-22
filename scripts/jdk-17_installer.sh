#!/bin/sh -e
# https://github.com/adoptium/temurin17-binaries/releases
JDK_DOWNLOAD_LINK="https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz" 

sudo rm -rf /opt/jdk-17

sudo wget -O /opt/jdk.tar.gz  $JDK_DOWNLOAD_LINK

sudo tar -xzf /opt/jdk.tar.gz -C /opt

FOLDER_NAME=$(sudo find /opt -type d -name "jdk-*" | head -1)

sudo mv -f $FOLDER_NAME /opt/jdk-17

sudo rm /opt/jdk.tar.gz