# Subdomain-Alert-Bot
Script written in bash that checks for subdomains at regular time interval to identify and notify the user as and when a new subdomain goes live


I finally tried my hand at scripting and I'm pleased to say that I wrote this script based on the showcase of the `subfinder`, `notify` tool by [@projectdiscovery](https://github.com/projectdiscovery/) on NahamSec's youtube channel over here https://youtu.be/wP3n1JnqtMU . This script also uses the `anew` tool made by [@tomnomnom](https://github.com/tomnomnom/)




## Prerequisites
1. Golang should be installed `sudo apt install golang -y`

2. The GOPATH [/home/**USERNAME**/go/bin/] should be added to the $PATH environment variable

3. subfinder by projectdiscovery is to be installed (`go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest`).

4. notify by projectdiscovery is to be installed (`go install -v github.com/projectdiscovery/notify/cmd/notify@latest`).

5. anew by tomnomnom is to be installed (`go install -v github.com/tomnomnom/anew@latest`).

6. -- Telegram bot made using @botfather on telegram and it's API Key and chat IDs

   A. -- Instead of Telegram any of the providers mentioned here can be used `https://github.com/projectdiscovery/notify#provider-config` . It goes to say that the `alert_sub.sh ` and the `alertconfig.yaml ` files must be altered accordingly




## Algorithm
1. The list of already identified subdomains are to pasted in `subop.txt`.

2. subfinder is used to generate a list of subdomains of the target domain and are saved in `subop1.txt`.

3. anew is used to compare the two lists and identify the new domain(s) that went live.

4. The notify tool is integrated with telegram in my interpretation.

5. Making use of the above integration the bot sends the user a notification alerting the user of the new domains identified

6. The `runcount.txt` is used to keep track of the number of iterations

7. The script runs at an interval of 60 minutes




## Contact
You can reach out to me on my Linkedin: https://www.linkedin.com/in/arjun-sankar-m/
