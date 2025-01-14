# Stable Diffusion web UI  on AWS
This is a fork of https://github.com/AUTOMATIC1111/stable-diffusion-webui/ based on the main version on 21 Dec 2022.

This repo contains a setup script that can be run on an EC2 instance as a one-click deployment.
! Still under development
![](screenshot.png)

# Step 1 - CloudFormation
upload 100644 sd-web-ui-cf-template.yaml to cloudFormation Stacks then keep everything in default.
Note: AMI will change according to country so do change for your country. Different AMI/ country will have different rate. Refer: https://aws.amazon.com/ec2/pricing/on-demand/

# Step 2 - Go to EC2 to Connect your instance and check
you can check the service whether running or not by this two method
nestat -atn  > find if any listening to 7860 port
check if there is a file name log.txt, if exist means is trying to run the service.
cat log.txt >  to see what are the stages of the services.

# Step 3 - Find your public IP from ur EC2 instance
then browse http://x:7860 where is ur public ip for example if your public ip is 0.0.0.0 then http://0.0.0.0:7860

# Step 4 - Install required plugin for further use.
WIP 

## Credits
Licenses for borrowed code can be found in `Settings -> Licenses` screen, and also in `html/licenses.html` file.
- Stable Diffusion Web UI on EC2 - https://github.com/marshmellow77/stable-diffusion-webui
- Stable Diffusion - https://github.com/CompVis/stable-diffusion, https://github.com/CompVis/taming-transformers
- k-diffusion - https://github.com/crowsonkb/k-diffusion.git
- GFPGAN - https://github.com/TencentARC/GFPGAN.git
- CodeFormer - https://github.com/sczhou/CodeFormer
- ESRGAN - https://github.com/xinntao/ESRGAN
- SwinIR - https://github.com/JingyunLiang/SwinIR
- Swin2SR - https://github.com/mv-lab/swin2sr
- LDSR - https://github.com/Hafiidz/latent-diffusion
- MiDaS - https://github.com/isl-org/MiDaS
- Ideas for optimizations - https://github.com/basujindal/stable-diffusion
- Cross Attention layer optimization - Doggettx - https://github.com/Doggettx/stable-diffusion, original idea for prompt editing.
- Cross Attention layer optimization - InvokeAI, lstein - https://github.com/invoke-ai/InvokeAI (originally http://github.com/lstein/stable-diffusion)
- Sub-quadratic Cross Attention layer optimization - Alex Birch (https://github.com/Birch-san/diffusers/pull/1), Amin Rezaei (https://github.com/AminRezaei0x443/memory-efficient-attention)
- Textual Inversion - Rinon Gal - https://github.com/rinongal/textual_inversion (we're not using his code, but we are using his ideas).
- Idea for SD upscale - https://github.com/jquesnelle/txt2imghd
- Noise generation for outpainting mk2 - https://github.com/parlance-zz/g-diffuser-bot
- CLIP interrogator idea and borrowing some code - https://github.com/pharmapsychotic/clip-interrogator
- Idea for Composable Diffusion - https://github.com/energy-based-model/Compositional-Visual-Generation-with-Composable-Diffusion-Models-PyTorch
- xformers - https://github.com/facebookresearch/xformers
- DeepDanbooru - interrogator for anime diffusers https://github.com/KichangKim/DeepDanbooru
- Sampling in float32 precision from a float16 UNet - marunine for the idea, Birch-san for the example Diffusers implementation (https://github.com/Birch-san/diffusers-play/tree/92feee6)
- Instruct pix2pix - Tim Brooks (star), Aleksander Holynski (star), Alexei A. Efros (no star) - https://github.com/timothybrooks/instruct-pix2pix
- Security advice - RyotaK
- UniPC sampler - Wenliang Zhao - https://github.com/wl-zhao/UniPC
- Initial Gradio script - posted on 4chan by an Anonymous user. Thank you Anonymous user.
- (You)
