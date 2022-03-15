#!/usr/bin/env bash

awk '!a[$1]++' $1>$2
