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
RUN echo "if [ $INPUT_BUILDROOT_EXTERNAL_PATH ];then" > /etc/buildroot.sh
RUN echo "echo \"INPUT_BUILDROOT_EXTERNAL_PATH IS NOT EXISTS\"" >> /etc/buildroot.sh
RUN echo "make BR2_EXTERNAL=$(pwd)/$INPUT_BUILDROOT_EXTERNAL_PATH -C $(pwd)/$INPUT_BUILDROOT_PATH $INPUT_MAKE_TARGET" >> /etc/buildroot.sh
RUN echo "else" >> /etc/buildroot.sh
RUN echo "make  -C $(pwd)/$INPUT_BUILDROOT_PATH $INPUT_MAKE_TARGET" >> /etc/buildroot.sh
RUN echo "fi" >> /etc/buildroot.sh
RUN chmod 755 /etc/buildroot.sh
ENTRYPOINT ["/etc/buildroot.sh"]
