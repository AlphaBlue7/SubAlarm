#!/bin/bash

while true;
do subfinder -silent -d targetdomain.com -all -o subop1.txt | anew subop.txt > newsubdomains.txt;
subcount=$(cat newsubdomains.txt | wc -l)
iterationcount=$(cat runcount.txt)

 if [ "$subcount" -ne 0 ]
  then
   echo "    telegram_format: 'You have $subcount new subdomains for tidal.com. The new subdomains are: {{data}}'" >> alertconfig.yaml;
   notify -pc alertconfig.yaml -silent -data newsubdomains.txt  -provider telegram -bulk
 fi

iterationcount=$((iterationcount + 1))
echo "$iterationcount" > runcount.txt

sleep 60m
done
