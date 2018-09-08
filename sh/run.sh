#! /usr/bin/env bash

project_port=8080
project="mobvoiaccount"
run_name="mobvoi_account_main"

if [ $1 = "mobvoi-account" ]
then
  project_port=8081
  project="mobvoiaccount"
  run_name="mobvoi_account_main"
elif [$1="ticassistant"]
then
  project_port=8082
  project="ticassistant"
  run_name="tic_assistant_run"
fi

echo $project_port
cd ~/git/backend
location="java/com/mobvoi/be/"$project"/"$run_name
bazel run --color=yes --jvmopt="-server -Dserver.port=$project_port" $location | cat
