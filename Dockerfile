#FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu20.04
FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04
RUN apt-get update --yes --quiet && DEBIAN_FRONTEND=noninteractive apt-get install --yes --quiet --no-install-recommends \
    software-properties-common \
    build-essential apt-utils \
    wget curl vim git ca-certificates kmod \
#    nvidia-driver-525 \
    && rm -rf /var/lib/apt/lists/*


RUN pwd
#RUN cp /home/long/install-script/cudnn-linux-x86_64-8.9.2.26_cuda11-archive.tar.xz .
COPY cudnn-linux-x86_64-8.9.2.26_cuda11-archive.tar.xz .
RUN tar -xvf cudnn-linux-x86_64-8.9.2.26_cuda11-archive.tar.xz
RUN mkdir -p /usr/local/nvidia/include
RUN mkdir -p /usr/local/nvidia/lib64
RUN cp cudnn-linux-x86_64-8.9.2.26_cuda11-archive/include/cudnn*.h /usr/local/nvidia/include
RUN cp -P cudnn-linux-x86_64-8.9.2.26_cuda11-archive/lib/libcudnn* /usr/local/nvidia/lib64
RUN cp cudnn-linux-x86_64-8.9.2.26_cuda11-archive/include/cudnn*.h /usr/local/cuda/include
RUN cp -P cudnn-linux-x86_64-8.9.2.26_cuda11-archive/lib/libcudnn* /usr/local/cuda/lib64
RUN chmod a+r /usr/local/nvidia/include/cudnn*.h /usr/local/nvidia/lib64/libcudnn*
RUN chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*
RUN apt-get update
RUN apt-get install -y python3-pip
RUN apt-get update && apt-get install -y sudo
RUN pip3 install tensorflow==2.12
#CUDA 11.8
#RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
#CUDA 11.7
RUN pip3 install torch torchvision torchaudio
COPY requirements.txt .
WORKDIR .
RUN pip3 install -r requirements.txt

# install cudnn


