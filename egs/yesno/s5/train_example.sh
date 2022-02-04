#!/usr/bin/env bash
feat_dir=mfcc_example

# Feature Extraction
#script options data_dir log_dir mfcc_dir 
for  x in train_yesno test_yesno; do
	steps/make_mfcc.sh --nj 12 data/$x ./logs_mfcc/$x $featdir
done
