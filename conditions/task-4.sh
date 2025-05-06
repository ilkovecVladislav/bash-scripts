#!/bin/bash

base="$1"
height="$2"

# Вычисление площади: (1/2) * основание * высота
area=$(echo "scale=2; 0.5 * $base * $height" | bc)

# Вывод результата
echo "Площадь треугольника с основанием $base и высотой $height: $area"