docker build . -t frakw/drag-diffusion:latest
docker compose up -d
docker exec -it drag-diffusion-container /bin/bash