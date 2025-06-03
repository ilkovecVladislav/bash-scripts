#!/bin/bash

# Проверка на наличие хотя бы одного аргумента
if [ "$#" -lt 1 ]; then
  echo "Использование: $0 /путь/к/каталогу1 [/путь/к/каталогу2 ...]"
  exit 1
fi

# Массив директорий для резервного копирования
backup_dirs=("$@")

# Настройки резервного копирования
read -p "Введите каталог назначения на сервере (например, /backups): " dest_dir
read -p "Введите имя или IP-адрес сервера назначения: " dest_server

# Время резервного копирования (в формате YYYY-MM-DD_HH-MM-SS)
backup_time=$(date +%F_%H-%M-%S)

# Перебор всех директорий
for dir in "${backup_dirs[@]}"; do
  if [ -d "$dir" ]; then
    # Извлекаем имя директории (без пути)
    dir_name=$(basename "$dir")
    
    # Имя архива
    archive_name="${dir_name}_${backup_time}.tar.gz"
    archive_path="/tmp/$archive_name"

    echo "Создание архива $archive_path..."
    tar -czf "$archive_path" "$dir"

    echo "Передача архива на $dest_server:$dest_dir..."
    scp "$archive_path" "$dest_server:$dest_dir"

    echo "Удаление временного архива..."
    rm -f "$archive_path"

    echo "Резервное копирование $dir завершено."
  else
    echo "Каталог $dir не существует. Пропуск..."
  fi
done
