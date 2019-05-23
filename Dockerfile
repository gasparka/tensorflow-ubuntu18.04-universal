FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04

RUN apt-get update && \
      apt-get install -y python3 python3-pip && \
      rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir tensorflow-gpu

# HACK to help Tensoflow fallback to CPU without crashing
# https://stackoverflow.com/questions/47057452/is-it-possible-to-install-the-cpu-and-gpu-versions-of-tensorflow-at-the-same-tim
# https://github.com/tillahoffmann/universal_tensorflow
RUN mkdir /usr/local/cuda/lib64/stubs/ && \
      ln -s /usr/local/cuda-10.0/compat/libcuda.so.1 /usr/local/cuda/lib64/stubs/libcuda.so.1 && \
      ln -s /usr/local/cuda-10.0/compat/libnvidia-fatbinaryloader.so.410.104 /usr/local/cuda/lib64/stubs/libnvidia-fatbinaryloader.so.410.104 && \
      echo "/usr/local/cuda/lib64/stubs" > /etc/ld.so.conf.d/z-cuda-stubs.conf && \
      ldconfig

ADD test.py /
CMD python3 test.py