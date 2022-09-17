#!/bin/bash

# Usage : ./generate_log.sh -l Testlogname -n 2
# Usage - for : for i in {01..100} ; do ./generate_log.sh -l App20220828_$i -n 10 ; done

while getopts l:n: flag
do
    case "${flag}" in
        l) log_name=${OPTARG};;
        n) log_records=${OPTARG};;
    esac
done

curr_date=$(date "+%Y%m%d-%H%M")
log_path="../logs/"
log_output=$log_path$log_name\_$curr_date.log

for (( i=1; i<=$log_records; i++ ))
do
	log_date=$(date "+%Y-%m-%d %H:%M:%S")
	log_ip=$(printf "%d.%d.%d.%d\n" "$((RANDOM % 256))" "$((RANDOM % 256))" "$((RANDOM % 256))" "$((RANDOM % 256))")
	log_message=$(openssl rand -base64 24)
	echo "Writing record num: $i of $logrecords ."
	echo "[ $log_date ] -- Logname: $log_name -- IP: $log_ip -- Message: $log_message" >> $log_output 
#	sleep 0.2
done

