url='https://drive.usercontent.google.com/download?id=1IrQes_nRwMSHv8kWX62VU139fYvjzQ_5&export=download&authuser=0&confirm=t&uuid=86938f3e-77ea-400f-86bf-70d765aae3da&at=APZUnTWQ-MlaMC8fjcbCtgj25yJk:1693907489006'
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
