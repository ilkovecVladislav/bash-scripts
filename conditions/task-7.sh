#!/bin/bash

read -p "Введите строку: " main_string

read -p "Введите подстроку для поиска: " substring

# Проверяем, содержит ли строка подстроку
if [[ "$main_string" == *"$substring"* ]]; then
    echo "Строка содержит подстроку '$substring'"
else
    echo "Строка НЕ содержит подстроку '$substring'"
fi