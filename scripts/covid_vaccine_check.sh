#!/bin/bash

# USAGE EXAMPLE: ./covid_vaccine_check.sh  https://holyname.org/covid19/ "Holy Name is not scheduling appointments" 0
# 
# This will check https://holyname.org/covid19/ to see if the phase "Holy Name is not scheduling appointments" appears
# on the site. The third argument, 0, means we only send an alert if the phase does NOT appear in the site.
#
# Argument 1 - the URL to scrape
# Argument 2 - The phrase to match
# Argument 3 - 0 if we should alert on the absense of the phrase and 1 if we should alert on the presence of the phrase
#

#
#       Dont forget to put your EMAIL address below where it says <YOUR-EMAIL-ADDRESS>... yes i know this could easily be an argument
#       this was a quick thing. :)
#
# This script makes use of SSMTP, a simple command line SMTP client that works with GMAL and other SMTP servers.
# On Ubuntu you can simply `sudo apt-get install ssmtp` and then edit the config file at /etc/ssmtp/ssmtp.conf to something
# like the below (without the leading #s):
#
#        UseSTARTTLS=YES
#        root=<your-email-address>
#        mailhub=smtp.gmail.com:587 (or 465...i couldnt make 587 work. you may also need to enable insecure apps in your gmail account)
#        AuthUser=<your-account's-user-name>
#        AuthPass=<your-account's-password>
#
#       Having password in plain text in a config is not a great idea. I recommend using a throw-away gmail account for this 
#       since making this more secure isn't worth the effort right now.

SITE=$1
FIND=$2
REQ=$3

date
echo "site: $SITE"
echo "find: $FIND"
echo "require_match: $REQ"

SITE_1=`wget -O - -o /dev/null $SITE | grep "$FIND"`
if [ ${#SITE_1} -lt 2 ]
then
        if [ $REQ -eq 0 ]
                then
                echo "$SITE - matches!"
                echo "Subject: COVID VACCINE ALERT\n\nBODY TEXT" | ssmtp <YOUR-EMAIL-HERE>
        else
                echo "$SITE does not match"
        fi
else
        if [ $REQ -eq 1 ]
        then
                echo "$SITE - matches!"
                echo "Subject: COVID VACCINE ALERT - $SITE" | ssmtp <YOUR-EMAIL-HERE>
        else
                echo "$SITE does not match"
        fi
fi