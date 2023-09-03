url="https://developer.download.nvidia.com/compute/cudnn/secure/8.9.2/local_installers/11.x/cudnn-linux-x86_64-8.9.2.26_cuda11-archive.tar.xz?IG8kNEPqXuKs-gesoM8gvGDo8z2dLSwadZykh0ViGTOQnkrcJe03gy4sGCxxeY_6zHhiZn4VmbfRFZga9JsceeOTvYhJ2keptsVNmKm7KTTd8URVG9eS9Sbo9NALhtNsmjIbVnx5SJ58ki705VniksisOvdOeHvWZM3TqFi-zT4Pl08hRAjIrUXG4100bsxmthCdZvNmYmXiaVlCS4LQTv0=&t=eyJscyI6ImdzZW8iLCJsc2QiOiJodHRwczovL3d3dy5nb29nbGUuY29tLyJ9"
filename="cudnn-linux-8.9.2.26.tar.xz"

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
ld_library_path=$path_current/$folder/lib
echo 'export LD_LIBRARY_PATH='$ld_library_path':$LD_LIBRARY_PATH' >> ~/.bashrc
cp -r $path_current/$folder/include/*.h /usr/local/cuda/include/
chmod a+r /usr/local/cuda/include/cudnn.h