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

pe "composer-cli blueprints save test-blueprint2"

pe "cat test-blueprint2.toml"

pe "cat customizations.txt"

pe "cat password_hash_command.txt"

pe "cat customizations.txt >> test-blueprint2.toml"

pe "composer-cli blueprints push test-blueprint2.toml"

pe "composer-cli blueprints show test-blueprint2.toml"



p ""