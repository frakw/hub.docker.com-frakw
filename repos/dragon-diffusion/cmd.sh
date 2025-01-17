docker build . -t frakw/dragon-diffusion
docker compose up -d
docker exec -it dragon-diffusion-container /bin/bash
python app.py