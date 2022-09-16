#!/bin/bash
PWD=$(pwd)
THE_USER=$(whoami)
chmod +x auto-push.sh
CROBTAB_FILE=/etc/crontab-${THE_USER}
echo "10   18  * * *     cd ${PWD} && ./auto-push.sh" >> ${CROBTAB_FILE}
crontab -u ${THE_USER} ${CROBTAB_FILE}