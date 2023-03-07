#!/bin/bash

commit_message=$1
tag_version=$2
tag_message=$3
bucket_path=$4

aws s3 sync ${bucket_path} ./train_data/
dvc add train_data
git add train_data.dvc
git commit -m "${commit_message}"
git tag -a ${tag_version} -m "${tag_message}"
git push
git push origin ${tag_version}
dvc push