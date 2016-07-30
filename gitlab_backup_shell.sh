#!/bin/bash

if [ `id -u` -ne 0 ];then
   echo "this backup script must be exec as root."
   exit
fi
PATH=/opt/gitlab-8.2.3-3/nodejs/bin:/opt/gitlab-8.2.3-3/apps/gitlabci/gitlabci-multirunner:/opt/gitlab-8.2.3-3/apps/gitlab/gitlab-shell/bin:/opt/gitlab-8.2.3-3/redis/bin:/opt/gitlab-8.2.3-3/sqlite/bin:/opt/gitlab-8.2.3-3/python/bin:/opt/gitlab-8.2.3-3/perl/bin:/opt/gitlab-8.2.3-3/git/bin:/opt/gitlab-8.2.3-3/ruby/bin:/opt/gitlab-8.2.3-3/mysql/bin:/opt/gitlab-8.2.3-3/php/bin:/opt/gitlab-8.2.3-3/postgresql/bin:/opt/gitlab-8.2.3-3/apache2/bin:/opt/gitlab-8.2.3-3/common/bin:/opt/envconfig/jdk1.8.0_65/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/apache-maven-3.3.3/bin:/root/bin:$PATH

echo "backup gitlab to local storage begin.. "
date

cd /opt/gitlab-8.2.3-3/apps/gitlab/htdocs
BK_DIR=/opt/gitlab-8.2.3-3/apps/gitlab/htdocs/tmp
rm -rf $BK_DIR/backups

bundle exec bin/rake gitlab:backup:create RAILS_ENV=production

## tar tatal backup artifacts to single tar.gz
CUR_DT=`date +%F`
cd $BK_DIR
rm -f gitlab_bak_pre.tar.gz
mv gitlab_bak.tar.gz gitlab_bak_pre.tar.gz
tar -czf gitlab_bak.tar.gz ./backups
#echo "rsync  -avzP  --delete  /data/backups_gitlab xxx@xxx.com:/mnt/disk1/docs/rsync_gitlab_backup"
#rsync  -avzP  --delete  /data/backups_gitlab  xxx@xxx.com:/mnt/disk1/docs/rsync_gitlab_backup/

date
echo "gitlab backup job is end."
