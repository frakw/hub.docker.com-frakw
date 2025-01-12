# BubMask Docker

## Deploy container

```bash
docker compose up -d
```

## Enter container and test sample image

Make sure you have download mask_rcnn_bubble.h5 and place inside `BubMask/weights`

```bash
docker start bubmask-container
docker exec -it bubmask-container /bin/bash
python ./bubble/bubble.py splash --weights=./weights/mask_rcnn_bubble.h5 --image=./sample_image/Expansion_pipe.jpg --results=./splash_results --confidence=0.01
```

## Build image

```bash
docker build -t frakw/bubmask:latest .
```

You can also use pre-build image here:

[https://hub.docker.com/repository/docker/frakw/bubmask/tags](https://hub.docker.com/repository/docker/frakw/bubmask/tags)
