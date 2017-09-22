#!/bin/bash

# creates ~/local folder and add it to bashrc
cd ~
mkdir local
mkdir local/src
mkdir local/tmp
mkdir bin
echo "export PATH=\"$HOME/local/bin:$HOME/bin:\$PATH\"" >> .bashrc
echo "export LD_LIBRARY_PATH=\"$HOME/local/lib:$HOME/local/lib64:\$LD_LIBRARY_PATH\"" >> .bashrc
source .bashrc

