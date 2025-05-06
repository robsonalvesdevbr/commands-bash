#!/bin/bash


if [[ $# -eq 0 ]]; then
  #echo "Uso: $0 $@ ...]"
  #exit 1
  diretorio_corrente=$(echo $(pwd) | sed 's|/$||')/*/
else
  diretorio_corrente=$(echo "$1" | sed 's|/$||')
fi

for nome in $diretorio_corrente; do
  if [[ -d "$nome/.git" ]]; then
    cd "$nome" || exit
    #git status | grep -q "working tree clean"
    #if [[ $? -eq 0 ]]; then
    echo -e "\e[01;33mVerificando $nome.\e[00m"
    if git status | grep -q "working tree clean"; then
      git pull
      if git pull | grep -q  "Already up to date."; then
          echo -e "\e[00;32mO comando 'git pull' teve sucesso em $nome.\e[00m\n\n"
      else
          echo -e "\e[00;32mO comando 'git pull' teve sucesso em $nome, mas não está atualizado.\e[00m\n\n"
      fi
    else
      echo -e "\e[00;31mO comando 'git status' falhou em $nome. Nenhuma ação adicional será tomada.\e[00m\n\n"
    fi
    cd - > /dev/null 2>&1 || exit
  fi
done