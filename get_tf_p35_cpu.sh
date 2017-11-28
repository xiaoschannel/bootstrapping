# move to source directory
cd $HOME/local/src

git clone --recurse-submodules https://github.com/tensorflow/tensorflow
cd tensorflow
./configure
#Please specify the location of python. [Default is /usr/bin/python]: $HOME/local/bin/python3
#Found possible Python library paths:
#  /home/soukun/local/lib/python3.5/site-packages
#Please input the desired Python library path to use.  Default is [/home/soukun/local/lib/python3.5/site-packages]
#Do you wish to build TensorFlow with jemalloc as malloc support? [Y/n]: 
#jemalloc as malloc support will be enabled for TensorFlow.
#Do you wish to build TensorFlow with Google Cloud Platform support? [Y/n]:n
#Google Cloud Platform support will be enabled for TensorFlow.
#Do you wish to build TensorFlow with Hadoop File System support? [Y/n]: n
#No Hadoop File System support will be enabled for TensorFlow.
#Do you wish to build TensorFlow with Amazon S3 File System support? [Y/n]: n
#No Amazon S3 File System support will be enabled for TensorFlow.
#Do you wish to build TensorFlow with XLA JIT support? [y/N]:
#No XLA JIT support will be enabled for TensorFlow.
#Do you wish to build TensorFlow with GDR support? [y/N]: 
#No GDR support will be enabled for TensorFlow.
#Do you wish to build TensorFlow with VERBS support? [y/N]: 
#No VERBS support will be enabled for TensorFlow.
#Do you wish to build TensorFlow with OpenCL support? [y/N]:
#No OpenCL support will be enabled for TensorFlow.
#Do you wish to build TensorFlow with CUDA support? [y/N]:
#No CUDA support will be enabled for TensorFlow.
#Do you wish to build TensorFlow with MPI support? [y/N]: 
#No MPI support will be enabled for TensorFlow.
#Please specify optimization flags to use during compilation when bazel option "--config=opt" is specified [Default is -march=native]:
#Add "--config=mkl" to your bazel command to build with MKL support.
#Please note that MKL on MacOS or windows is still not supported.
#If you would like to use a local MKL instead of downloading, please set the environment variable "TF_MKL_ROOT" every time before build.
#Configuration finished

bazel build -c opt --config=mkl --verbose_failures //tensorflow/tools/pip_package:build_pip_package
rm ~/local/tem/tensorflow_pkg/*.whl
# remove old ones(if any)
bazel-bin/tensorflow/tools/pip_package/build_pip_package ~/local/tem/tensorflow_pkg
pip3 install ~/local/tem/tensorflow_pkg/*.whl
cd ~

echo "please remember to add the environment variables in this script into ~/.profile"
