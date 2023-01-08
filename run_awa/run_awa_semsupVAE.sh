#!/bin/bash

SEED=0
RUN_SCRIPT="../run_vae.py"
CONFIG_FOLDER="./awa_configs"

commands=(
    "python $RUN_SCRIPT --config $CONFIG_FOLDER/awa_vae_scen2.yaml" --c_load_latent "latent_data0" --trainer.max_epochs $0 
    "python $RUN_SCRIPT --config $CONFIG_FOLDER/awa_vae_scen2.yaml" --c_load_latent "latent_data1" --trainer.max_epochs $1
    "python $RUN_SCRIPT --config $CONFIG_FOLDER/awa_vae_scen2.yaml" --c_load_latent "latent_data5" --trainer.max_epochs $5 
)
ARGS="--train --default_config $CONFIG_FOLDER/awa_default.yaml --seed $SEED --name_suffix s$SEED --ModelCls ResNetSemSupVae"

for CMD in "${commands[@]}"; do
    $CMD $ARGS $@
    if [ "$?" -ne "0" ]; then
    exit 1
    fi
done