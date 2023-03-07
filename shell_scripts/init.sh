#!/bin/bash

dvc init
dvc remote add -d storage s3://dvc-test-jw
git add .dvc/config
git commit -m "Initialize DVC"
git push