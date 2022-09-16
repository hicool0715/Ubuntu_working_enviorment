#!/bin/bash
LOG_DIR=${PWD}/AUTO_PUSH_LOG
LOG_FILE=${LOG_DIR}/auto-push.log
SH_DIR=${PWD}

echo "log dir: ${LOG_DIR}"
echo "OPT dir: ${SH_DIR}"

cd ${SH_DIR}

git add .
if [ ! -d  ${LOG_DIR} ]
then
mkdir -p ${LOG_DIR}
fi
date >> ${LOG_FILE}
if [ $? -ne 0 ];then 
    echo '       >>>FAILD: git add . faild' >> ${LOG_FILE}
    
    exit 1
fi
git commit -a -m "$(date): commited by auto push"
if [ $? -ne 0 ];then 
    echo "       >>>FAILD: git commit -a -m \"commited by auto push\" faild" >> ${LOG_FILE}
    
    exit 1
fi

git push -u origin main:main
if [ $? -ne 0 ];then 
    echo  "       >>>FAILD: git push -u origin main:main faild" >> ${LOG_FILE}
    
    exit 1
fi

echo -e "       >>>SUCCEED: update notes to github succeed\n\n" >> ${LOG_FILE}
exit 0
