#!/bin/bash
# Файл, в который будем сохранять результаты мониторинга
FILE_NAME=system_monitoring.txt

# ps -uax --no-headers - получаем мониторинг процессов, без заголовков
# sort -k3 -nr - сортируем спискок по 3 колонке (%CPU) по убыванию
# awk - добавляем название колонок, получаем только колонки 1 2 3 4 11
# head -n 100 - оставляем первые 100 записей
# column -t - выравниваем колонки
# > $FILE_NAME - сохраняем результат в файл (перезаписываем)
ps -uax --no-headers | sort -k3 -nr | awk 'BEGIN {print "USER\tPID\t%CPU\t%MEM\tCOMMAND"} {print $1"\t"$2"\t"$3"\t"$4"\t"$11}' | head -n 100 | column -t > $FILE_NAME

echo "Мониторинг записан в файл $PWD/$FILE_NAME"