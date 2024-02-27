#!/bin/bash

echo "Installing tiup"
cd /tmp || exit

curl --proto '=https' --tlsv1.2 -sSf https://tiup-mirrors.pingcap.com/install.sh | sh
echo "export PATH=$PATH:/root/.tiup/bin" >>~/.bashrc
