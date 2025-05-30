# RTX5080 GPU?? Dockerfile
# CUDA 12.6 + cuDNN 9 + Python 3.11
FROM nvidia/cuda:12.6-devel-ubuntu22.04

# ??????
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV CUDA_HOME=/usr/local/cuda
ENV PATH=${CUDA_HOME}/bin:${PATH}
ENV LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}

# ???????????????????
RUN apt-get update && apt-get install -y \
    python3.11 \
    python3.11-dev \
    python3-pip \
    python3.11-venv \
    build-essential \
    cmake \
    git \
    wget \
    curl \
    vim \
    htop \
    libsndfile1 \
    libsndfile1-dev \
    ffmpeg \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

# Python ???????3.11???
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1

# pip???
RUN python3 -m pip install --upgrade pip setuptools wheel

# ???????????
WORKDIR /app

# requirements.txt?????????????????
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ???????????????
COPY . .

# Jupyter Notebook???????????
EXPOSE 8888

# ?????????
CMD ["python", "-c", "import torch; print(f'CUDA available: {torch.cuda.is_available()}'); print(f'CUDA devices: {torch.cuda.device_count()}'); print(f'Current device: {torch.cuda.current_device() if torch.cuda.is_available() else \"CPU\"}')"]
