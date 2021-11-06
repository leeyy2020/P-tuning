task_name=$1
for alpha in 0.1 0.3 0.5 0.7 1
do
    ./scripts/${task_name}_pt_few_shot.sh $alpha $task_name
done