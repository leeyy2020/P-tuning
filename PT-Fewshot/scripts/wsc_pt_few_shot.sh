alpha=$1
gpu=$2
task_name=wsc
CUDA_VISIBLE_DEVICES=$gpu python3 cli.py \
--data_dir ./FewGLUE_32dev/WSC \
--model_type albert \
--model_name_or_path albert-xxlarge-v2 \
--task_name wsc \
--output_dir output_dir/wsc/alpha_$alpha \
--do_eval \
--do_train \
--pet_per_gpu_eval_batch_size 1 \
--pet_per_gpu_train_batch_size 16 \
--pet_gradient_accumulation_steps 1 \
--pet_max_seq_length 128 \
--pet_max_steps 1500 \
--pattern_ids 2 \
--learning_rate 1e-4 \
--pet_repetitions 3 \
--alpha $alpha

rm -rf output_dir/$task_name/alpha_$alpha/p* output_dir/$task_name/alpha_$alpha/w*
