#!/bin/bash
echo "Make sure to configure AWS CLI First"
echo "Enter AWS Region Name Ex. ap-south-1"
read regionName
sed -i "s/region.*/region = $regionName/g" ~/.aws/config
echo "                       "
cat ~/.aws/config
echo "                       "
aws cloudwatch describe-alarms --alarm-types MetricAlarm CompositeAlarm | grep "AlarmName" | cut -d '"' -f 4 > alarmsList
totalAlarmsCount=`echo alarmsList | wc -l`
echo "Total Alarms Count: $totalAlarmsCount"
input="alarmsList"
lineNumber=1
while IFS= read -r line
do
  echo "Line Number: $lineNumber"
  echo "$line"
  aws cloudwatch delete-alarms --alarm-names "$line"
  echo "deleted"
  lineNumber=$((lineNumber+1))
  echo "                             "
  echo "                             "
done < "$input"
rm -rf alarmsList
