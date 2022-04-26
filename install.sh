#!/bin/bash

VSCODE_URL="https://go.microsoft.com/fwlink/?LinkID=760868"
MAX_STEP=4

step=0

step=$((step+1))
echo ==== STEP $step/$MAX_STEP: INSTALL PYTHON3
sudo apt install python3

step=$((step+1))
echo ==== STEP $step/$MAX_STEP: DOWNLOAD VSCODE
curl -L -o vscode.deb "$VSCODE_URL"

step=$((step+1))
echo ==== STEP $step/$MAX_STEP: INSTALL VSCODE
sudo dpkg -i vscode.deb
rm vscode.deb

step=$((step+1))
echo ==== STEP $step/$MAX_STEP: SETUP VSCODE
code  \
  --force  \
  --install-extension ms-python.python  \
  --install-extension MS-CEINTL.vscode-language-pack-ja
