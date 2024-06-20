#!/bin/sh

# Initialize model directories
mkdir -p /ComfyUI/models/animatediff_models
mkdir -p /ComfyUI/models/animatediff_motion_lora
mkdir -p /ComfyUI/models/bert-base-uncased
mkdir -p /ComfyUI/models/checkpoints
mkdir -p /ComfyUI/models/clip
mkdir -p /ComfyUI/models/clip_vision
mkdir -p /ComfyUI/models/configs
mkdir -p /ComfyUI/models/controlnet
mkdir -p /ComfyUI/models/diffusers
mkdir -p /ComfyUI/models/embeddings
mkdir -p /ComfyUI/models/facerestore_models
mkdir -p /ComfyUI/models/gligen
mkdir -p /ComfyUI/models/grounding-dino
mkdir -p /ComfyUI/models/hypernetworks
mkdir -p /ComfyUI/models/insightface
mkdir -p /ComfyUI/models/ipadapter
mkdir -p /ComfyUI/models/loras
mkdir -p /ComfyUI/models/photomaker
mkdir -p /ComfyUI/models/sams
mkdir -p /ComfyUI/models/style_models
mkdir -p /ComfyUI/models/unet
mkdir -p /ComfyUI/models/upscale_models
mkdir -p /ComfyUI/models/vae
mkdir -p /ComfyUI/models/vae_approx

# Update repos
find . -type d -name ".git" -execdir git pull \;

# Download SDXL and SD1.5 models
wget -nc -O /ComfyUI/models/checkpoints/SD_1.5.safetensors https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors?download=true
wget -nc -O /ComfyUI/models/checkpoints/SDXL_1.0.safetensors https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors?download=true
wget -nc -O /ComfyUI/models/checkpoints/SD_3.0.safetensors https://huggingface.co/stabilityai/stable-diffusion-3-medium/resolve/main/sd3_medium_incl_clips.safetensors?download=true

# Download upscale models
wget -nc -O /ComfyUI/models/upscale_models/4xUltrasharp_4xUltrasharpV10.pt https://huggingface.co/vclansience/SD_lora/resolve/main/4xUltrasharp_4xUltrasharpV10.pt?download=true
wget -nc -O /ComfyUI/models/upscale_models/RealESRGAN_x2.pth https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x2.pth?download=true
wget -nc -O /ComfyUI/models/upscale_models/RealESRGAN_x4.pth https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth?download=true
wget -nc -O /ComfyUI/models/upscale_models/RealESRGAN_x8.pth https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x8.pth?download=true

# Download FaceRestore models
wget -nc -O /ComfyUI/models/facerestore_models/codeformer.pth https://github.com/sczhou/CodeFormer/releases/download/v0.1.0/codeformer.pth

# IPAdapter plus:
wget -nc -O /ComfyUI/models/clip_vision/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors
wget -nc -O /ComfyUI/models/clip_vision/CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/image_encoder/model.safetensors
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter_sd15.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15.safetensors
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter_sd15_light_v11.bin https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_light_v11.bin
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter-plus_sd15.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus_sd15.safetensors
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter-plus-face_sd15.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus-face_sd15.safetensors
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter-full-face_sd15.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-full-face_sd15.safetensors
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter_sd15_vit-G_bigG.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_vit-G.safetensors
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter_sdxl_vit-h.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter-plus_sdxl_vit-h.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter-plus-face_sdxl_vit-h.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus-face_sdxl_vit-h.safetensors
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter_sdxl_bigG.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl.safetensors
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter-faceid_sd15.bin https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sd15.bin
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter-faceid-plusv2_sd15.bin https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15.bin
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter-faceid-portrait-v11_sd15.bin https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait-v11_sd15.bin
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter-faceid_sdxl.bin https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sdxl.bin
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter-faceid-plusv2_sdxl.bin https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl.bin
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter-faceid-portrait_sdxl.bin https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl.bin
wget -nc -O /ComfyUI/models/ipadapter/ip-adapter-faceid-portrait_sdxl_unnorm.bin https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl_unnorm.bin
wget -nc -O /ComfyUI/models/loras/ip-adapter-faceid_sd15_lora.safetensors https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sd15_lora.safetensors
wget -nc -O /ComfyUI/models/loras/ip-adapter-faceid-plusv2_sd15_lora.safetensors https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15_lora.safetensors
wget -nc -O /ComfyUI/models/loras/ip-adapter-faceid_sdxl_lora.safetensors https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sdxl_lora.safetensors
wget -nc -O /ComfyUI/models/loras/ip-adapter-faceid-plusv2_sdxl_lora.safetensors https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl_lora.safetensors
wget -nc -O /ComfyUI/models/ipadapter/ip_plus_composition_sd15.safetensors https://huggingface.co/ostris/ip-composition-adapter/resolve/main/ip_plus_composition_sd15.safetensors
wget -nc -O /ComfyUI/models/ipadapter/ip_plus_composition_sdxl.safetensors https://huggingface.co/ostris/ip-composition-adapter/resolve/main/ip_plus_composition_sdxl.safetensors

