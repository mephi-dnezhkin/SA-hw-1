#!/bin/bash
# Добавляем заголовки в файл $FILE_NAME
FILE_NAME=disk_space_usage.txt

# Добавляем заголовки в файл $FILE_NAME
echo "N  Файл.система   Размер Использовано  Дост Использовано% Cмонтировано в" > $FILE_NAME

# Командой df -h получаем инф об использовании hdd
# командой tail удаляем заголовки,
# сортируем результат по Использовано% по убыванию и записываем результат в файл $FILE_NAME
# С помощью команды awk добавялем нумерацию строк
df -h | tail -n +2 | sort -k 5 -r | awk '{print NR ": " $0}' >> $FILE_NAME
echo "Мониторинг записан в файл $PWD/$FILE_NAME"