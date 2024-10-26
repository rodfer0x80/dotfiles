#!/bin/sh


ssh -i ~/.ssh/anarchybox webmaster@192.168.1.123 -t /home/webmaster/scripts/backup.sh 
scp -i ~/.ssh/anarchybox anarchybox:/home/webmaster/anarchybox.tar.gz ~/vms/anarchybox.tar.gz
CWD=$PWD
cd ~/vms &&\ 
  tar xfv ~/vms/anarchybox.tar.gz &&\
  mv anarchybox ~/rubbish &&\
  mv ./home/webmaster/anarchybox . &&\
  mv ./home ~/rubbish/anarchybox_home
cd $CWD &&\
  rm -rf ~/vms/anarchybox.tar.gz
