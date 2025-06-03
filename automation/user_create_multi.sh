#!/bin/bash

# Проверка на наличие файла servers.txt
if [[ ! -f servers.txt ]]; then
  echo "Файл servers.txt не найден!"
  exit 1
fi

# Запрос имени пользователя и UID
read -p "Введите имя пользователя: " USERNAME
read -p "Введите UID: " USERID

# Цикл по серверам
while IFS= read -r SERVER; do
  echo "Подключение к $SERVER..."

  ssh "$SERVER" bash -c "'
    # Проверка существования пользователя
    if id \"$USERNAME\" &>/dev/null; then
      echo \"Пользователь $USERNAME уже существует на $SERVER\"
    else
      sudo useradd -u $USERID -m $USERNAME && echo \"Пользователь $USERNAME добавлен на $SERVER\"
    fi
  '"
done < servers.txt
