cd $HOME/local/src
# building python 3.5.6
rm ./Python-3.5*
wget https://www.python.org/ftp/python/3.5.6/Python-3.5.6.tar.xz
tar Jxvf Python-3.5.6.tar.xz
rm ./Python-3.5.6.tar.xz
cd Python-3.5.6
make clean
./configure --prefix=$HOME/local/ --enable-shared LDFLAGS=-Wl,-rpath,$HOME/local/lib
make -j4
make install
