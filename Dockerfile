FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    bash \
    bc \
    binutils \
    build-essential \
    bzip2 \
    cpio \
    g++ \
    gcc \
    git \
    gzip \
    locales \
    libncurses5-dev \
    libdevmapper-dev \
    libsystemd-dev \
    make \
    mercurial \
    whois \
    patch \
    perl \
    python3 \
    rsync \
    sed \
    tar \
    vim \ 
    unzip \
    wget \
    bison \
    file \
    flex \
    libssl-dev \
    libfdt-dev \
    fakeroot \
    && apt-get clean -y
RUN echo "#! /bin/bash" > /etc/buildroot.sh
RUN echo "echo \"INPUT_BUILDROOT_PATH: $INPUT_BUILDROOT_PATH\"" >> /etc/buildroot.sh
RUN echo "echo \"INPUT_MAKE_TARGET: $INPUT_MAKE_TARGET\"" >> /etc/buildroot.sh
RUN echo "echo \"INPUT_BUILDROOT_EXTERNAL_PATH: $INPUT_BUILDROOT_EXTERNAL_PATH\"" >> /etc/buildroot.sh
RUN echo "echo $*" >> /etc/buildroot.sh
RUN echo "echo para num: $#" >> /etc/buildroot.sh
RUN echo "if [ $# -eq 2 ]; then" >> /etc/buildroot.sh
RUN echo "echo $1 $2" >> /etc/buildroot.sh
RUN echo "-C $(pwd)/$1 $2" >> /etc/buildroot.sh
RUN echo "elif [ $# -eq 3 ]; then" >> /etc/buildroot.sh
RUN echo "echo $1 $2 $3" >> /etc/buildroot.sh
RUN echo "make BR2_EXTERNAL=$(pwd)/$3 -C $(pwd)/$1 $2" >> /etc/buildroot.sh
RUN echo "else" >> /etc/buildroot.sh
RUN echo "echo para error" >> /etc/buildroot.sh
RUN echo "exit 1" >> /etc/buildroot.sh
RUN echo "fi" >> /etc/buildroot.sh
RUN chmod 755 /etc/buildroot.sh
ENTRYPOINT /etc/buildroot.sh
