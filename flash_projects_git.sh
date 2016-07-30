## echeck project git dir IS exist??
cd /home/backup_root/git_backup/projects/git_root
for d in `cat ../project_list.txt`; 
do
echo "flash project $d"
if [ ! -d ./$d ]; then
   mkdir -p $d
   cd $d 
   echo " befor At: " `pwd`
   cd ../
   echo " At: " `pwd`
   git clone https://192.168.1.227/$d.git
   cd ..
else
   cd $d
   echo " At: " `pwd`
   git pull https://192.168.1.227/$d.git 
   cd ../..
fi
done
