export PATH=$HOME/local/bin:/usr/local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$HOME/local/lib64:$LD_LIBRARY_PATH

cd $HOME/local/src
# building python 3.5.4
rm ./Python-3.5*
wget https://www.python.org/ftp/python/3.5.4/Python-3.5.4.tar.xz
tar Jxvf Python-3.5.4.tar.xz
rm ./Python-3.5.4.tar.xz
cd Python-3.5.4
make clean
./configure --prefix=$HOME/local/ --enable-shared LDFLAGS=-Wl,-rpath,$HOME/local/lib
make -j
make install
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