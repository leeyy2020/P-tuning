
# for task_name in boolq multirc rte wic wsc
for task_name in boolq
do
    for alpha in 0 0.1 0.3 0.5 0.7 1
    do
        ./scripts/${task_name}_pt_few_shot.sh $alpha $task_name &> ${task_name}.log 
    done
done