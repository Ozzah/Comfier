#!/bin/sh

# Initialize model directories
mkdir -p /ComfyUI/models/checkpoints
mkdir -p /ComfyUI/models/clip
mkdir -p /ComfyUI/models/clip_vision
mkdir -p /ComfyUI/models/configs
mkdir -p /ComfyUI/models/controlnet
mkdir -p /ComfyUI/models/diffusers
mkdir -p /ComfyUI/models/embeddings
mkdir -p /ComfyUI/models/facerestore_models
mkdir -p /ComfyUI/models/gligen
mkdir -p /ComfyUI/models/hypernetworks
mkdir -p /ComfyUI/models/loras
mkdir -p /ComfyUI/models/photomaker
mkdir -p /ComfyUI/models/style_models
mkdir -p /ComfyUI/models/unet
mkdir -p /ComfyUI/models/upscale_models
mkdir -p /ComfyUI/models/vae
mkdir -p /ComfyUI/models/vae_approx

# Download SDXL and SD1.5 models
wget -nc -O /ComfyUI/models/checkpoints/SDXL_1.0.safetensors https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors?download=true
wget -nc -O /ComfyUI/models/checkpoints/SD_1.5.safetensors https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors?download=true

# Download FaceRestore models
wget -nc -O /ComfyUI/models/facerestore_models/codeformer.pth https://github.com/sczhou/CodeFormer/releases/download/v0.1.0/codeformer.pth

python main.py
