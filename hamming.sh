#!/bin/csh

#$ -q gpu           # Specify queue
#$ -l gpu_card=2    # Specify parallel environment and legal core size
#$ -N rare_hamming_20way_cheby  # Specify job name

module load tensorflow/1.8
#module load python/3.6.0

#python train.py --memory_size=20000  --batch_size=16 --episode_width=5 --episode_length=50 --num_episodes=5 --rep_dim=128
python train.py --memory_size=20000 --batch_size=16 --validation_length=50  --episode_width=5 --episode_length=50 --num_episodes=5000 --save_dir=hamming --precision_bits=32
python train.py --memory_size=20000 --batch_size=16 --validation_length=50  --episode_width=5 --episode_length=50 --num_episodes=5000 --save_dir=hamming --precision_bits=16
python train.py --memory_size=20000 --batch_size=16 --validation_length=50  --episode_width=5 --episode_length=50 --num_episodes=5000 --save_dir=hamming --precision_bits=8
python train.py --memory_size=20000 --batch_size=16 --validation_length=50  --episode_width=5 --episode_length=50 --num_episodes=5000 --save_dir=hamming --precision_bits=4
python train.py --memory_size=20000 --batch_size=16 --validation_length=50  --episode_width=5 --episode_length=50 --num_episodes=5000 --save_dir=hamming --precision_bits=2
python train.py --memory_size=20000 --batch_size=16 --validation_length=50  --episode_width=5 --episode_length=50 --num_episodes=5000 --save_dir=hamming --precision_bits=1
