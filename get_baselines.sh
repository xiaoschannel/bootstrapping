cd ~/local/src
git clone https://github.com/openai/baselines.git
cd baselines
sudo apt-get update && sudo apt-get install cmake libopenmpi-dev python3-dev zlib1g-dev
pip3 install -e .
