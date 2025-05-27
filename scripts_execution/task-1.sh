#!/bin/bash

# Функция для проверки, является ли число положительным
check_positive() {
    local num=$1

    if [ "$num" -gt 0 ]; then
        echo "Число $num является положительным."
    elif [ "$num" -eq 0 ]; then
        echo "Число $num равно нулю."
    else
        echo "Число $num является отрицательным."
    fi
}

# Получаем число от пользователя
read -p "Введите число: " number

# Проверяем, что введено число (целое)
if [[ "$number" =~ ^-?[0-9]+$ ]]; then
    check_positive "$number"
else
    echo "Ошибка: введено не число."
    exit 1
fi