#!/bin/bash

for nome in */; do
  if [[ -d "$nome" ]]; then
    cd "$nome" || exit
    git status | grep -q "working tree clean"
    if [[ $? -eq 0 ]]; then
      echo -e "\e[00;32mO comando 'algum_comando' teve sucesso em $nome. O status do Git é:\e[00m"
      git pull
    else
      echo -e "\e[00;31mO comando 'algum_comando' falhou em $nome. Nenhuma ação adicional será tomada.\e[00m"
    fi
    cd - > /dev/null 2>&1 || exit
  fi
done