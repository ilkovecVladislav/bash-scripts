#!/bin/bash

if (( $(echo "$1 >= 0" | bc -l) )); then
    echo "Число $1 положительное (или ноль)"
else
    echo "Число $1 отрицательное"
fi