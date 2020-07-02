#!/bin/bash
batinf='acpi -b'
perc=$(acpi -b | sed 's/Not /Not/g' | awk '{print $4;}' | sed 's/%//g' | sed 's/,//g' | head -n1)
charging=$(acpi -b | head -n1 | grep -c Discharging)
if [ ! $charging -eq 1 ]
then echo "CHR $perc%"
elif [ $perc -gt 75 ]
then echo "HIGH $perc%"
elif [ $perc -gt 50 ]
then echo "MED $perc%"
elif [ $perc -gt 25 ]
then echo "LOW $perc%"
elif  [ $perc -gt 10 ]
then echo "WARN $perc%"
else
echo "CRIT $perc%"
fi

case $BLOCK_BUTTON in
	3) mate-power-statistics ;;
esac
