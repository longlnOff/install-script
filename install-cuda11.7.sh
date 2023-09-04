filecuda='cuda-repo-ubuntu2004-11-7-local_11.7.1-515.65.01-1_amd64.deb'
# Install CUDA
wget -P . https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
# check if file exists
# else download
if [ -f "$filecuda" ]; then
    echo "$filecuda exists."
else 
    echo "$filecuda does not exist."
    echo "Downloading $filecuda"
    wget -P . https://developer.download.nvidia.com/compute/cuda/11.7.1/local_installers/cuda-repo-ubuntu2004-11-7-local_11.7.1-515.65.01-1_amd64.deb

fi
sudo dpkg -i cuda-repo-ubuntu2004-11-7-local_11.7.1-515.65.01-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2004-11-7-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda
# Environment variables
sudo echo "export PATH=/usr/local/cuda-11.7/bin${PATH:+:${PATH}}">> "/home/long/.bashrc"
sudo echo "export CUDA_HOME=/usr/local/cuda">> "/home/long/.bashrc"
# Install CUDNN 
wget -P . https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt-get update
sudo apt-get install -y libcudnn8=8.5.0.*-1+cuda11.7
sudo apt-get install -y libcudnn8-dev=8.5.0.*-1+cuda11.7

