
#!/usr/bin/env bash

profile_file=/home/mobvoi/mysql-data/profile
account_file=/home/mobvoi/mysql-data/account

profile_index=1
account_index=1

profile_size=`sed -n '$=' $profile_file`
account_size=`sed -n '$=' $account_file`

#echo $profile
#echo $account
echo $profile_size
echo $account_size

while(($account_index <= $account_size))
do
  profile=`sed -n "$profile_index""p" $profile_file` 
  account=`sed -n "$account_index""p" $account_file`
  if [ $profile != $account ]
  then
    echo "diff"$account
    echo $account >> /home/mobvoi/mysql-data/diff.txt
  else
    echo "same"$account >> /home/mobvoi/mysql-data/same.txt
    let profile_index++
  fi
  let account_index++
done

