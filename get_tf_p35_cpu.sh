# move to source directory
cd $HOME/local/src

git clone --recurse-submodules https://github.com/tensorflow/tensorflow
cd tensorflow
./configure
# answer the questions: replace "soukun" with your username
#Please specify the location of python. [Default is /home/soukun/local/bin/python]: /home/soukun/local/bin/python3
#Do you wish to build TensorFlow with Google Cloud Platform support? [y/N] n
#No Google Cloud Platform support will be enabled for TensorFlow
#Do you wish to build TensorFlow with Hadoop File System support? [y/N] n
#No Hadoop File System support will be enabled for TensorFlow
#Found possible Python library paths:
#  /home/soukun/local/lib/python3.5/site-packages
#Please input the desired Python library path to use.  Default is [/home/soukun/local/lib/python3.5/site-packages]
#
#Using python library path: /home/soukun/local/lib/python3.5/site-packages
#Do you wish to build TensorFlow with OpenCL support? [y/N] n
#No OpenCL support will be enabled for TensorFlow
#Do you wish to build TensorFlow with CUDA support? [y/N] y
#CUDA support will be enabled for TensorFlow
#Please specify which gcc should be used by nvcc as the host compiler. [Default is /usr/bin/gcc]: 
#Please specify the CUDA SDK version you want to use, e.g. 7.0. [Leave empty to use system default]: 8.0
#Please specify the location where CUDA 8.0 toolkit is installed. Refer to README.md for more details. [Default is /usr/local/cuda]: 
#Please specify the Cudnn version you want to use. [Leave empty to use system default]: 
#Please specify the location where cuDNN  library is installed. Refer to README.md for more details. [Default is /usr/local/cuda]: 
#Please specify a list of comma-separated Cuda compute capabilities you want to build with.
#You can find the compute capability of your device at: https://developer.nvidia.com/cuda-gpus.
#Please note that each additional compute capability significantly increases your build time and binary size.
#[Default is: "3.5,5.2"]: 

#============================================for CPU Optimized version
# now add the missing file from Eigen
#mkdir third_party/eigen3/unsupported/Eigen/CXX11/src/Tensor
#cd third_party/eigen3/unsupported/Eigen/CXX11/src/Tensor
#wget https://bitbucket.org/eigen/eigen/raw/9ba936354ee8b73fb1966dcb2d3506387bb357f1/unsupported/Eigen/CXX11/src/Tensor/TensorContractionThreadPool.h
#cd ~/local/src/tensorflow/
# replace BUILD file to include the file we just added
#wget https://raw.githubusercontent.com/zuoanqh/bootstrapping/master/BUILD_fixed
#mv BUILD_fixed third_party/eigen3/BUILD
# build
#bazel build -c opt --config=cuda --verbose_failures --copt=-march=native //tensorflow/tools/pip_package:build_pip_package
#=============================================for CPU Optimized version end

bazel build -c opt --verbose_failures //tensorflow/tools/pip_package:build_pip_package
rm ~/local/tem/tensorflow_pkg/*.whl
# remove old ones(if any)
bazel-bin/tensorflow/tools/pip_package/build_pip_package ~/local/tem/tensorflow_pkg
pip3 install ~/local/tem/tensorflow_pkg/*.whl
cd ~

echo "please remember to add the environment variables in this script into ~/.profile"
