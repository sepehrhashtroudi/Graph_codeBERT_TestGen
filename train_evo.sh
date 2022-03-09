#!/bin/bash
#SBATCH --gres=gpu:4       # Request GPU "generic resources"
#SBATCH --cpus-per-task=8  # Refer to cluster's documentation for the right CPU/GPU ratio
#SBATCH --mem=32000M       # Memory proportional to GPUs: 32000 Cedar, 47000 Béluga, 64000 Graham.
#SBATCH --time=2-8:00     # DD-HH:MM:SS

source ./Env/bin/activate



source=methods
target=tests
lr=1e-4
batch_size=16
beam_size=10
source_length=512
target_length=320
output_dir=saved_models/dec_6_combined_contex_graphcodebert_512_320_sbatch/$source-$target/
train_file=dataset/combined/train_combined.$source,dataset/combined/train_combined.$target
dev_file=dataset/combined/eval_combined.$source,dataset/combined/eval_combined.$target
epochs=50
pretrained_model=graphcodebert-base

mkdir -p $output_dir
python run.py \
--do_train \
--do_eval \
--model_type roberta \
--source_lang java \
--model_name_or_path $pretrained_model \
--tokenizer_name graphcodebert-base \
--config_name graphcodebert-base \
--train_filename $train_file \
--dev_filename $dev_file \
--output_dir $output_dir \
--max_source_length $source_length \
--max_target_length $target_length \
--beam_size $beam_size \
--train_batch_size $batch_size \
--eval_batch_size $batch_size \
--learning_rate $lr \
--num_train_epochs $epochs 2>&1| tee $output_dir/train.log
