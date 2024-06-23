FROM pytorch/pytorch:2.3.1-cuda12.1-cudnn8-devel

# Set up arguments
ARG grouid=1000
ARG userid=1000

# Install dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget git ffmpeg
RUN python -m pip install --upgrade pip
RUN pip install ultralytics yolov5 insightface onnxruntime onnxruntime-gpu

# ComfyUI base
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /ComfyUI
RUN pip install -r /ComfyUI/requirements.txt

# ComfyUI Manager by ltdrdata
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager.git /ComfyUI/custom_nodes/ComfyUI-Manager
RUN pip install -r /ComfyUI/custom_nodes/ComfyUI-Manager/requirements.txt || true

# IPAdapter_plus by cubiq
RUN git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git /ComfyUI/custom_nodes/ComfyUI_IPAdapter_plus
RUN pip install -r /ComfyUI/custom_nodes/ComfyUI_IPAdapter_plus/requirements.txt || true

# AnimateDiff Evolved by Kosinkadink
RUN git clone https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved.git /ComfyUI/custom_nodes/ComfyUI-AnimateDiff-Evolved
RUN pip install -r /ComfyUI/custom_nodes/ComfyUI-AnimateDiff-Evolved/requirements.txt || true

# FixxNodes by FizzleDorf
RUN git clone https://github.com/FizzleDorf/ComfyUI_FizzNodes.git /ComfyUI/custom_nodes/ComfyUI_FizzNodes
RUN pip install -r /ComfyUI/custom_nodes/ComfyUI_FizzNodes/requirements.txt || true

# Advanced-ControlNet by Kosinkadink
RUN git clone https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet.git /ComfyUI/custom_nodes/ComfyUI-Advanced-ControlNet
RUN pip install -r /ComfyUI/custom_nodes/ComfyUI-Advanced-ControlNet/requirements.txt || true

# VideoHelperSuite by Kosinkadink
RUN git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git /ComfyUI/custom_nodes/ComfyUI-VideoHelperSuite
RUN pip install -r /ComfyUI/custom_nodes/ComfyUI-VideoHelperSuite/requirements.txt || true

# ControlNet Auxiliary Preprocessors by Fannovel16
RUN git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git /ComfyUI/custom_nodes/comfyui_controlnet_aux
RUN pip install -r /ComfyUI/custom_nodes/comfyui_controlnet_aux/requirements.txt || true

# KJNodes by kijai
RUN git clone https://github.com/kijai/ComfyUI-KJNodes.git /ComfyUI/custom_nodes/ComfyUI-KJNodes
RUN pip install -r /ComfyUI/custom_nodes/ComfyUI-KJNodes/requirements.txt || true

# ComfyUI Custom Scripts by pythongosssss
RUN git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git /ComfyUI/custom_nodes/ComfyUI-Custom-Scripts
RUN pip install -r /ComfyUI/custom_nodes/ComfyUI-Custom-Scripts/requirements.txt || true

# Segment Anything by storyicon
RUN git clone https://github.com/storyicon/comfyui_segment_anything.git /ComfyUI/custom_nodes/comfyui_segment_anything
RUN pip install -r /ComfyUI/custom_nodes/comfyui_segment_anything/requirements.txt || true

# ReActor by Gourieff
RUN git clone https://github.com/Gourieff/comfyui-reactor-node.git /ComfyUI/custom_nodes/comfyui-reactor-node
RUN pip install -r /ComfyUI/custom_nodes/comfyui-reactor-node/requirements.txt || true

# Inspire Pack by ltdrdata
RUN git clone https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git /ComfyUI/custom_nodes/ComfyUI-Inspire-Pack
RUN pip install -r /ComfyUI/custom_nodes/ComfyUI-Inspire-Pack/requirements.txt || true

# Impact Pack by ltdrdata
RUN git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git /ComfyUI/custom_nodes/ComfyUI-Impact-Pack
RUN pip install -r /ComfyUI/custom_nodes/ComfyUI-Impact-Pack/requirements.txt || true

# WAS Node Suite by WASasquatch
RUN git clone https://github.com/WASasquatch/was-node-suite-comfyui.git /ComfyUI/custom_nodes/was-node-suite-comfyui
RUN pip install -r /ComfyUI/custom_nodes/was-node-suite-comfyui/requirements.txt || true

# Frame Interpolation by Fannovel16
RUN git clone https://github.com/Fannovel16/ComfyUI-Frame-Interpolation.git /ComfyUI/custom_nodes/ComfyUI-Frame-Interpolation
RUN pip install -r /ComfyUI/custom_nodes/ComfyUI-Frame-Interpolation/requirements.txt || true

# Comfyroll Studio by RockOfFire
RUN git clone https://github.com/RockOfFire/ComfyUI_Comfyroll_CustomNodes.git /ComfyUI/custom_nodes/ComfyUI_Comfyroll_CustomNodes
RUN pip install -r /ComfyUI/custom_nodes/ComfyUI_Comfyroll_CustomNodes/requirements.txt || true

# Efficiency Nodes by jags111
RUN git clone https://github.com/jags111/efficiency-nodes-comfyui.git /ComfyUI/custom_nodes/efficiency-nodes-comfyui
RUN pip install -r /ComfyUI/custom_nodes/efficiency-nodes-comfyui/requirements.txt || true

COPY start.sh /ComfyUI/start.sh
RUN chmod +x /ComfyUI/start.sh

# Set up user
RUN groupadd -g ${grouid} comfygroup
RUN useradd -u ${userid} -g ${grouid} --create-home comfyuser
RUN chown -R comfyuser:comfygroup /ComfyUI

ENV PATH="/home/comfyuser/.local/bin:${PATH}"

# Clean up
RUN apt-get autoremove -y

# Set up environment
WORKDIR /ComfyUI
ENTRYPOINT ["/bin/bash", "start.sh"]
