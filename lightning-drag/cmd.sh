docker build . -t frakw/lightning-drag:latest
docker compose up -d
docker exec -it lightning-drag-container /bin/bash

git clone https://huggingface.co/Lykon/dreamshaper-8-inpainting
git clone https://huggingface.co/latent-consistency/lcm-lora-sdv1-5
git clone https://huggingface.co/h94/IP-Adapter/
git clone https://huggingface.co/stabilityai/sd-vae-ft-mse
git clone https://huggingface.co/LightningDrag/lightning-drag-sd15

python drag_ui.py \
    --base_sd_path="checkpoints/dreamshaper-8-inpainting/" \
    --vae_path="checkpoints/sd-vae-ft-mse/" \
    --ip_adapter_path="checkpoints/IP-Adapter/models/" \
    --lightning_drag_model_path="checkpoints/lightning-drag-sd15" \
    --lcm_lora_path="checkpoints/lcm-lora-sdv1-5"