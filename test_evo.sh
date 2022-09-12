#!/bin/bash
#SBATCH --gres=gpu:4       # Request GPU "generic resources"
#SBATCH --cpus-per-task=10  # Refer to cluster's documentation for the right CPU/GPU ratio
#SBATCH --mem=100000M       # Memory proportional to GPUs: 32000 Cedar, 47000 Béluga, 64000 Graham.
#SBATCH --time=3-03:00     # DD-HH:MM:SS

source ./Env/bin/activate
source ./ENV/bin/activate


source=methods
target=tests
lr=1e-4
beam_size=10
source_length=510
target_length=240
batch_size=64
output_dir=saved_models/dec_6_evosuite_last_3_data_contex_graphcodebert_510_240/$source-$target/
test_file=dataset/evosuit/Evosuit_small.$source,dataset/evosuit/Evosuit_small.$target
# test_file=dataset/evosuit/Evosuit_test_lang3.$source,dataset/evosuit/Evosuit_test_lang3.$target
# test_file=dataset/combined/eval_combined.$source,dataset/combined/eval_combined.$target
# test_file=dataset/small/eval_evo_80.$source,dataset/small/eval_evo_80.$target

# test_file=dataset/combined/Evosuit_train.$source,dataset/combined/Evosuit_train.$target
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
--test_filename $test_file \
--output_dir $output_dir \
--max_source_length $source_length \
--max_target_length $target_length \
--beam_size $beam_size \
--cal_blue 1 \
--eval_batch_size $batch_size 2>&1| tee $output_dir/test.log