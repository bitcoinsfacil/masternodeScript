#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2019
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/nocollateral/cryptradecoind.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='cryptrade-project/cryptradecoin-core'
# Display Name.
DAEMON_NAME='CryptradeCoin Core'
# Coin Ticker.
TICKER='CRCO'
# Binary base name.
BIN_BASE='cryptradecoin'
# Directory.
DIRECTORY='.cryptradecoin'
# Conf File.
CONF='cryptradecoin.conf'
# Port.
DEFAULT_PORT=15600
# Explorer URL.
EXPLORER_URL='https://explorer.cryptrade.io/'
# Rate limit explorer.
EXPLORER_SLEEP=1
# Amount of Collateral needed.
COLLATERAL=1000
# Direct Daemon Download if github has no releases.
DAEMON_DOWNLOAD=''
# Blocktime in seconds.
BLOCKTIME=60
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=1


# Tip Address.
TIPS='CPiWCUp8coUHLtCCKthQVUT3YKyNCp3s3x'
# Dropbox Addnodes.
DROPBOX_ADDNODES='4aid1d9iz51h6cl'
# If set to 1 then use addnodes from dropbox.
USE_DROPBOX_ADDNODES=1
# Dropbox Bootstrap.
DROPBOX_BOOTSTRAP='ljrboausnpzctk3'
# If set to 1 then use bootstrap from dropbox.
USE_DROPBOX_BOOTSTRAP=1
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='ags9kk9526fzmnj'

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "CRYPTRADECOIN"
  ____                  _                 _       ____      _       
 / ___|_ __ _   _ _ __ | |_ _ __ __ _  __| | ___ / ___|___ (_)_ __  
| |   | '__| | | | '_ \| __| '__/ _` |/ _` |/ _ \ |   / _ \| | '_ \ 
| |___| |  | |_| | |_) | |_| | | (_| | (_| |  __/ |__| (_) | | | | |
 \____|_|   \__, | .__/ \__|_|  \__,_|\__,_|\___|\____\___/|_|_| |_|
            |___/|_|                                                
  ____               
 / ___|___  _ __ ___ 
| |   / _ \| '__/ _ \
| |__| (_) | | |  __/
 \____\___/|_|  \___|

CRYPTRADECOIN
}

# Discord User Info
# @mcarper#0918
# 401161988744544258
cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- gist.githack.com/mikeytown2/1637d98130ac7dfbfa4d24bac0598107/raw/6c7d9b7c8cad8cf0831686bd50a917cac4172133/mcarper.sh -O ~/___mn.sh
  COUNTER=1
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

(
# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
DAEMON_SETUP_THREAD
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane 2>/dev/null

