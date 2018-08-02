#!/bin/csh

#$ -q gpu           # Specify queue
#$ -l gpu_card=2    # Specify parallel environment and legal core size
#$ -N rare_hamming_20way_cheby  # Specify job name

#module load tensorflow/1.8
#module load python/3.6.0

#python train.py --memory_size=20000  --batch_size=16 --episode_width=5 --episode_length=50 --num_episodes=5 --rep_dim=128
#python train.py --memory_size=20000 --batch_size=16 --validation_length=50  --episode_width=5 --episode_length=50 --num_episodes=100 --save_dir=test
#python train.py --save_dir=prec32_v10 --memory_size=20000 --batch_size=16 --validation_length=50  --episode_width=5 --episode_length=50 --num_episodes=2020 --log_dir=way5 --precision_bits=32 
#python train.py --save_dir=prec16_v10_2 --memory_size=20000 --batch_size=16 --validation_length=50  --episode_width=5 --episode_length=50 --num_episodes=2020 --log_dir=way5 --precision_bits=16 
#python train.py --save_dir=prec8_v10 --memory_size=20000 --batch_size=16 --validation_length=50  --episode_width=5 --episode_length=50 --num_episodes=2020 --log_dir=way5 --precision_bits=8 
#python train.py --save_dir=prec4_v10 --memory_size=20000 --batch_size=16 --validation_length=50  --episode_width=5 --episode_length=50 --num_episodes=2020 --log_dir=way5 --precision_bits=4 
#python train.py --save_dir=prec2_v10 --memory_size=20000 --batch_size=16 --validation_length=50  --episode_width=5 --episode_length=50 --num_episodes=2020 --log_dir=way5--precision_bits=2 
#python train.py --save_dir=prec1_v10 --memory_size=20000 --batch_size=16 --validation_length=50  --episode_width=5 --episode_length=50 --num_episodes=2020 --log_dir=way5 --precision_bits=1 

#python train.py --save_dir=prec32_v4 --memory_size=20000 --batch_size=16 --validation_length=50  --episode_width=5 --episode_length=50 --num_episodes=2020 --log_dir=precision_test --precision_bits=32

python train.py --save_dir=prec32_v10_20way --memory_size=20000 --batch_size=16  --episode_width=20 --episode_length=150 --num_episodes=2020 --log_dir=way20 --precision_bits=32 
python train.py --save_dir=prec16_v10_20way --memory_size=20000 --batch_size=16  --episode_width=20 --episode_length=150 --num_episodes=2020 --log_dir=way20 --precision_bits=16 
python train.py --save_dir=prec8_v10_20way --memory_size=20000 --batch_size=16 --episode_width=20 --episode_length=150 --num_episodes=2020 --log_dir=way20 --precision_bits=8 
python train.py --save_dir=prec4_v10_20way --memory_size=20000 --batch_size=16 --episode_width=20 --episode_length=150 --num_episodes=2020 --log_dir=way20 --precision_bits=4 
python train.py --save_dir=prec2_v10_20way --memory_size=20000 --batch_size=16  --episode_width=20 --episode_length=150 --num_episodes=2020 --log_dir=way20 --precision_bits=2
python train.py --save_dir=prec1_v10_20way --memory_size=20000 --batch_size=16  --episode_width=20 --episode_length=150 --num_episodes=2020 --log_dir=way20 --precision_bits=1

#python train.py --memory_size=20000  --batch_size=16 --episode_width=20 --episode_length=150 --num_episodes=5000 --rep_dim=512
