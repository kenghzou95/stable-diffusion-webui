
# disable the restart dialogue and install several packages
sudo sed -i "/#\$nrconf{restart} = 'i';/s/.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
sudo apt-get update
sudo apt install wget git python3 python3-venv build-essential net-tools awscli -y

# install CUDA (from https://developer.nvidia.com/cuda-downloads)
wget https://developer.download.nvidia.com/compute/cuda/12.0.0/local_installers/cuda_12.0.0_525.60.13_linux.run
sudo sh cuda_12.0.0_525.60.13_linux.run --silent

# install git-lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
sudo -u ubuntu git lfs install --skip-smudge

#download basic model
wget -O stable-diffusion-webui/models/Stable-diffusion/ChilloutMix.safetensors https://civitai.com/api/download/models/11745
#wget -O stable-diffusion-webui/models/Stable-diffusion/AnythingV5_v5PrtRE.safetensors  https://civitai.com/api/download/models/30163
#wget -O stable-diffusion-webui/models/Stable-diffusion/Cetus-Mix.safetensors https://civitai.com/api/download/models/8298
#wget -O stable-diffusion-webui/models/Stable-diffusion/nsfw.safetensors https://civitai.com/api/download/models/12763
#wget -O stable-diffusion-webui/models/Stable-diffusion/brav5.safetensors https://civitai.com/api/download/models/63786
#wget -O stable-diffusion-webui/models/Stable-diffusion/perfectworld.safetensors https://civitai.com/api/download/models/77276 
#wget -O stable-diffusion-webui/models/Stable-diffusion/anime2d.safetensors  https://civitai.com/api/download/models/77384

#git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser.git stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser
#git clone https://github.com/Mikubill/sd-webui-controlnet.git stable-diffusion-webui/extensions/sd-webui-controlnet
#git clone https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper.git stable-diffusion-webui/extensions/Stable-Diffusion-Webui-Civitai-Helper
#git clone https://github.com/jexom/sd-webui-depth-lib.git stable-diffusion-webui/extensions/sd-webui-depth-lib
#git clone https://github.com/d8ahazard/sd_dreambooth_extension.git stable-diffusion-webui/extensions/sd_dreambooth_extension
#download controlnet models
#wget -O stable-diffusion-webui/extensions/sd-webui-controlnet/models/control_v11f1e_sd15_tile.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1e_sd15_tile.pth
#wget -O stable-diffusion-webui/extensions/sd-webui-controlnet/models/control_v11p_sd15_openpose.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_openpose.pth
#wget -O stable-diffusion-webui/extensions/sd-webui-controlnet/models/control_v11p_sd15_canny.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_canny.pth



wget -O stable-diffusion-webui/models/VAE/vae-ft-mse-840000-ema-pruned.safetensors https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors

# change ownership of the web UI so that a regular user can start the server
sudo chown -R ubuntu:ubuntu stable-diffusion-webui/

# start the server as user 'ubuntu'
sudo -u ubuntu nohup bash stable-diffusion-webui/webui.sh --listen --enable-insecure-extension-access  > log.txt


#https://www.prompthunt.com/explore
#negative prompt veryBadImageNegative,[( NG_DeepNegative_V1_64T :0.9) :0.1]
#self download VAE https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors