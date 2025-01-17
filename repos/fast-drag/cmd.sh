docker build . -t frakw/fast-drag
docker compose up -d
docker exec -it fast-drag-container /bin/bash
python drag_ui.py
