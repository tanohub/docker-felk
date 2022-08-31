#!/bin/bash

# Usage : ./generate_log.sh -l Testlogname -n 2
# Usage - for : for i in {01..100} ; do ./generate_log.sh -l App20220828_$i -n 10 ; done

while getopts l:n: flag
do
    case "${flag}" in
        l) logname=${OPTARG};;
        n) logrecords=${OPTARG};;
    esac
done

logpath="../logs/"
logoutput=$logpath$logname\_$(date "+%Y%m%d-%H%M").log

for (( i=1; i<=$logrecords; i++ ))
do
	echo "Writing record num: $i of $logrecords ."
	echo "[ $(date "+%Y-%m-%d %H:%M:%S") ] -- Logname: $logname -- Message: $(openssl rand -base64 24)" >> $logoutput 
#	sleep 0.2
done

