#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Please send one non negative number"
    exit 1
fi

if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Please send one non negative number"
    exit 1
fi

number=$1

# Проверка четности с помощью оператора модуля
if [ $((number % 2)) -eq 0 ]; then
    echo "Number $number is even"
else
    echo "Number $number is odd"
fi