docker build . -t frakw/sde-drag:latest
docker compose up -d
docker exec -it sde-drag-container /bin/bash
python sdedrag_ui.py