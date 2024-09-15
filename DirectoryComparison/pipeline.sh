#!/bin/bash
resultFile=directory_comparison.txt
dir1="./dir1"
dir2="./dir2"


if ! [ -d $dir1 ]; then
echo "Не найдена директория $dir1, завершаем работу"
exit 0
fi

if ! [ -d $dir2 ]; then
echo "Не найдена директория $dir2, завершаем работу"
exit 0
fi

# Ищем все файлы в dir1, сортируем файлы по имени и записываем в $resultFile
echo "Cписок файлов в директории $dir1:" > $resultFile
find $dir1 -type f | sort >> $resultFile
echo "" >> $resultFile
echo "" >> $resultFile

# Ищем все файлы в dir2, сортируем файлы по имени и записываем в $resultFile
echo "Cписок файлов в директории $dir2:" >> $resultFile
find $dir2 -type f | sort >> $resultFile
echo "" >> $resultFile
echo "" >> $resultFile

echo "Сравнение директорий:" >> $resultFile
diff $dir1 $dir2 >> $resultFile

echo "Сравнение директорий записано в файл $PWD/$RESULT_FILE"