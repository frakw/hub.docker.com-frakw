FROM nvcr.io/nvidia/cuda:10.1-base-ubuntu18.04
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

# Install Python 3.8.20 from source
RUN wget https://www.python.org/ftp/python/3.8.20/Python-3.8.20.tgz \
    && tar -xf Python-3.8.20.tgz \
    && cd Python-3.8.20 \
    && ./configure --enable-optimizations \
    && make -j$(nproc) \
    && make altinstall \
    && cd .. \
    && rm -rf Python-3.8.20 Python-3.8.20.tgz

# Ensure pip is upgraded
RUN python3.8 -m pip install --upgrade pip

# Set Python 3.8 as the default python
RUN update-alternatives --install /usr/bin/python python /usr/local/bin/python3.8 1

# Optional: Set python3 and python alias to python3.8
RUN ln -sf /usr/local/bin/python3.8 /usr/bin/python3 \
    && ln -sf /usr/local/bin/python3.8 /usr/bin/python

COPY ./requirements.txt /root

RUN cd /root \
    && pip install -r requirements.txt --verbose

WORKDIR /root/IFA
