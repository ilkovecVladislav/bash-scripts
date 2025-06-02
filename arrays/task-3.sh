#!/bin/bash

week=("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday")

if [ ${#week[@]} -eq 7 ]; then
    echo "В неделе стандартные ${#week[@]} дней"
else
    echo "Нестандартное количество дней: ${#week[@]}"
fi