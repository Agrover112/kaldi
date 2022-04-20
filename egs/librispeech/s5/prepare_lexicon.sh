#!/usr/bin/env bash
# Author: Ankit Grover @agrover112
# 2022

# Prepares the dictionary and auto-generates the pronunciations for the words,
# that are in our vocabulary passed as an argument.
. ./cmd.sh
. ./path.sh

stage=$1  
nj=$2 
our_words=$3



#if [ $# -ne 3 ]; then
#  echo "Usage: $0 [options] <stage> <nj> <words>"
#  echo "e.g.:  prepare_lexicon.sh   1 4 data/local/librispeech-vocab.txt"
#  echo "  --nj <nj>            # number of jobs to run, default: 4."
#  exit 1
#fi


[ "${our_words: -4}" == ".txt" ] ||  { echo "Expected type: .txt got type: ${our_words: -3}" && exit 1 ;}

grep -o -E "\w+||\w+'\w+"  $our_words | tr a-z A-Z |  sort -u > our_vocab.txt || { echo " Failed to generate vocabulary" && exit 1; }

echo -e "\n Vocabulary generated ...."

prepare_dict_modified.sh --stage $stage --nj $nj --cmd "$train_cmd" \
data/local/lm data/local/lm data/local/dict_nosp  our_vocab.txt


