#!/bin/bash
echo $(date '+%D') | sed 's#\(../../\)\(..\)#\1120\2 HE#g'

case $BLOCK_BUTTON in
	1) termite -e 'cal -3; sleep 5';;
esac
