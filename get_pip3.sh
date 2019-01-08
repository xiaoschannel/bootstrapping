# installing python packages
cd $HOME/local/src
rm -f get-pip.*
wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py
$HOME/local/bin/python3 get-pip.py
rm -f get-pip.*
$HOME/local/bin/python3 -m pip install pip
$HOME/local/bin/python3 -m pip install pip-review
$HOME/local/bin/python3 -m pip install Cython
$HOME/local/bin/python3 -m pip install Pillow
$HOME/local/bin/python3 -m pip install numpy
$HOME/local/bin/python3 -m pip install scipy
$HOME/local/bin/python3 -m pip install matplotlib
$HOME/local/bin/python3 -m pip install ipdb
$HOME/local/bin/python3 -m pip install protobuf
$HOME/local/bin/pip-review --auto
