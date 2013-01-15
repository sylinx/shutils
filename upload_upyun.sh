#!/bin/bash
LOG="/home/admin/output/logs/task/upload_upyun.log"
echo "sync start at "  `date +%Y_%m_%d_%H:%M` >>$LOG 2>&1
HOST="v1.ftp.upyun.com"
USER="your username"
PASS="your password"
LDIR="/home/admin/htdocs/static/images/"
RDIR="/"
lftp << EOF
set net:timeout 5
set net:reconnect-interval-max 5
set net:max-retries 1
set ftp:use-site-utime false
open ftp://$HOST
user $USER $PASS
lcd $LDIR
cd $RDIR
mirror -R $LDIR $RDIR
EOF
echo "sync end at " `date +%Y_%m_%d_%H:%M` >>$LOG 2>&1

