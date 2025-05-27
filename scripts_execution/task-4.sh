#!/bin/bash

# Функция для вывода ряда Фибоначчи
print_fibonacci_sequence() {
    local n=$1
    local a=0
    local b=1
    local next

    echo "Ряд Фибоначчи из $n членов:"
    
    # Выводим первые два члена
    echo -n "$a, $b"

    # Генерируем остальные члены
    for (( i=2; i<n; i++ )); do
        next=$((a + b))
        echo -n ", $next"
        a=$b
        b=$next
    done
    echo ""  # Переход на новую строку
}

# Получаем число от пользователя
read -p "Введите количество членов ряда Фибоначчи (больше 2): " count

# Проверяем ввод
if [[ "$count" =~ ^[0-9]+$ ]] && [ "$count" -gt 2 ]; then
    print_fibonacci_sequence "$count"
else
    echo "Ошибка: введите целое число больше 2."
    exit 1
fi