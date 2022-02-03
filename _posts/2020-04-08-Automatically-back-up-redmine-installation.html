---           
layout: post
title: Automatically back up redmine installation
date: 2020-04-08 13:30:24 UTC
updated: 2020-04-08 13:30:24 UTC
comments: false
categories: 
---

# required settings<br />DB_USERNAME=''<br />DB_PASSWORD=''<br />DB_NAME=''<br />REDMINE_ROOT='' # e.g. /home/peter/rails/redmine.commanigy.com'<br />BACKUP_ROOT='' # e.g. /home/peter/backups (will be created)<br /><br /># optional settings<br />GS_ROOT='gs://redmine-backup'<br />GS_FILENAME='backup_'`date +%Y%m%d`'.tar.gz'<br /><br />echo 'Setting up directories'<br />mkdir $BACKUP_ROOT/redmine/db -p<br />mkdir $BACKUP_ROOT/redmine/files -p<br /><br />echo 'Backing up database'<br />/usr/bin/mysqldump -u $DB_USERNAME --password=$DB_PASSWORD $DB_NAME | gzip &gt; $BACKUP_ROOT/redmine/db/`date +%Y%m%d`.gz<br /><br />echo 'Backing up attachments'<br />rsync -a $REDMINE_ROOT/files/ $BACKUP_ROOT/redmine/files/<br /><br />echo 'Packing into single archive'<br />tar -czPf $GS_FILENAME $BACKUP_ROOT/redmine/<br /><br />echo 'Creating bucket on Google Storage (if not already created)'<br />gsutil mb $GS_ROOT<br /><br />echo 'Copying backup archive to Google Storage'<br />gsutil cp $GS_FILENAME $GS_ROOT<br /><br />echo 'Cleanup by removing archive'<br />rm $GS_FILENAME<br /><br />echo 'Backup complete'