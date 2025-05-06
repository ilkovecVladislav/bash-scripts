#!/bin/bash

length=$1
width=$2

# Вычисляем площадь и периметр
area=$((length * width))
perimeter=$((2 * (length + width)))

# Выводим результат
echo "Прямоугольник с длиной $length и шириной $width:"
echo "Площадь = $area"
echo "Периметр = $perimeter"