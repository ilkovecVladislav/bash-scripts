#!/bin/bash

# Функция для проверки простого числа
is_prime() {
    local num=$1

    # 1 и меньше - не простые
    if [ "$num" -le 1 ]; then
        return 1  # не простое
    fi

    # 2 и 3 - простые
    if [ "$num" -le 3 ]; then
        return 0  # простое
    fi

    # Чётные числа и кратные 3 - не простые
    if [ $((num % 2)) -eq 0 ] || [ $((num % 3)) -eq 0 ]; then
        return 1  # не простое
    fi

    # Проверка делителей до √num (оптимизация)
    local i=5
    local w=2
    while [ $((i * i)) -le "$num" ]; do
        if [ $((num % i)) -eq 0 ]; then
            return 1  # не простое
        fi
        i=$((i + w))
        w=$((6 - w))  # чередуем шаги 2 и 4 (6-2=4, 6-4=2)
    done

    return 0  # простое
}

# Получаем число от пользователя
read -p "Введите число для проверки: " number

# Проверяем, что введено число (целое положительное)
if [[ "$number" =~ ^[0-9]+$ ]]; then
    if is_prime "$number"; then
        echo "$number — простое число."
    else
        echo "$number — НЕ простое число."
    fi
else
    echo "Ошибка: введено не положительное целое число."
    exit 1
fi