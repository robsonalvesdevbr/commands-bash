#!/bin/bash

for nome in */; do
  if [[ -d "$nome" ]]; then
    cd "$nome" || exit
    git status | grep -q "working tree clean"
    if [[ $? -eq 0 ]]; then
      echo "O comando 'algum_comando' teve sucesso em $nome. O status do Git é:"
      git pull
    else
      echo "O comando 'algum_comando' falhou em $nome. Nenhuma ação adicional será tomada."
    fi
    cd - > /dev/null 2>&1 || exit
  fi
done