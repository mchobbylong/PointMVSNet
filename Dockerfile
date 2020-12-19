FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu18.04

RUN sed -i s@/archive.ubuntu.com/@/mirrors.bfsu.edu.cn/@g /etc/apt/sources.list && \
    sed -i s@/security.ubuntu.com/@/mirrors.bfsu.edu.cn/@g /etc/apt/sources.list && \
    apt update || true && \
    apt install python3 python3-pip nano git libsm6 libxext6 libxrender-dev -y && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install torch==1.2.0+cu92 torchvision==0.4.0+cu92 -f https://download.pytorch.org/whl/torch_stable.html

COPY requirements_docker.txt /tmp/
RUN pip3 install -r /tmp/requirements_docker.txt -i https://mirrors.bfsu.edu.cn/pypi/web/simple

VOLUME /PointMVSNet
WORKDIR /PointMVSNet

ENTRYPOINT ["./docker-entrypoint.sh"]
