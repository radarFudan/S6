pip3 install --upgrade pip

pip3 install -r ./wsd/S5/requirements.txt --upgrade

pip3 install -r ./wsd/S5/requirements_S5.txt --upgrade

pip3 install --upgrade "jax[cuda12_local]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

pip3 install nvidia-cudnn-cu12==8.9.2.26 wandb tensorflow==2.12.0 datasets

cd wsd/S6 && wandb offline && bash scripts/wikitext_S5_8192.sh