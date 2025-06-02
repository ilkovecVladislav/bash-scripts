#!/bin/bash

# Исходный массив дней недели
days=("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday")

echo "Исходный порядок дней:"
echo "${days[@]}"

# Меняем местами Wednesday (индекс 2) и Friday (индекс 4)
temp="${days[2]}"
days[2]="${days[4]}"
days[4]="$temp"

echo -e "\nПосле замены Wednesday и Friday:"
echo "${days[@]}"

exit 0