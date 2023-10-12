# Subdomain-Alert-Bot
Script written in bash that perpetually checks for subdomains of teh target domains at regular intervals to identify and notify the user as and when a new subdomain goes live


I finally tried my hand at scripting and I'm pleased to say that I wrote this script based on the showcase of the `subfinder`, `notify` tool by [@projectdiscovery](https://github.com/projectdiscovery/) on NahamSec's youtube channel over here https://youtu.be/wP3n1JnqtMU .




## Prerequisites
1. **Golang** should be installed `sudo apt install golang -y`

2. The **nohup** command should be available . It is by default installed as a part of the 'coreutils' package. (`sudo apt install coreutils`)

3. The GOPATH [/home/**USERNAME**/go/bin/] should be added to the $PATH environment variable

4. subfinder by projectdiscovery is to be installed (`go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest`).

5. notify by projectdiscovery is to be installed (`go install -v github.com/projectdiscovery/notify/cmd/notify@latest`).

6. -- Telegram bot made using [@botfather](https://web.telegram.org/k/#@BotFather) on telegram and it's API Key and chat IDs

   A. -- Instead of Telegram any of the providers mentioned here can be used `https://github.com/projectdiscovery/notify#provider-config` . It goes to say that the `alert_sub.sh ` and the `alertconfig.yaml ` files must be altered accordingly


## Usage

1. Clone the repository
   
   `git clone https://github.com/AlphaBlue7/Subdomain-Alert-Bot/`

2. Add the target domains in `targetdomainlist.txt`
   
   A. Alternatively to target one single domain, the `-dL` flag in line 8 can be replaced with `-d` followed by the target domain

3. Run the below to execute the script and have it run in the background

   `$ nohup ./alert_sub.sh > output.log 2>&1 &`



## Algorithm
1. The list of already identified subdomains are to pasted in `subop.txt`.

2. sort is used to alphabatically arrange the list of subdomains in `subop.txt` to facilitate comparison

3. subfinder is used to generate a list of subdomains of the target domain and are saved in `subop1.txt` once sorted alphabetically.

4. diff is used in tandum with grep and sed to identify the differences and the output is saved to `newsubdomains.txt`

5. The notify tool is integrated with telegram in my interpretation.

6. Making use of the above integration the bot sends the user a notification alerting the user of the new domains identified

7. The first 5 lines of `config.yaml` is used to create `temp.txt` which then replaces `config.yaml` thereby reverting the changes. This enables the configuration file to be used for further iterations.

8. Contents of `newsubdomains.txt` is appended to `subop.txt` and then further sorted to facilitate comparison

9. The `runcount.txt` is used to keep track of the number of iterations

10. The script is ran along with the `nohup` command as the prefix. I noticed that as an SSH session is closed the script no longer runs in the background despite having used `&`. The nohup command which is short for 'no hang up' prevents the processes from receving the signal to hang up.

11. The entirety of the nohup output (including the std error) is redirected to output.log 

12. The script runs at an interval of 60 minutes



## Appendix    

To stop the script you can kill the process belonging to the script and the sleep command.
The targetdomainlist.txt file can be updated during the interval to add new target domains.
The identified domains can be removed from the telegram notification by removing {{data}} from line 13 of the alert_sub.sh
The interval at which the script is run can be modified by modifying the number of seconds mentioned in line 22 of the alert_sub.sh


## Contact
You can reach out to me on my Linkedin: https://www.linkedin.com/in/arjun-sankar-m/
