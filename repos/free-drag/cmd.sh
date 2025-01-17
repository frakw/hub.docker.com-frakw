docker build . -t frakw/free-drag
docker compose up -d
docker exec -it free-drag-container /bin/bash
bash download_models.sh
CUDA_LAUNCH_BLOCKING=1 python FreeDrag_gradio.py