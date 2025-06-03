#!/bin/bash

# Массив файловых систем для мониторинга (правильный синтаксис без запятых)
filesystems=("/" "/home" "/var")

# Файл для оповещений
alert_file="/alert.txt"

# Очищаем файл оповещений
> "$alert_file"

echo "Начало проверки дискового пространства: $(date)"

# Цикл проверки каждой файловой системы
for fs in "${filesystems[@]}"; do
    # Проверяем существование точки монтирования
    if [ ! -d "$fs" ]; then
        echo "Предупреждение: файловая система '$fs' не существует или не смонтирована" >> "$alert_file"
        continue
    fi

    # Получаем процент использования с обработкой ошибок
    usage_info=$(df -h "$fs" 2>/dev/null | tail -1)
    
    if [ -z "$usage_info" ]; then
        echo "Ошибка: не удалось получить данные для файловой системы '$fs'" >> "$alert_file"
        continue
    fi

    # Извлекаем процент использования
    usage=$(echo "$usage_info" | awk '{print $5}' | tr -d '%')

    # Проверяем, является ли usage числом
    if ! [[ "$usage" =~ ^[0-9]+$ ]]; then
        echo "Ошибка: неверный формат данных использования для '$fs'" >> "$alert_file"
        continue
    fi

    echo "Файловая система '$fs' использует $usage% пространства"

    # Проверка превышения порога
    if [ "$usage" -ge 90 ]; then
        alert_msg="⚠️ Внимание: файловая система '$fs' использует ${usage}% дискового пространства!"
        echo "$alert_msg" >> "$alert_file"
        echo "$alert_msg"
    fi
done

# Проверяем, были ли предупреждения
if [ -s "$alert_file" ]; then
    echo -e "\nСоздан файл предупреждений: $alert_file"
    echo "Содержимое:"
    cat "$alert_file"
else
    echo -e "\nВсе файловые системы в норме (использование < 90%)"
    rm -f "$alert_file"
fi