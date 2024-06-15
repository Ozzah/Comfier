FROM pytorch/pytorch:2.3.0-cuda12.1-cudnn8-devel

# Set up arguments
ARG grouid=1000
ARG userid=1000

# Install dependencies
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget git ffmpeg
RUN python -m pip install --upgrade pip

# ComfyUI base
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /ComfyUI
RUN pip install -r /ComfyUI/requirements.txt

# ComfyUI Manager
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager.git /ComfyUI/custom_nodes/ComfyUI-Manager
RUN pip install -r /ComfyUI/custom_nodes/ComfyUI-Manager/requirements.txt || true

# ComfyUI TensorRT (for NVIDIA RTX GPUs)
RUN git clone https://github.com/comfyanonymous/ComfyUI_TensorRT.git /ComfyUI/custom_nodes/ComfyUI_TensorRT
RUN pip install -r /ComfyUI/custom_nodes/ComfyUI_TensorRT/requirements.txt || true

# Segment Anything
RUN git clone https://github.com/storyicon/comfyui_segment_anything.git /ComfyUI/custom_nodes/comfyui_segment_anything
RUN pip install -r /ComfyUI/custom_nodes/comfyui_segment_anything/requirements.txt || true

# ReActor
RUN git clone https://github.com/Gourieff/comfyui-reactor-node.git /ComfyUI/custom_nodes/comfyui-reactor-node
RUN pip install -r /ComfyUI/custom_nodes/comfyui-reactor-node/requirements.txt || true

COPY start.sh /ComfyUI/start.sh
RUN chmod +x /ComfyUI/start.sh

# Set up user
RUN groupadd -g ${grouid} comfygroup
RUN useradd -u ${userid} -g ${grouid} --create-home comfyuser
RUN chown -R comfyuser:comfygroup /ComfyUI

ENV PATH="/home/comfyuser/.local/bin:${PATH}"
RUN pip install ultralytics

# Clean up
RUN apt autoremove -y

# Set up environment
WORKDIR /ComfyUI
ENTRYPOINT ["/bin/bash", "start.sh"]
