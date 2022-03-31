#!/bin/bash
#SBATCH --gres=gpu:4       # Request GPU "generic resources"
#SBATCH --cpus-per-task=8  # Refer to cluster's documentation for the right CPU/GPU ratio
#SBATCH --mem=32000M       # Memory proportional to GPUs: 32000 Cedar, 47000 Béluga, 64000 Graham.
#SBATCH --time=1-8:00     # DD-HH:MM:SS

source ./ENV/bin/activate


source=methods
target=tests
lr=1e-4
beam_size=10
source_length=512
target_length=512
batch_size=32
output_dir=saved_models/dec_6_combined_contex_graphcodebert_512_512/$source-$target/
dev_file=dataset/small/eval_evo_80.$source,dataset/small/eval_evo_80.$target
test_file=dataset/small/eval_evo_80.$source,dataset/small/eval_evo_80.$target
# dev_file=dataset/evosuit/Evosuit_train.$source,dataset/evosuit/Evosuit_train.$target
# test_file=dataset/evosuit/Evosuit_train.$source,dataset/evosuit/Evosuit_train.$target
load_model_path=$output_dir/checkpoint-best-bleu/pytorch_model.bin #checkpoint for test
#change above line idiot EDfadddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd


python run.py \
--do_test \
--model_type roberta \
--source_lang $source \
--model_name_or_path $load_model_path \
--tokenizer_name graphcodebert-base \
--config_name graphcodebert-base \
--load_model_path $load_model_path \
--dev_filename $dev_file \
--test_filename $test_file \
--output_dir $output_dir \
--max_source_length $source_length \
--max_target_length $target_length \
--beam_size $beam_size \
--eval_batch_size $batch_size 2>&1| tee $output_dir/test.log