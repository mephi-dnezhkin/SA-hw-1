#!/bin/bash

# Директория с лог-файлами
logDir="./logs"

# Ключевое слово, по которому фильтруем
keyword="ERROR"

# Получаем текущую дату в формате DD-MM-YYYY_HH-MM
currentDate=$(date +"%d-%m-%Y_%H-%M")

# Указываем имя архива
archiveName="logs_$currentDate.tar.gz"

tmpFile=$(mktemp)

# grep - находим стороки по ключевому слову в указанной директории, по указанному расширению
# awk - оставляем только первый столбец
# sort - сортируем вывод
grep -H "$keyword" "$logDir"/*.log | awk '{print $0}' | sort > tmpFile

# Создаем архив
tar -czf "$archiveName"  tmpFile

# Удаляем временный файл
rm tmpFile