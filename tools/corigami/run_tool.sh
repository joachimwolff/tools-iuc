#!/bin/bash
set -e

INSTALL_DIR="$CONDA_PREFIX/opt/corigami"

# # One-time pip install of TF 2.15 and other Python deps
# if [ ! -f "$CONDA_PREFIX/opt/hicgan_installed.flag" ]; then
#     echo "Installing TensorFlow 2.15 and Python packages..."
#     pip install --no-cache-dir tensorflow==2.15 keras==2.15 h5py tqdm seaborn
#     # touch "$CONDA_PREFIX/opt/hicgan_installed.flag"
# fi

# check if it's already installed and skip
# if python -c "import corigami" &> /dev/null; then
#     echo "C.Origami is already installed, skipping installation."
# else
echo "Installing C.Origami..."
wget -e https_proxy=http://proxy.mh-hannover.de:8080 https://github.com/joachimwolff/C.Origami/archive/refs/tags/0.1.zip
unzip 0.1.zip
cd C.Origami-0.1
pip install . --no-deps
cd ..
# fi

