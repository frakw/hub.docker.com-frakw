docker start cat-sam-container 
docker exec -it cat-sam-container /bin/bash
PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:32
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 python test.py --dataset kvasir --cat_type cat-a --ckpt_path official_checkpoints/kvasir_cat-a_vit-l_16shot.pth --batch_size 1
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 python train.py --dataset kvasir --cat_type cat-a --shot_num 1 --train_bs 1 --val_bs 1 --num_workers 8 --sam_type vit_b

CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 python train.py --dataset bubble1 --cat_type cat-a --shot_num 1 --train_bs 1 --val_bs 1 --num_workers 8 --sam_type vit_b
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 python test.py --dataset bubble1 --cat_type cat-a --sam_type vit_b --ckpt_path exp/bubble1_vit_b_cat-a_1shot/best_model.pth --batch_size 1 