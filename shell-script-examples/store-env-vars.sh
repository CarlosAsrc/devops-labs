 backupConfDir="backup/conf/$(date +'%d-%m-%Y')"
 mkdir -p $backupConfDir
 printenv > $backupConfDir/env_data.txt