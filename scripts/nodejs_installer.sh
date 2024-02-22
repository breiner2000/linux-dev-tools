#!/bin/sh -e
# https://nodejs.org/dist/latest/
NODE_DOWNLOAD_LINK="https://nodejs.org/dist/v21.6.2/node-v21.6.2-linux-x64.tar.xz" 

sudo rm -rf /opt/node

sudo wget -O /opt/nodejs.tar.xz  $NODE_DOWNLOAD_LINK

sudo tar -xf /opt/nodejs.tar.xz -C /opt

FOLDER_NAME=$(sudo find /opt -type d -name "node-*" | head -1)

sudo mv -f $FOLDER_NAME /opt/node

sudo rm /opt/nodejs.tar.xz
