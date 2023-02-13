#!/bin/bash

challenge=$(echo -n "$1" | base64 -d | xxd | head -n1 | cut -d " " -f2-5 | sed 's/ //g')
ct2=$(echo -n "$1" | base64 -d | xxd | tail -n1 | cut -d " " -f2-5 | sed 's/ //g')
pt3=$(echo -n "$1" | base64 -d | xxd | tail -n1 |cut -d " " -f6-7 | sed 's/ //g')
ct1=$(echo -n "$1" | base64 -d | xxd | head -n 1 | cut -d " " -f6-9 | sed 's/ //g')
echo $ct1:$challenge > hashes.txt
echo $ct2:$challenge >> hashes.txt
echo $pt3 > pt3.txt
