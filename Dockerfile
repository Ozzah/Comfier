FROM pytorch/pytorch:2.3.0-cuda12.1-cudnn8-devel

# 
ARG grouid=1000
ARG userid=1000

# Install dependencies
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y git
RUN python -m pip install --upgrade pip

# ComfyUI base
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /ComfyUI
RUN pip install -r /ComfyUI/requirements.txt

# Set up user
RUN groupadd -g ${grouid} comfygroup
RUN useradd -u ${userid} -g ${grouid} comfyuser
RUN chown -R comfyuser:comfygroup /ComfyUI

# Clean up
RUN apt remove git -y
RUN apt autoremove -y

# Set up environment
WORKDIR /ComfyUI
ENTRYPOINT ["python", "main.py"]
