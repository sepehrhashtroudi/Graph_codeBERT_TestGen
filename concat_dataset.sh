mkdir ./dataset/combined
a=$(cat ./dataset/evosuit/Evosuit_train.methods | wc -l)
echo $a
head -$a ./dataset/train_final.methods   > ./dataset/combined/train_combined.methods
cat ./dataset/evosuit/Evosuit_train.methods >> ./dataset/combined/train_combined.methods
cat ./dataset/combined/train_combined.methods | wc -l
head -$a ./dataset/train_final.tests   > ./dataset/combined/train_combined.tests
cat ./dataset/evosuit/Evosuit_train.tests >> ./dataset/combined/train_combined.tests
cat ./dataset/combined/train_combined.tests | wc -l

a=$(cat ./dataset/evosuit/Evosuit_test.methods | wc -l)
echo $a
head -$a ./dataset/eval_final.methods   > ./dataset/combined/eval_combined.methods
cat ./dataset/evosuit/Evosuit_test.methods >> ./dataset/combined/eval_combined.methods
cat ./dataset/combined/eval_combined.methods | wc -l
head -$a ./dataset/eval_final.tests   > ./dataset/combined/eval_combined.tests
cat ./dataset/evosuit/Evosuit_test.tests >> ./dataset/combined/eval_combined.tests
cat ./dataset/combined/eval_combined.tests | wc -l



# mkdir ./dataset/small
# a=5000
# echo $a
# head -$a ./dataset/train_final.methods   > ./dataset/small/train_5000.methods
# # cat ./dataset/evosuit/Evosuit_train.methods >> ./dataset/small/train_combined.methods
# # cat ./dataset/small/train_combined.methods | wc -l
# head -$a ./dataset/train.tests   > ./dataset/small/train_5000.tests
# # cat ./dataset/evosuit/Evosuit_train.tests >> ./dataset/small/train_combined.tests
# # cat ./dataset/small/train_combined.tests | wc -l

# a=5000
# echo $a
# head -$a ./dataset/eval.methods   > ./dataset/small/eval_5000.methods
# # cat ./dataset/evosuit/Evosuit_test.methods >> ./dataset/small/eval_combined.methods
# # cat ./dataset/small/eval_combined.methods | wc -l
# head -$a ./dataset/eval.tests   > ./dataset/small/eval_5000.tests
# # cat ./dataset/evosuit/Evosuit_test.tests >> ./dataset/small/eval_combined.tests
# # cat ./dataset/combined/eval_combined.tests | wc -l












