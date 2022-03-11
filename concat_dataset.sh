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















