#!/bin/bash

# Проверяем, переданы ли аргументы (каталоги для бэкапа)
if [ $# -eq 0 ]; then
    echo "Использование: $0 /путь/к/директории1 /путь/к/директории2 ..."
    exit 1
fi

# Инициализируем массив с каталогами для бэкапа
backup_dirs=("$@")

# Настройки резервного копирования
dest_dir="/backups"                          # Каталог назначения на удаленном сервере
dest_server="backup-server.example.com"      # Сервер для хранения бэкапов
backup_time=$(date +"%Y%m%d_%H%M%S")         # Временная метка для имени архива
backup_user="backup-user"                    # Пользователь для подключения по SSH

# Создаем временный каталог для архивов
temp_dir="/tmp/backups_$backup_time"
mkdir -p "$temp_dir"

echo "Начало процесса резервного копирования: $(date)"
echo "Каталоги для резервирования: ${backup_dirs[*]}"

# Проходим по всем каталогам для бэкапа
for dir in "${backup_dirs[@]}"; do
    # Проверяем существование каталога
    if [ ! -d "$dir" ]; then
        echo "Ошибка: каталог $dir не существует, пропускаем"
        continue
    fi

    # Получаем базовое имя каталога
    dir_name=$(basename "$dir")
    backup_file="$temp_dir/${dir_name}_${backup_time}.tar.gz"

    echo "Архивируем $dir в $backup_file"
    
    # Создаем сжатый архив
    tar -czf "$backup_file" -C "$(dirname "$dir")" "$(basename "$dir")"
    
    if [ $? -ne 0 ]; then
        echo "Ошибка при создании архива для $dir"
        continue
    fi

    # Копируем архив на удаленный сервер
    echo "Копируем $backup_file на сервер $dest_server:$dest_dir"
    scp "$backup_file" "$backup_user@$dest_server:$dest_dir"
    
    if [ $? -ne 0 ]; then
        echo "Ошибка при копировании $backup_file на удаленный сервер"
    else
        echo "Резервная копия $dir успешно создана и отправлена"
    fi

    # Удаляем временный файл
    rm -f "$backup_file"
done

# Удаляем временный каталог
rm -rf "$temp_dir"

echo "Процесс резервного копирования завершен: $(date)"