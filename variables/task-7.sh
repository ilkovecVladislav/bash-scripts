#!/bin/bash

echo "$0"

echo "$3 $2 $1"

echo "Привет, какой сегодня день недели?"
read day
echo "Уже $day"
echo "Какое сегодня число?"
read number
echo "Не думал что $day будет $number числа"


echo "Я считаю что сегодня $(date)"