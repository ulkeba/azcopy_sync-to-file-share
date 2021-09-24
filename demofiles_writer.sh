#!/bin/bash

mkdir -p ./demo-files

echo Creating / overwriting 20 files...
for i in {0..19};
do 
  head -c 100000 /dev/urandom > ./demo-files/f_$i.bin;
done;


while [ true ];
do
  sleep 10s
  nofiles=$(( RANDOM % 20))
  echo Updating $nofiles randomly selected files...
  for i in $( seq 0 $nofiles )
  do 
    f=$(( RANDOM % 20))
    head -c 100000 /dev/urandom > ./demo-files/f_$f.bin;
  done;
done;
