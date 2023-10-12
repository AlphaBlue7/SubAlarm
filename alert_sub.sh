#!/bin/bash

iterationcount=$(cat runcount.txt)
cat subop.txt | sort > subop.txt

while true;
do
 subfinder -silent -dL targetdomainlist.txt -all | sort > subop1.txt
 diff subop.txt subop1.txt | grep '^>' | sed 's/^> //' > newsubdomains.txt
 subcount=$(cat newsubdomains.txt | wc -l)

 if [ "$subcount" -ne 0 ]; then
  echo "    telegram_format: 'You have $subcount new subdomains. The new subdomains are: {{data}}'" >> config.yaml && notify -pc config.yaml -silent -data newsubdomains.txt  -provider telegram -bulk;
 fi

 head -n 5 config.yaml > temp.txt && mv temp.txt config.yaml
 cat newsubdomains.txt >> subop.txt
 cat subop.txt | sort > subop.txt

 ((iterationcount++))
 echo "$iterationcount" > runcount.txt
 sleep 3600

done
