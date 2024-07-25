FROM nvidia/cuda:12.5.1-devel-ubuntu24.04

# link CUDA stubs

RUN ln -s /usr/local/cuda/lib64/stubs/libnvidia-ml.so /usr/local/cuda/lib64/libnvidia-ml.so.1 && \
    ln -s /usr/local/cuda/lib64/stubs/libcuda.so /usr/local/cuda/lib64/libcuda.so.1

# install wget
RUN apt update && apt install -y wget

# install mold
RUN mkdir -p mold && cd mold \
  && wget -qO- https://github.com/rui314/mold/releases/download/v2.32.1/mold-2.32.1-x86_64-linux.tar.gz | tar xvz --strip-components=1 \
  && cp bin/mold /usr/local/bin/mold

# set up cmake PPA
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - > /usr/share/keyrings/kitware-archive-keyring.gpg
RUN echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ noble main' > /etc/apt/sources.list.d/kitware.list

RUN  apt update && apt install -y cmake sudo && apt clean
    
USER ubuntu
