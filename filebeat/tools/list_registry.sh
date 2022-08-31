#!/bin/bash
cat ../data/registry/filebeat/log.json | grep FileStat | awk -F """inode""" '{print $2}' | cut -d ',' -f1 | grep -o -E '[0-9]+' | sort | uniq | wc -l
