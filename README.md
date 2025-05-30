# RTX5080 GPU-Optimized Machine Learning Environment

Docker-based machine learning development environment optimized for NVIDIA RTX5080 GPU.

## ? Features

- **RTX5080 GPU Full Support**: CUDA 12.6 + cuDNN 9
- **Latest Frameworks**: PyTorch 2.5+, TensorFlow 2.16+
- **Jupyter Notebook**: Browser-based development environment
- **TensorBoard**: Real-time training monitoring
- **FastAPI**: Web API development support

## ? Requirements

- NVIDIA RTX5080 GPU
- Docker & Docker Compose
- NVIDIA Container Toolkit
- Ubuntu 20.04+ / Windows 11 WSL2 / macOS (Intel/M1)

## ? Setup

### 1. Clone Repository

```bash
git clone https://github.com/nullpox7/rtx5080-ml-docker.git
cd rtx5080-ml-docker
```

### 2. Create Directory Structure

```bash
make dev-setup
```

### 3. Start GPU Environment

```bash
# Build image
make build

# Start containers
make up
```

## ?? Usage

### Jupyter Notebook

```bash
# Access in browser
http://localhost:8888
```

### TensorBoard

```bash
# Training monitoring
http://localhost:6006
```

### GPU Status Check

```bash
make gpu-test
```

### Shell Access

```bash
make shell
```

## ? Project Structure

```
.
??? Dockerfile              # RTX5080-optimized Docker setup
??? docker-compose.yml      # Docker Compose configuration
??? requirements.txt        # Python dependencies
??? Makefile               # Convenient commands
??? src/                   # Source code
??? data/                  # Data files
??? models/                # Trained models
??? notebooks/             # Jupyter Notebooks
??? outputs/               # Output results
??? logs/                  # Log files
```

## ? Included Libraries

### Deep Learning Frameworks
- PyTorch 2.5+ (CUDA 12.6 support)
- TensorFlow 2.16+ (GPU support)
- Torchvision, Torchaudio

### Audio Processing
- soundfile 0.13.1 (fixed version)
- librosa
- pydub

### Machine Learning
- scikit-learn
- XGBoost
- LightGBM

### Data Processing
- NumPy
- Pandas
- SciPy

### Visualization
- Matplotlib
- Seaborn
- Plotly

## ?? Common Commands

```bash
# Start environment
make up

# Stop environment
make down

# Check GPU status
make gpu-test

# View logs
make logs

# Shell access
make shell

# Cleanup
make clean
```

## ? Troubleshooting

### GPU Not Detected

1. Check NVIDIA drivers
```bash
nvidia-smi
```

2. Verify NVIDIA Container Toolkit
```bash
docker run --rm --gpus all nvidia/cuda:12.6-base-ubuntu22.04 nvidia-smi
```

### Package Errors

```bash
# Update packages
make update-packages

# Rebuild image
make build
```

### soundfile Error Fix

The `requirements.txt` has been fixed to use `soundfile==0.13.1`.
The previous `soundfile==1.0.16` was a non-existent version.

## ? Usage Examples

### PyTorch GPU Check

```python
import torch

print(f"CUDA available: {torch.cuda.is_available()}")
print(f"GPU count: {torch.cuda.device_count()}")
print(f"Current GPU: {torch.cuda.get_device_name(0)}")
```

### TensorFlow GPU Check

```python
import tensorflow as tf

print(f"GPU available: {len(tf.config.list_physical_devices('GPU')) > 0}")
print(f"GPU devices: {tf.config.list_physical_devices('GPU')}")
```

## ? Sample Notebook

`notebooks/gpu_check.ipynb` contains sample code for environment verification.
Use it after starting Jupyter Notebook.

## ? Links

- [PyTorch Documentation](https://pytorch.org/docs/)
- [TensorFlow Documentation](https://www.tensorflow.org/api_docs)
- [NVIDIA CUDA Documentation](https://docs.nvidia.com/cuda/)

## ? License

This project is licensed under the MIT License.

## ? Contributing

Bug reports and feature requests are welcome via Issues.
Pull requests are also appreciated!