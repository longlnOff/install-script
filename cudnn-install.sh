url='https://developer.download.nvidia.com/compute/cudnn/secure/8.5.0/local_installers/11.7/cudnn-linux-x86_64-8.5.0.96_cuda11-archive.tar.xz?Y2kIM8ki_B7qHVveDBTQLKiNhfsi65DrMEcQUMp_OujBSsP71U-YCqh4vkq_Hj6eywHqb-h5WDdiR2OuAITpkR3JwrcLYIy2d4kWW6YHxF4k3FAP0be5ySiRoLdJrnv9noVzHXKZtnICSnNEVaI12U_0x6qlZxPYiCWmqAzt3Ktht7sOn3QLd7fiywYb4ivCquTgOwinH2UZAhl0CNrimfY=&t=eyJscyI6ImJzZW8iLCJsc2QiOiJodHRwczovL3d3dy5iaW5nLmNvbS8ifQ=='
filename="cudnn-linux-x86_64-8.5.0.96_cuda11-archive.tar.xz"
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
folder='cudnn-linux-x86_64-8.5.0.96_cuda11-archive'
if [ -d "$folder" ]; then
    echo "$folder exists."
else 
    echo "$folder does not exist."
    echo "Extracting $filename"
    tar -xf $filename
fi

path_current=$(pwd)
echo "Current path: $path_current"
cp -r $path_current/$folder/include/*.h /usr/local/cuda/include/
cp -P $path_current/$folder/lib/libcudnn* /usr/local/cuda/lib64/
chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*
