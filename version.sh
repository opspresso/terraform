#!/bin/bash

USERNAME=${1}
REPONAME=${2}
GITHUB_TOKEN=${3}

NOW=$(cat ./VERSION)
NEW=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d'"' -f4 | cut -c 2-)

echo "USERNAME: ${USERNAME}"
echo "REPONAME: ${REPONAME}"
echo "NOW: ${NOW}"
echo "NEW: ${NEW}"

if [ "${NOW}" != "${NEW}" ]; then
    printf "${NEW}" > ./VERSION

    git config credential.helper 'cache --timeout=120'
    git config --global user.name "bot"
    git config --global user.email "ops@nalbam.com"
    git add --all
    git commit -m "${NEW}"
    git push -q https://${GITHUB_TOKEN}@github.com/${USERNAME}/${REPONAME}.git master
fi
