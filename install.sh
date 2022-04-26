#!/bin/bash

VSCODE_URL="https://go.microsoft.com/fwlink/?LinkID=760868"
MAX_STEP=5

VSCODE_CONFIG=$(cat << EOS
{
  "disable-color-correct-rendering": true,
  "enable-crash-reporter": true,
  "crash-reporter-id": "4cdf0df8-84df-439e-9bee-d18a8ce22d53",
  "locale": "ja"
}
EOS
)
FCITX_CONFIG=$(cat << EOS
[Profile]
IMName=mozc
EnabledIMList=mozc:True
EOS
)

step=0

step=$((step+1))
echo ==== STEP $step/$MAX_STEP: INSTALL PYTHON3
sudo apt install python3

step=$((step+1))
echo ==== STEP $step/$MAX_STEP: INSTALL IME
sudo apt -y install fcitx-mozc
mkdir -p ~/.config/fcitx
echo "$FCITX_CONFIG" > ~/.config/fcitx/profile
echo "fcitx-autostart &" >> ~/.sommelierrc
fcitx-autostart &

step=$((step+1))
echo ==== STEP $step/$MAX_STEP: DOWNLOAD VSCODE
curl -L -o vscode.deb "$VSCODE_URL"

step=$((step+1))
echo ==== STEP $step/$MAX_STEP: INSTALL VSCODE
sudo dpkg -i vscode.deb
sudo apt -f -y install
rm vscode.deb

step=$((step+1))
echo ==== STEP $step/$MAX_STEP: SETUP VSCODE
mkdir -p ~/.vscode

code  \
  --force  \
  --install-extension ms-python.python  \
  --install-extension MS-CEINTL.vscode-language-pack-ja

echo starting vscode...
sleep 1s
echo -e "$VSCODE_CONFIG" > ~/.vscode/argv.json
sleep 1s
code