# AnimateDiff
wget -nc -O /ComfyUI/models/animatediff_models/mm_sd_v15.ckpt https://huggingface.co/guoyww/animatediff/resolve/main/mm_sd_v15.ckpt?download=true
wget -nc -O /ComfyUI/models/animatediff_models/mm_sd_v15_v2.ckpt https://huggingface.co/guoyww/animatediff/resolve/main/mm_sd_v15_v2.ckpt?download=true
wget -nc -O /ComfyUI/models/animatediff_models/mm_sdxl_v10_beta.ckpt https://huggingface.co/guoyww/animatediff/resolve/main/mm_sdxl_v10_beta.ckpt?download=true
wget -nc -O /ComfyUI/models/animatediff_models/mm-Stabilized_mid.pth https://huggingface.co/manshoety/AD_Stabilized_Motion/resolve/main/mm-Stabilized_mid.pth?download=true
wget -nc -O /ComfyUI/models/animatediff_models/mm-Stabilized_high.pth https://huggingface.co/manshoety/AD_Stabilized_Motion/resolve/main/mm-Stabilized_high.pth?download=true
wget -nc -O /ComfyUI/models/animatediff_motion_lora/v2_lora_PanLeft.ckpt https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_PanLeft.ckpt?download=true
wget -nc -O /ComfyUI/models/animatediff_motion_lora/v2_lora_PanRight.ckpt https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_PanRight.ckpt?download=true
wget -nc -O /ComfyUI/models/animatediff_motion_lora/v2_lora_RollingAnticlockwise.ckpt https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_RollingAnticlockwise.ckpt?download=true
wget -nc -O /ComfyUI/models/animatediff_motion_lora/v2_lora_RollingClockwise.ckpt https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_RollingClockwise.ckpt?download=true
wget -nc -O /ComfyUI/models/animatediff_motion_lora/v2_lora_TiltDown.ckpt https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_TiltDown.ckpt?download=true
wget -nc -O /ComfyUI/models/animatediff_motion_lora/v2_lora_TiltUp.ckpt https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_TiltUp.ckpt?download=true
wget -nc -O /ComfyUI/models/animatediff_motion_lora/v2_lora_ZoomIn.ckpt https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_ZoomIn.ckpt?download=true
wget -nc -O /ComfyUI/models/animatediff_motion_lora/v2_lora_ZoomOut.ckpt https://huggingface.co/guoyww/animatediff/resolve/main/v2_lora_ZoomOut.ckpt?download=true

# Segment Anything
wget -nc -O /ComfyUI/models/bert-base-uncased/config.json https://huggingface.co/google-bert/bert-base-uncased/resolve/main/config.json?download=true
wget -nc -O /ComfyUI/models/bert-base-uncased/model.safetensors https://huggingface.co/google-bert/bert-base-uncased/resolve/main/model.safetensors?download=true
wget -nc -O /ComfyUI/models/bert-base-uncased/tokenizer_config.json https://huggingface.co/google-bert/bert-base-uncased/resolve/main/tokenizer_config.json?download=true
wget -nc -O /ComfyUI/models/bert-base-uncased/tokenizer.json https://huggingface.co/google-bert/bert-base-uncased/resolve/main/tokenizer.json?download=true
wget -nc -O /ComfyUI/models/bert-base-uncased/vocab.txt https://huggingface.co/google-bert/bert-base-uncased/resolve/main/vocab.txt?download=true
wget -nc -O /ComfyUI/models/grounding-dino/GroundingDINO_SwinT_OGC.cfg.py https://huggingface.co/ShilongLiu/GroundingDINO/resolve/main/GroundingDINO_SwinT_OGC.cfg.py?download=true
wget -nc -O /ComfyUI/models/grounding-dino/groundingdino_swint_ogc.pth https://huggingface.co/ShilongLiu/GroundingDINO/resolve/main/groundingdino_swint_ogc.pth?download=true
wget -nc -O /ComfyUI/models/grounding-dino/GroundingDINO_SwinB.cfg.py https://huggingface.co/ShilongLiu/GroundingDINO/resolve/main/GroundingDINO_SwinB.cfg.py?download=true
wget -nc -O /ComfyUI/models/grounding-dino/groundingdino_swinb_cogcoor.pth https://huggingface.co/ShilongLiu/GroundingDINO/resolve/main/groundingdino_swinb_cogcoor.pth?download=true
wget -nc -O /ComfyUI/models/sams/sam_vit_h_4b8939.pth https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth
wget -nc -O /ComfyUI/models/sams/sam_vit_l_0b3195.pth https://dl.fbaipublicfiles.com/segment_anything/sam_vit_l_0b3195.pth
wget -nc -O /ComfyUI/models/sams/sam_vit_b_01ec64.pth https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth
wget -nc -O /ComfyUI/models/sams/sam_hq_vit_h.pth https://huggingface.co/lkeab/hq-sam/resolve/main/sam_hq_vit_h.pth
wget -nc -O /ComfyUI/models/sams/sam_hq_vit_l.pth https://huggingface.co/lkeab/hq-sam/resolve/main/sam_hq_vit_l.pth
wget -nc -O /ComfyUI/models/sams/sam_hq_vit_b.pth https://huggingface.co/lkeab/hq-sam/resolve/main/sam_hq_vit_b.pth
wget -nc -O /ComfyUI/models/sams/mobile_sam.pt https://github.com/ChaoningZhang/MobileSAM/blob/master/weights/mobile_sam.pt

# Ultralytics and InsightFace
wget -nc -O /ComfyUI/models/ultralytics/bbox/face_yolov8m.pt https://huggingface.co/datasets/Gourieff/ReActor/resolve/main/models/detection/bbox/face_yolov8m.pt?download=true
wget -nc -O /ComfyUI/models/insightface/inswapper_128.onnx https://github.com/facefusion/facefusion-assets/releases/download/models/inswapper_128.onnx

python main.py
