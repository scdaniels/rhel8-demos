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

pe "yum module list"

pe "yum module install -y container-tools"

pe "cat /etc/containers/registries.conf"

pe "podman login registry.redhat.io"

pe "podman search nextcloud"

pe "skopeo inspect docker://docker.io/library/nextcloud"

pe "podman pull docker://docker.io/library/nextcloud"

pe "podman run -d -p 8080:80 nextcloud"

p "echo 'Navigate to http://rhel8-containertools:8080/'"

pe "podman ps"

pe "podman images"

pe "cd container-src"

pe "podman pull docker://registry.redhat.io/rhel"

pe "ls -la"

pe "cat Dockerfile"

pe "cat helloworld"

pe "./helloworld"

pe "buildah bud -t helloworld ."

pe "podman images"

pe "podman run helloworld"

pe "podman run -it helloworld /bin/bash"

pe "rpm -qa | wc -l"

p ""