#!/bin/bash

# Проверяем наличие файла с серверами
if [ ! -f "servers.txt" ]; then
    echo "Файл servers.txt не найден!"
    exit 1
fi

# Запрашиваем данные пользователя
read -p "Введите имя пользователя: " username
read -p "Введите UID пользователя: " uid

# Проверяем введенные данные
if [ -z "$username" ] || [ -z "$uid" ]; then
    echo "Имя пользователя и UID не могут быть пустыми!"
    exit 1
fi

# Читаем файл с серверами и выполняем команды
while read -r server; do
    echo "Добавляем пользователя $username (UID: $uid) на сервер $server"
    
    # Команды для выполнения на удаленном сервере
    ssh "$server" "
        if id '$username' &>/dev/null; then
            echo 'Пользователь $username уже существует на $server'
        else
            sudo useradd -u '$uid' '$username' && \
            echo 'Пользователь $username успешно создан на $server' || \
            echo 'Ошибка при создании пользователя $username на $server'
        fi
    "
    
    if [ $? -ne 0 ]; then
        echo "Ошибка подключения к серверу $server или выполнения команд"
    fi
    
    echo "--------------------------------------------------"
done < servers.txt

echo "Операция завершена для всех серверов"