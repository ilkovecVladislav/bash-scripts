#!/bin/bash

# Функция для вывода таблицы умножения
print_multiplication_table() {
    local num=$1
    echo "Таблица умножения для числа $num:"
    
    for (( i=1; i<=10; i++ )); do
        echo "$num * $i = $((num * i))"
    done
}

# Получаем число от пользователя
read -p "Введите число для таблицы умножения: " number

# Проверяем, что введено число (целое)
if [[ "$number" =~ ^-?[0-9]+$ ]]; then
    print_multiplication_table "$number"
else
    echo "Ошибка: введено не число."
    exit 1
fi