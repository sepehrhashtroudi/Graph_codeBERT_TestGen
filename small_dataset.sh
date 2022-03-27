
mkdir ./dataset/small
a=50
echo $a
# head -$a ./dataset/evosuit/Evosuit_train.methods   > ./dataset/small/train_evo_80.methods
head -$a ./dataset/train_final.methods   > ./dataset/small/train_final_50.methods
# cat ./dataset/evosuit/Evosuit_train.methods >> ./dataset/small/train_combined.methods
# cat ./dataset/small/train_combined.methods | wc -l
# head -$a ./dataset/evosuit/Evosuit_train.tests   > ./dataset/small/train_evo_80.tests
head -$a ./dataset/train_final.tests   > ./dataset/small/train_final_50.tests
# cat ./dataset/evosuit/Evosuit_train.tests >> ./dataset/small/train_combined.tests
# cat ./dataset/small/train_combined.tests | wc -l

a=50
echo $a
# head -$a ./dataset/evosuit/Evosuit_test.methods   > ./dataset/small/eval_evo_80.methods
head -$a ./dataset/eval_final.methods   > ./dataset/small/eval_final_50.methods
# cat ./dataset/evosuit/Evosuit_test.methods >> ./dataset/small/eval_combined.methods
# cat ./dataset/small/eval_combined.methods | wc -l
# head -$a ./dataset/evosuit/Evosuit_test.tests   > ./dataset/small/eval_evo_80.tests
head -$a ./dataset/eval_final.tests   > ./dataset/small/eval_final_50.tests
# cat ./dataset/evosuit/Evosuit_test.tests >> ./dataset/small/eval_combined.tests
# cat ./dataset/combined/eval_combined.tests | wc -l












