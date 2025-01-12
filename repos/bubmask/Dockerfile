FROM tensorflow/tensorflow:1.14.0-gpu-py3

COPY ./requirements.txt /root

RUN pip install --upgrade pip setuptools wheel

RUN cd /root \
    && pip install -r mm_requirements.txt --verbose \
    && pip install --no-deps imgaug==0.4.0

RUN rm /etc/apt/sources.list.d/cuda.list \
    && apt-get update \
    && apt-get install vim git ffmpeg libsm6 libxext6  -y

RUN cd /root \
    && git clone https://github.com/ywflow/BubMask.git

RUN cd /root/BubMask \
    && python setup.py install \
    && cd .. \
    && rm -r BubMask

WORKDIR /root/BubMask