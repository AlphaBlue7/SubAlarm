# Subdomain-Alert-Bot
Script made in BASH that takes adavantage of preinstalled notify, subfinder and anew made available through $PATH to send telegram alerts to once new subdomains are identified


I wrote this script based on the showcase of the subfinder, notify tool by @projectdiscovery on NahamSec's youtube channel over here https://youtu.be/wP3n1JnqtMU . This script also uses the anew tool made by @tomnomnom


# Prerequisites
Golang should be installed `sudo apt install golang -y`
The GOPATH [ /home/<USERNAME>/go/bin/ ] should be added to the $PATH environment variable
subfinder and notify by projectdiscovery ( `go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest` and `go install -v github.com/projectdiscovery/notify/cmd/notify@latest` ) and anew by tomnomnom ( `go install -v github.com/tomnomnom/anew@latest` ) should be installed.
-- Telegram bot made using @botfather on telegram and it's API Key and chat IDs
-- Instead of Telegram any of the providers mentioned here can be used `https://github.com/projectdiscovery/notify#provider-config`


# Algorithm
The list of already identified subdomains are to pasted in `subop.txt`.
subfinder is used to generate a list of subdomains of the target domain and are saved in `subop1.txt`.
anew is used to compare the two lists and identify the new domain(s) that went live.
The notify tool is integrated with telegram in my interpretation.
Making use of the above integration the bot sends the user a notification alerting the user of the new domains identified 
The script runs at an interval of 60 minutes


# Contact
You can reach out to me on my Linkedin: https://www.linkedin.com/in/arjun-sankar-m/
