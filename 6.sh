#!/bin/bash
z=$IFS
IFS=$'\n'

echo "Skript vypíše login uživatele, podle čísla řádku v souboru /etc/passwd"
read -r -p "Zadej číslo řádku: " cislo_radku

max_radky=$(cat /etc/passwd | wc -l)
if [ $cislo_radku -gt $max_radky ]
then
    echo "Takový řádek neexistuje"
    exit 1
else
    echo "Uživatel je: "
    echo $(cat /etc/passwd | head -n$cislo_radku | tail -n1 | cut -d":" -f1)
fi

IFS=$z