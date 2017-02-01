FROM python:3.6.0

RUN apt-get update && apt-get install -y \
        curl \
        gcc \
        git \
        make \
        unzip \
    && apt-get clean

WORKDIR /root

RUN git clone https://github.com/stanfordnlp/GloVe \
    && cd GloVe \
    && make \
    && pip install \
        numpy

RUN apt-get purge -y gcc \
    && apt -y autoremove \
    && apt-get clean \
    && rm -rf /var/tmp /tmp /var/lib/apt/lists/*

VOLUME /data