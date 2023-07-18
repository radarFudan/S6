#!/bin/bash

data_dir="$(cat .env)"
XLA_PYTHON_CLIENT_PREALLOCATE=false DATA_DIR=./logs/ python train.py -o Hyena-S6 -c configs/hyena_S5/wikitext_S6.yaml -d data_dir
