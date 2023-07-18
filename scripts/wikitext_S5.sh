#!/bin/bash

data_dir="$(cat .env)"
DATA_DIR=./logs/ python train.py -o Hyena-S5-20 -c configs/hyena_S5/wikitext_S5.yaml -d data_dir

# Params
# (50257*768+12*(768*64*64+768*768*4*2))/1024/1024=126.80932617, number of params
# (50257*768+12*(768*65*65+(768+1)*(768*4+1)*2))/1024/1024=128.03102875, number of params considering bias
# ├── embeddings
# │   └── word_embeddings
# │       └── embedding: 38597376
# │
# ├── layers_0
# │   ├── mixer_cls
# │   │   ├── filter_fn_0
# │   │   │   ├── B: 196608
# │   │   │   ├── C: 196608
# │   │   │   ├── D: 768
# │   │   │   ├── Lambda_im: 128
# │   │   │   ├── Lambda_re: 128
# │   │   │   └── log_step: 128
# │   │   ├── in_proj
# │   │   │   ├── bias: 2304
# │   │   │   └── kernel: 1769472
# │   │   ├── out_proj
# │   │   │   ├── bias: 768
# │   │   │   └── kernel: 589824
# │   │   └── short_filter
# │   │       ├── bias: 2304
# │   │       └── kernel: 6912
# │   ├── mlp
# │   │   ├── fc1
# │   │   │   ├── bias: 3072
# │   │   │   └── kernel: 2359296
# │   │   └── fc2
# │   │       ├── bias: 768
# │   │       └── kernel: 2359296
# │   ├── norm1
# │   │   ├── bias: 768
# │   │   └── scale: 768
# │   └── norm2
# │       ├── bias: 768
# │       └── scale: 768

# model parameter count: 128496384


# Space occupation batchsize 16, base 1, in 3, conv 3, drop 3, S5 3*2, B*T 2, MLP 1+4, pre-act 1 ,float 32 bytes
# 16*(1024*50257*2+12*1024*768*(1+3+3+3*2+2+1+4+1))/1024/1024/1024 * 4 = 17.9473877
