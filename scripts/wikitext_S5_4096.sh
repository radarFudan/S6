#!/bin/bash

data_dir="$(cat .env)"
XLA_PYTHON_CLIENT_PREALLOCATE=.99 DATA_DIR=./logs/ python train.py -o Hyena-S5-4096 -c configs/hyena_S5/wikitext_S5_4096.yaml -d data_dir
