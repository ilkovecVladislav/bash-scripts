#!/bin/bash
week=("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday")

if [[ ${#week[@]} -eq 7 ]]; then
    week+=("Earthsday")
    echo "Добавлен Earthsday. Теперь дней: ${#week[@]}"
else
    echo "Массив уже содержит ${#week[@]} дней"
fi