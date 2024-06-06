# Comfier
This is just a simple Docker container with a few helpful additions to get you up and running with [ComfyUI](https://github.com/comfyanonymous/ComfyUI) quickly and conveniently.
It already has Python, CUDA, and CuDNN installed, so you only need to run it with `--gpus all` (already configured in the Compose file) and you won't need any CUDA-related dependencies on your host besides the NVIDIA driver.

I've tested this on Ubuntu 24.04, but I see no reason it wouldn't work on other systems including WSL.

## Pre-requisites:

1. NVIDIA driver [🔗](https://www.nvidia.com/en-in/drivers/)
1. Docker engine [🔗](https://docs.docker.com/desktop/install/linux-install/)
1. NVIDIA Container Toolkit [🔗](https://github.com/NVIDIA/nvidia-container-toolkit)

## Instructions:

1. Create directories to hold your models, input images, and output images;
1. Modify [`docker-compose.yml`](docker-compose.yml):
    * Change `/path/to/models`, `path/to/input`, and `/path/to/output` to the paths to the directories you created,
    * Change `groupid` and `userid` to the user/group that should read/write the files in the above directories (you can get your current group/user with `id -u` and `id -g`, respectively);
1. Download the models you will want to use (good resources include [HuggingFace](https://huggingface.co/) and [Civatai](https://civitai.com/)):
    * Checkpoints, e.g. SD1.5 or SDXL,
    * LoRAs,
    * Embeddings,
    * Upscalers,
    * etc;
1. Run `docker compose up` in the folder containing `docker-compose.yml`;
1. Navigate to [http://127.0.0.1:8188](http://127.0.0.1:8188) in your browser.
1. You can use <kbd>ctrl</kbd>+<kbd>c</kbd> to terminate ComfyUI.

_Note: You need to restart the container each time you add anything to the `models` volume._

## To-Do:
* I indend to update this soon with a few useful plug-ins that I have been playing with.
* I'd also like to set up the [`start.sh`](start.sh) script to auto-download some popular models to get you started even quicker, but I need to look into the legality of this first.
