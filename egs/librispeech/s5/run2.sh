#!/usr/bin/env bash

# Set this to somewhere where you want to put your data, or where
# someone else has already put it.  You'll want to change this
# if you're not on the CLSP grid.
data=./data

# base url for downloads.
data_url=www.openslr.org/resources/12
lm_url=www.openslr.org/resources/11
mfccdir=mfcc
stage=1

. ./cmd.sh
. ./path.sh
. parse_options.sh

# you might not want to do this for interactive shells.
set -e

# download the LM resources
local/download_lm.sh $lm_url data/local/lm

local/prepare_dict.sh --stage 1 --nj 12 --cmd "$train_cmd" \
   data/local/lm data/local/lm data/local/dict_nosp

