#!/usr/bin/env bash

#Author: Ankit Grover 2022
awk '!a[$1]++' $1>$2
