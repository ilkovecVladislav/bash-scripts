#!/bin/bash

read -p "Введите первое целое число: " num1

read -p "Введите второе целое число: " num2

# Проверка деления на ноль
if [ "$num2" -eq 0 ]; then
    echo "Ошибка: деление на ноль невозможно!"
    exit 1
fi

# Упорядочивание чисел (большее становится первым)
if [ "$num1" -lt "$num2" ]; then
    temp=$num1
    num1=$num2
    num2=$temp
fi

# Вычисление частного и остатка
quotient=$((num1 / num2))
remainder=$((num1 % num2))

# Вывод результата
echo "Частное от деления $num1 на $num2: $quotient"
echo "Остаток от деления $num1 на $num2: $remainder"