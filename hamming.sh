#!/bin/csh

#$ -q gpu           # Specify queue
#$ -l gpu_card=2    # Specify parallel environment and legal core size
#$ -N rare_hamming_20way_cheby  # Specify job name

module load tensorflow/1.8
module load python/3.6.0

python train.py --memory_size=2000  --batch_size=16 --episode_width=20 --episode_length=50 --num_episodes=5000 --rep_dim=128
