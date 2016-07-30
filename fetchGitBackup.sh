cd /home/backup_root/git_backup
sshpass -p 123123 scp root@192.168.1.227:/opt/gitlab-8.2.3-3/apps/gitlab/htdocs/tmp/gitlab_bak.tar.gz /home/backup_root/git_backup/
mv ./gitlab_bak.tar.gz gitlab_bak.`date +%F`.tar.gz
