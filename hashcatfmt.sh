#!/bin/bash

# This script converts the Base64 part (remove $99$) from the CloudCracker Submission string and converts it to hashcat DES crackable. (mode 14000)
# This is from an old thread I found while having my own go at cracking MS-CHAPv2 hashes from a poorly configured Wifi enterprise deployment.

# Source:   https://hashcat.net/forum/thread-5912-page-2.html
# Source 2: https://hashcat.net/forum/thread-5832.html

challenge=$(echo -n "$1" | base64 -d | xxd | head -n1 | cut -d " " -f2-5 | sed 's/ //g')
ct2=$(echo -n "$1" | base64 -d | xxd | tail -n1 | cut -d " " -f2-5 | sed 's/ //g')
pt3=$(echo -n "$1" | base64 -d | xxd | tail -n1 |cut -d " " -f6-7 | sed 's/ //g')
ct1=$(echo -n "$1" | base64 -d | xxd | head -n 1 | cut -d " " -f6-9 | sed 's/ //g')
echo $ct1:$challenge
echo $ct2:$challenge
echo $pt3
