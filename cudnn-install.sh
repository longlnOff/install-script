url='https://drive.usercontent.google.com/download?id=1_CXgI1XUKMiOOpeaXs5tsm9Wv4cIughb&export=download&authuser=0&confirm=t&uuid=413fb2b5-e345-4da9-bd2c-11f704c2e93f&at=APZUnTXS3CYUkbBpzKuHk7fs42EP:1693907525830'
filename="cudnn-linux-x86_64-8.9.2.26_cuda11-archive.tar.xz"
echo $filename
# check if filename exists
# else download
if [ -f "$filename" ]; then
    echo "$filename exists."
else 
    echo "$filename does not exist."
    echo "Downloading $filename"
    wget -P . $url -O $filename 
fi
folder='cudnn-linux-x86_64-8.9.2.26_cuda11-archive'
if [ -d "$folder" ]; then
    echo "$folder exists."
else 
    echo "$folder does not exist."
    echo "Extracting $filename"
    tar -xf $filename
fi

path_current=$(pwd)
echo "Current path: $path_current"
mkdir -p /usr/local/nvidia/include
mkdir -p /usr/local/nvidia/lib64
cp -r $path_current/$folder/include/*.h /usr/local/nvidia/include/
cp -P $path_current/$folder/lib/libcudnn* /usr/local/nvidia/lib64/
chmod a+r /usr/local/nvidia/include/cudnn*.h /usr/local/nvidia/lib64/libcudnn*

path_bashrc=/home/long/.bashrc
echo "export LD_LIBRARY_PATH=''" >> $path_bashrc
echo "export LD_LIBRARY_PATH=/usr/local/nvidia/include:$LD_LIBRARY_PATH" >> $path_bashrc
echo "export LD_LIBRARY_PATH=/usr/local/nvidia/lib64:$LD_LIBRARY_PATH" >> $path_bashrc