FROM nvcr.io/nvidia/cuda:11.7.1-base-ubuntu22.04
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
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install Python 3.9.20 from source
RUN wget https://www.python.org/ftp/python/3.9.20/Python-3.9.20.tgz \
    && tar -xf Python-3.9.20.tgz \
    && cd Python-3.9.20 \
    && ./configure --enable-optimizations \
    && make -j$(nproc) \
    && make altinstall \
    && cd .. \
    && rm -rf Python-3.9.20 Python-3.9.20.tgz

# Ensure pip is upgraded
RUN python3.9 -m pip install --upgrade pip

# Set Python 3.9 as the default python
RUN update-alternatives --install /usr/bin/python python /usr/local/bin/python3.9 1

# Optional: Set python3 and python alias to python3.8
RUN ln -sf /usr/local/bin/python3.9 /usr/bin/python3 \
    && ln -sf /usr/local/bin/python3.9 /usr/bin/python

#COPY ./requirements.txt /root

RUN cd /root \
    && git clone https://github.com/weihao1115/cat-sam.git \
    && cd cat-sam \
    && pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117 \
    && python -m pip install -r requirements.txt \
    && python -m pip install -e . \
    && cd .. \
    && rm -r cat-sam 

WORKDIR /root/cat-sam