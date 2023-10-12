#!/bin/bash

iterationcount=$(cat runcount.txt)
cat subop.txt | sort > subop.txt

while true;
do
 subfinder -silent -d TARGETWEBSITE.com -all | sort > subop1.txt
 diff subop.txt subop1.txt | grep '^<' | sed 's/^< //' > newsubdomains.txt
 subcount=$(cat newsubdomains.txt | wc -l)

 if [ "$subcount" -ne 0 ]; then
  echo "    telegram_format: 'You have $subcount new subdomains for TARGETWEBSITE.com. The new subdomains are: {{data}}'" >> alertconfig.yaml;
  notify -pc alertconfig.yaml -silent -data newsubdomains.txt  -provider telegram -bulk
 fi
 ((iterationcount++))
 echo "$iterationcount" > runcount.txt
 sleep 3600

done
