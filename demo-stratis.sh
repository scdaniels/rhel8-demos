#!/usr/bin/env bash

########################
# include the magic
########################

. ../demo-magic/demo-magic.sh


########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
# TYPE_SPEED=15

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "

# hide the evidence
clear

pe "yum install -y stratisd stratis-cli"

pe "systemctl enable --now stratisd"

pe "stratis pool create stratispool /dev/sdb"

pe "stratis pool list"

pe "stratis pool add-data stratispool /dev/sdc"

pe "stratis pool list"

pe "stratis blockdev"

pe "stratis fs create stratispool fs1"

pe "stratis fs list stratispool"

pe "mkdir /stratisvol"

pe "mount /stratis/stratispool/fs1 /stratisvol"

pe "mount"

pe "touch /stratisvol/file.txt"

pe "stratis fs snapshot stratispool fs1 fs1-snap"

pe "rm -f /stratisvol/file.txt"

pe "mkdir /stratisvol-snap"

pe "mount /stratis/stratispool/fs1-snap /stratisvol-snap"

pe "ls -l /stratisvol-snap"

pe "umount /stratisvol-snap"

pe "stratis fs destroy stratispool fs1-snap"

pe "umount /stratisvol"

pe "stratis fs destroy stratispool fs1"

pe "stratis pool destroy stratispool"

pe "stratis pool list"


p ""
