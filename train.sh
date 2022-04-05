#!/bin/bash
#SBATCH --gres=gpu:4       # Request GPU "generic resources"
#SBATCH --cpus-per-task=10  # Refer to cluster's documentation for the right CPU/GPU ratio
#SBATCH --mem=100000M       # Memory proportional to GPUs: 32000 Cedar, 47000 Béluga, 64000 Graham.
#SBATCH --time=4-03:00     # DD-HH:MM:SS

source ./Env/bin/activate
source ./ENV/bin/activate


source=methods
target=tests
lr=1e-4
batch_size=16
beam_size=10
source_length=512
target_length=240
output_dir=saved_models/dec_6_eval_test_data_contex_Assert_graphcodebert_511_240/$source-$target/
train_file=dataset/eval_Assert.$source,dataset/eval_Assert.$target
dev_file=dataset/test_Assert.$source,dataset/test_Assert.$target
# train_file=dataset/small/train_final_500.$source,dataset/small/train_final_500.$target
# dev_file=dataset/small/eval_final_500.$source,dataset/small/eval_final_500.$target
epochs=40
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
