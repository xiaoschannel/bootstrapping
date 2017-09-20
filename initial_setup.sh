#!/bin/bash

# creates ~/local folder and add it to bashrc
cd ~
mkdir local
mkdir local/src
mkdir local/tmp
mkdir bin
echo "export PATH=\"$HOME/local/bin:$HOME/bin:$PATH\"" >> .bash_profile
echo "export LD_LIBRARY_PATH=\"$HOME/local/lib:$HOME/local/lib64:$LD_LIBRARY_PATH\"" >> .bash_profile
source .bash_profile

