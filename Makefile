# RTX5080 GPU Environment Makefile

.PHONY: help build up down restart logs shell gpu-test clean

# Default target
help:
	@echo "RTX5080 GPU Docker Environment Management Commands"
	@echo ""
	@echo "Available commands:"
	@echo "  build       - Build Docker image"
	@echo "  up          - Start containers"
	@echo "  down        - Stop and remove containers"
	@echo "  restart     - Restart containers"
	@echo "  logs        - Show logs"
	@echo "  shell       - Access container shell"
	@echo "  gpu-test    - Test GPU functionality"
	@echo "  jupyter     - Show Jupyter Notebook access info"
	@echo "  tensorboard - Show TensorBoard access info"
	@echo "  clean       - Remove unused images and volumes"
	@echo "  clean-all   - Remove all Docker resources (WARNING)"

# Build Docker image
build:
	@echo "Building RTX5080 Docker image..."
	docker compose build --no-cache

# Start containers
up:
	@echo "Starting RTX5080 GPU environment..."
	docker compose up -d
	@echo "Startup complete!"
	@echo "Jupyter Notebook: http://localhost:8888"
	@echo "TensorBoard: http://localhost:6006"

# Stop and remove containers
down:
	@echo "Stopping containers..."
	docker compose down

# Restart containers
restart:
	@echo "Restarting containers..."
	docker compose restart

# Show logs
logs:
	docker compose logs -f

# Access container shell
shell:
	docker compose exec gpu-ml-app bash

# Test GPU functionality
gpu-test:
	@echo "Testing GPU functionality..."
	docker compose exec gpu-ml-app python -c "import torch; print(f'CUDA available: {torch.cuda.is_available()}'); print(f'GPU count: {torch.cuda.device_count()}'); print(f'GPU name: {torch.cuda.get_device_name(0) if torch.cuda.is_available() else \"No GPU\"}'); print(f'CUDA version: {torch.version.cuda}' if torch.cuda.is_available() else 'No CUDA')"

# Jupyter Notebook access info
jupyter:
	@echo "Jupyter Notebook Access Information:"
	@echo "URL: http://localhost:8888"
	@echo "Token: None (pre-configured)"

# TensorBoard access info
tensorboard:
	@echo "TensorBoard Access Information:"
	@echo "URL: http://localhost:6006"

# Remove unused resources
clean:
	@echo "Removing unused Docker resources..."
	docker system prune -f
	docker volume prune -f

# Remove all Docker resources (WARNING)
clean-all:
	@echo "WARNING: This will remove all Docker resources"
	@read -p "Continue? (y/N): " confirm && [ "$$confirm" = "y" ]
	docker system prune -a -f --volumes

# Development setup
dev-setup:
	@echo "Setting up development environment..."
	mkdir -p src data models notebooks outputs logs
	@echo "Directory structure created:"
	@echo "  src/        - Source code"
	@echo "  data/       - Data files"
	@echo "  models/     - Trained models"
	@echo "  notebooks/  - Jupyter Notebooks"
	@echo "  outputs/    - Output results"
	@echo "  logs/       - Log files"

# Update packages
update-packages:
	@echo "Updating Python packages..."
	docker compose exec gpu-ml-app pip install --upgrade pip
	docker compose exec gpu-ml-app pip install --upgrade -r requirements.txt
