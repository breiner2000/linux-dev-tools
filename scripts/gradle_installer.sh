#!/bin/sh -e

GRADLE_DOWNLOAD_LINK="https://services.gradle.org/distributions/gradle-8.4-bin.zip"

sudo rm -rf /opt/gradle

sudo wget -O /opt/gradle.zip  $GRADLE_DOWNLOAD_LINK

sudo unzip /opt/gradle.zip -d /opt

FOLDER_NAME=$(sudo find /opt -type d -name "gradle-*" | head -1)

sudo mv -f $FOLDER_NAME /opt/gradle

sudo rm /opt/gradle.zip

