cd ~/local/src
wget https://github.com/bazelbuild/bazel/releases/download/0.5.4/bazel-0.5.4-installer-linux-x86_64.sh
chmod 755 bazel-0.5.4-installer-linux-x86_64.sh
./bazel-0.5.4-installer-linux-x86_64.sh --user --prefix=$HOME/local
bazel
source $HOME/.bazel/bin/bazel-complete.bash
