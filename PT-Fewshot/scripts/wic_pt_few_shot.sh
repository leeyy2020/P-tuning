alpha=$1
task_name=$2
CUDA_VISIBLE_DEVICES=5 python3 cli.py \
--data_dir ./FewGLUE_32dev/WiC \
--model_type albert \
--model_name_or_path albert-xxlarge-v2 \
--task_name wic \
--output_dir output_dir/wic/alpha_$alpha \
--do_eval \
--do_train \
--pet_per_gpu_eval_batch_size 8 \
--pet_per_gpu_train_batch_size 2 \
--pet_gradient_accumulation_steps 1 \
--pet_max_seq_length 256 \
--pet_max_steps 3500 \
--pattern_ids 1 \
--alpha $alpha

rm -rf output_dir/$task_name/alpha_$alpha/p* output_dir/$task_name/alpha_$alpha/w*