#! /usr/bin/env bash

profile=$(cat /home/mobvoi/mysql-data/profile)
account=$(cat /home/mobvoi/mysql-data/account)

profile_array=($profile)
account_array=($account)

for wwid in ${account_array[@]}
do
  if echo "${profile_array[@]}" | grep -w $wwid &> /dev/null;
  then
    echo $wwid >> /home/mobvoi/mysql-data/backup
  else
    echo $wwid >> /home/mobvoi/mysql-data/diff
  fi
done



#cat /home/mobvoi/mysql-data/test1 | read line1
#cat /home/mobvoi/mysql-data/test0 | while read line
#do
#  if [ $line1=$line ]
#  then
#    cat /home/mobvoi/mysql-data/test1 | read line1
#  else
#    echo $line >> /home/mobvoi/mysql-data/diff
#  fi
#done

#cat /home/mobvoi/test002 | while read line1
#do
#    echo "File:${line1}"
#done

#while read line
#do 
#    echo "File:${line}"
#done < /home/mobvoi/test002
