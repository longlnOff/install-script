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
    curl "https://drive.usercontent.google.com/download?id=15s_J-DVLTGK6EiIBcNlcf0E02t3UAllU&echo 'export=download&authuser=0&confirm=t&uuid=af808d59-6629-47f9-9469-5c5d8de8e4e9&at=APZUnTW5ZjPF10KToZVs9c168xKJ:1693967264619" --output $filecuda
fi

sudo dpkg -i cuda-repo-ubuntu2004-11-7-local_11.7.1-515.65.01-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2004-11-7-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda

# Install libcudnn 
wget -P . https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt-get update
sudo apt-get install -y libcudnn8=8.5.0.*-1+cuda11.7
sudo apt-get install -y libcudnn8-dev=8.5.0.*-1+cuda11.7


path_bashrc=/home/long/.bashrc
path_bashrc=/home/longln/.bashrc
echo 'export PATH=/usr/local/cuda-11.2/bin${PATH:+:${PATH}}' >> $path_bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-11.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> $path_bashrc
echo 'export CUDA_HOME=/usr/local/cuda' >> $path_bashrc