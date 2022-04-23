#!/bin/bash

VSCODE_URL="https://go.microsoft.com/fwlink/?LinkID=760868"
MAX_STEP=4

step=0

step=$((step+1))
echo ==== STEP $step/$max_step: INSTALL PYTHON3
sudo apt install python3

step=$((step+1))
echo ==== STEP $step/$max_step: DOWNLOAD VSCODE
curl -L -o vscode.deb "$VSCODE_URL"

step=$((step+1))
echo ==== STEP $step/$max_step: INSTALL VSCODE
sudo dpkg -i vscode.deb
rm vscode.deb

step=$((step+1))
echo ==== STEP $step/$max_step: SETUP VSCODE
code  \
  --install-extension ms-python.python  \
  --install-extension MS-CEINTL.vscode-language-pack-ja
