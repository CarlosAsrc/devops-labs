function zipFolder {
    backupDir="backup/data/$(date +'%d-%m-%Y')"
    mkdir -p $backupDir
    zip -r $backupDir/backup-file.zip $1
}

zipFolder $1