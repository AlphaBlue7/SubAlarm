# Subdomain-Alert-Bot
Script written in bash that checks for subdomains at regular time interval to identify and notify the user as and when a new subdomain goes live


I finally tried my hand at scripting and I'm pleased to say that I wrote this script based on the showcase of the `subfinder`, `notify` tool by [@projectdiscovery](https://github.com/projectdiscovery/) on NahamSec's youtube channel over here https://youtu.be/wP3n1JnqtMU .




## Prerequisites
1. Golang should be installed `sudo apt install golang -y`

2. The GOPATH [/home/**USERNAME**/go/bin/] should be added to the $PATH environment variable

3. subfinder by projectdiscovery is to be installed (`go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest`).

4. notify by projectdiscovery is to be installed (`go install -v github.com/projectdiscovery/notify/cmd/notify@latest`).

5. -- Telegram bot made using [@botfather](https://web.telegram.org/k/#@BotFather) on telegram and it's API Key and chat IDs

   A. -- Instead of Telegram any of the providers mentioned here can be used `https://github.com/projectdiscovery/notify#provider-config` . It goes to say that the `alert_sub.sh ` and the `alertconfig.yaml ` files must be altered accordingly




## Algorithm
1. The list of already identified subdomains are to pasted in `subop.txt`.

2. sort is used to alphabatically arrange the list of subdomains in `subop.txt`

3. subfinder is used to generate a list of subdomains of the target domain and are saved in `subop1.txt` once sorted alphabetically.

4. diff is used in tandum with grep and sed to identify the differences and the output is saved to `newsubdomains.txt`

5. The notify tool is integrated with telegram in my interpretation.

6. Making use of the above integration the bot sends the user a notification alerting the user of the new domains identified

7. The `runcount.txt` is used to keep track of the number of iterations

8. The script runs at an interval of 60 minutes




## Contact
You can reach out to me on my Linkedin: https://www.linkedin.com/in/arjun-sankar-m/
