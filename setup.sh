
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
#wget -O stable-diffusion-webui/models/Stable-diffusion/ChilloutMix.safetensors https://civitai.com/api/download/models/11745
#wget -O stable-diffusion-webui/models/Stable-diffusion/Cetus-Mix.safetensors https://civitai.com/api/download/models/8298
#wget -O stable-diffusion-webui/models/Stable-diffusion/nsfw.safetensors https://civitai.com/api/download/models/12763
wget -O stable-diffusion-webui/models/Stable-diffusion/brav5.safetensors https://civitai.com/api/download/models/63786
wget -O stable-diffusion-webui/models/Stable-diffusion/perfectworld.safetensors https://civitai.com/api/download/models/77276 


#download controlnet models
wget -O control_v11f1e_sd15_tile.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1e_sd15_tile.pth
wget -O control_v11p_sd15_openpose.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_openpose.pth

# change ownership of the web UI so that a regular user can start the server
sudo chown -R ubuntu:ubuntu stable-diffusion-webui/

# start the server as user 'ubuntu'
sudo -u ubuntu nohup bash stable-diffusion-webui/webui.sh --listen  > log.txt


#https://www.prompthunt.com/explore
#negative prompt veryBadImageNegative,[( NG_DeepNegative_V1_64T :0.9) :0.1]