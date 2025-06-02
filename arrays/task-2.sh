#!/bin/bash

days=("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday")

while true; do
    read -p "Введите номер дня недели (1-7), или 'q' для выхода: " input
    
    # Проверяем, хочет ли пользователь выйти
    if [[ "$input" == "q" ]]; then
        echo "Выход из программы"
        exit 0
    fi
    
    # Проверяем корректность ввода
    if ! [[ "$input" =~ ^[1-7]$ ]]; then
        echo "Ошибка: введите число от 1 до 7 или 'q' для выхода" >&2
        continue
    fi
    
    # Получаем и выводим день недели
    index=$((input - 1))
    echo "День недели: ${days[$index]}"
done