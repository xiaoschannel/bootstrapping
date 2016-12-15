# setting path
export PATH=$HOME/local/bin:/usr/local/bin:/usr/local/cuda-8.0:/usr/local/cuda-7.5/bin:/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$HOME/local/lib64:/usr/local/lib:/usr/local/cuda-8.0:/usr/local/cuda-7.5/lib64:/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export CUDA_HOME=/usr/local/cuda-8.0:/usr/local/cuda-7.5:/usr/local/cuda:
export CUDA_ROOT=/usr/local/cuda-8.0:/usr/local/cuda-7.5/bin:/usr/local/cuda/bin:
export CUDA_INC_DIR=/usr/local/cuda-8.0:/usr/local/cuda-7.5/bin:/usr/local/cuda/bin:
# move to source directory
mkdir $HOME/local
mkdir $HOME/local/src
cd $HOME/local/src
# building python 3.5.2
rm ./Python-3.5*
wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tar.xz
tar Jxvf Python-3.5.2.tar.xz
rm ./Python-3.5.2.tar.xz
cd Python-3.5.2
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

# installing Bazel
wget https://github.com/bazelbuild/bazel/releases/download/0.4.2/bazel-0.4.2-installer-linux-x86_64.sh
chmod 755 bazel-0.4.2-installer-linux-x86_64.sh
sudo ./bazel-0.4.2-installer-linux-x86_64.sh --user --prefix=$HOME/local
source $HOME/local/lib/bazel/bin/bazel-complete.bash
# installing tensorflow
git clone --recurse-submodules https://github.com/tensorflow/tensorflow
cd tensorflow
./configure
# answer the questions
# Please specify the location of python. [Default is /home/matsubara/local/bin/python]:
# Do you wish to build TensorFlow with Google Cloud Platform support? [y/N] N
# No Google Cloud Platform support will be enabled for TensorFlow
# Do you wish to build TensorFlow with GPU support? [y/N] y
# GPU support will be enabled for TensorFlow
# Please specify which gcc nvcc should use as the host compiler. [Default is /usr/bin/gcc]: 
# Please specify the Cuda SDK version you want to use, e.g. 7.0. [Leave empty to use system default]: 8.0
# Please specify the location where CUDA  toolkit is installed. Refer to README.md for more details. [Default is /usr/local/cuda]:
# Please specify the Cudnn version you want to use. [Leave empty to use system default]:
# Please specify the location where cuDNN  library is installed. Refer to README.md for more details. [Default is /usr/local/cuda]:
# Please specify a list of comma-separated Cuda compute capabilities you want to build with.
# You can find the compute capability of your device at: https://developer.nvidia.com/cuda-gpus.
# Please note that each additional compute capability significantly increases your build time and binary size.
# [Default is: "3.5,5.2"]:
bazel build -c opt --config=cuda --verbose_failures //tensorflow/tools/pip_package:build_pip_package
rm /tmp/tensorflow_pkg/*.whl
# remove old ones(if any)
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
pip3 install /tmp/tensorflow_pkg/*.whl
cd ~
