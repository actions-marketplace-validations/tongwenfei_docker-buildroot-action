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
ENTRYPOINT [ "make", "BR2_EXTERNAL=$(pwd)/$(ECI_BR_EXTERNAL_RELATIVE_PATH)/", "-C", "$(pwd)/$(ECI_BR_RELATIVE_PATH)"]
CMD [ "help" ]

