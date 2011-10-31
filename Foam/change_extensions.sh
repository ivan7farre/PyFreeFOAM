#!/bin/bash
echo -e "Introduce la palabra que quieres modificar: \c"
read modificar
echo -e "Introduce la palabra que la sustituira: \c"
read modificada
find /media/foo/pythonFlu/Foam -type f | xargs grep $modificar > lista.txt
cat lista.txt | cut -d ":" -f 1 > lista2.txt

perl -p -i -e "s/$modificar/$modificada/g" `cat lista2.txt`

rm lista.txt ; rm lista2.txt
