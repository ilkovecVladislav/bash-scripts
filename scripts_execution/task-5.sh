#!/bin/bash

# Рекурсивная функция для вычисления n-го числа Фибоначчи
fibonacci() {
    local n=$1
    if [ "$n" -eq 0 ]; then
        echo 0
    elif [ "$n" -eq 1 ]; then
        echo 1
    else
        echo $(( $(fibonacci $((n-1))) + $(fibonacci $((n-2))) ))
    fi
}

# Функция для вывода всей последовательности
print_sequence() {
    local count=$1
    echo -n "Ряд Фибоначчи из $count членов: "
    for (( i=0; i<count; i++ )); do
        if [ "$i" -ne 0 ]; then
            echo -n ", "
        fi
        echo -n "$(fibonacci $i)"
    done
    echo ""
}

# Основная часть скрипта
read -p "Введите количество членов ряда Фибоначчи (больше 2): " count

if [[ "$count" =~ ^[0-9]+$ ]] && [ "$count" -gt 2 ]; then
    print_sequence "$count"
else
    echo "Ошибка: введите целое число больше 2."
    exit 1
fi