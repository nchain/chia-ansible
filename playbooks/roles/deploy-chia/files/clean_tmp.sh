#!/bin/bash 

for x in {0..7}
do
    tmp_dir="/mnt/ssd/0$x"
    rm -rf $tmp_dir/*
    sudo mkdir -p $tmp_dir
    sudo chown rad. $tmp_dir
done