#!/bin/bash

#
# This script just organizes the multiple, unrelated (yes UNRELATED), sites that you'll need
# to monitor for available appointments. Fun, right? I recommend setting this to run on a cron every hour.
# Don't be a jerk and run the cron every minute or constantly... these sites don't update often and they
# are already under high load from people trying to get appointments. Be a good human.
#

./covid_vaccine_check.sh  https://holyname.org/covid19/ "Holy Name is not scheduling appointments" 0

./covid_vaccine_check.sh  https://forms.office.com/Pages/ResponsePage.aspx?id=q4CBOFSSZEKKw8PWprW070Kw6WRg5E9GtSJTJqhYu11UQ1pSNVBTS1pGSzY5SUpXMDNVWURLWUxWVi4u "Please note that we have scheduled all available appointments" 0

./covid_vaccine_check.sh https://www.hackensackmeridianhealth.org/covid19/ "All appointments currently are full." 0