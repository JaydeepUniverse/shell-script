#!/bin/bash

echo "                      "
scriptName=`echo "$0" | sed 's/\.\///g'`
dos2unix $scriptName

echo "                      "
ls -ltrh; echo "                      "

echo "                      "
printf "Hello\n"

echo "                      "
printf "Test %s %s %d\n" Hello World 5

echo "                      "
grep -i "cloudfront" < aws_all_services_overview.txt > output-1.txt
cat output-1.txt
date >> output-2.txt
cat output-2.txt

echo "                      "
if grep -i "cloudfront" aws_all_services_overview.txt > /dev/null
then
  echo ok
else
  echo not ok
fi

echo "                      "
echo $1
set -x
printf "%s %s %d\n" Hello World 10
set +x

echo "                      "
