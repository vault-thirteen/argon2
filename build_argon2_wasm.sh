#!/bin/bash

# This script builds the 'argon2' executable file for Web Assembly (WASM) using
# a Docker container. The Docker container must be started before using this
# script. This script must be called from the "Emscripten" container.

# Exit on error.
set -e

# Apply Emscripten's paths.
echo PREPARING THE SDK ...
cd /home/emscripten/emsdk
source ./emsdk_env.sh
cmake --version
echo

# Get the source code of argon2.
echo CLONING THE SOURCE ...
cd /home/data
git clone https://github.com/vault-thirteen/argon2.git
cd argon2
ls
echo

# Build the WASM binary executable file.
echo BUILDING ...
chmod +x build_wasm.sh
echo $PATH
./build_wasm.sh
echo

# Clean the mess.
# echo CLEANING ...
# rm -r argon2
#echo
