#!/bin/bash

# Объявляем массив с днями недели
days=("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday")

# Выводим заголовок
echo "Дни недели на английском:"

# Вариант 1: Вывод через цикл for
for day in "${days[@]}"; do
  echo "- $day"
done


exit 0