#!/bin/bash

# creates ~/local folder and add it to bashrc
cd ~
mkdir local
mkdir local/src
cat "export PATH=$HOME/local/bin:$PATH" >> .bash_profile
source ~/.bash_profile

