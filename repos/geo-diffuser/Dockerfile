FROM nvcr.io/nvidia/cuda:12.1.0-base-ubuntu22.04
ENV DEBIAN_FRONTEND=noninteractive

# Ensure system packages are updated and install prerequisites
RUN apt-get update && apt-get install -y \
    software-properties-common \
    build-essential \
    wget \
    curl \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libffi-dev \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    liblzma-dev \
    git \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Python 3.10.16 from source
RUN wget https://www.python.org/ftp/python/3.10.16/Python-3.10.16.tgz \
    && tar -xf Python-3.10.16.tgz \
    && cd Python-3.10.16 \
    && ./configure --enable-optimizations \
    && make -j$(nproc) \
    && make altinstall \
    && cd .. \
    && rm -rf Python-3.10.16 Python-3.10.16.tgz

# Ensure pip is upgraded
RUN python3.10 -m pip install --upgrade pip

# Set Python 3.10 as the default python
RUN update-alternatives --install /usr/bin/python python /usr/local/bin/python3.10 1

# Optional: Set python3 and python alias to python3.10
RUN ln -sf /usr/local/bin/python3.10 /usr/bin/python3 \
    && ln -sf /usr/local/bin/python3.10 /usr/bin/python

COPY ./requirements.txt /root

RUN cd /root \
    && pip install torch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu121 \
    && pip install -r requirements.txt

RUN pip install --no-index --no-cache-dir pytorch3d -f https://dl.fbaipublicfiles.com/pytorch3d/packaging/wheels/py310_cu121_pyt210/download.html

RUN apt update \
    && apt-get install libusb-1.0.0-dev libgl1-mesa-glx -y

WORKDIR /root/GeoDiffuser