#!/bin/bash
set -e

INSTALL_DIR="$CONDA_PREFIX/opt/hicgan"

# # One-time pip install of TF 2.15 and other Python deps
# if [ ! -f "$CONDA_PREFIX/opt/hicgan_installed.flag" ]; then
#     echo "Installing TensorFlow 2.15 and Python packages..."
#     pip install --no-cache-dir tensorflow==2.15 keras==2.15 h5py tqdm seaborn
#     # touch "$CONDA_PREFIX/opt/hicgan_installed.flag"
# fi

# check if it's already installed and skip
if python -c "import hicgan" &> /dev/null; then
    echo "Hi-cGAN is already installed, skipping installation."
else
    echo "Installing Hi-cGAN..."
    wget https://github.com/joachimwolff/Hi-cGAN/archive/refs/tags/0.1.zip
    unzip 0.1.zip
    cd Hi-cGAN-0.1
    pip install . --no-deps
    cd ..
fi

