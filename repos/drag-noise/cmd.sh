docker build . -t frakw/drag-noise
docker compose up -d
docker exec -it drag-noise-container /bin/bash
python drag_ui.py
<press train lora first>
