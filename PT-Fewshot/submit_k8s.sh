#!/bin/bash
#encoding=utf8

conf_path=./config.ini

#QUEUE_NAME="nlp-32g-4-cf-yq01-k8s-gpu-v100-8"
QUEUE_NAME="syzn-40g-1-yq01-k8s-gpu-a100-8"
#QUEUE_NAME=nlp-40g-3-yq01-k8s-gpu-a100-8
#QUEUE_NAME="nlp-0-yq01-k8s-gpu-p40-8"
#QUEUE_NAME="nlp-3-yq01-k8s-gpu-p40-8"
# QUEUE_NAME="nlp-32g-13-yq01-k8s-gpu-v100-8"
nodes=1
gpu_cards=1
not_wait=0

job_name=$1
task_name=$2
if [[ ${nodes} -le 1 ]];then
    start_file=./job.sh
else
    start_file=./job_dist.sh
fi
#ak=28dd54f0908e548c81fd9302abf605f9
#sk=ca3861e79a2d52098b19f52abf3a3b2a
ak=4d2c6a826aad5de68c9a883006c9486c
sk=7cf347fbedc0586ea905797d5c1c65b8
# ak=17635bcda14c5adfa6c2458d583457fb
# sk=8b08a400ecad5ede8ea196d5d47362d1


/home/disk1/dqa/quyingqi/tools/software-install/paddlecloud-cli_2/paddlecloud job --ak ${ak} --sk ${sk} train \
    --job-name $job_name \
    --group-name ${QUEUE_NAME} \
    --job-version "paddle-v2.1.0" \
    --k8s-trainers ${nodes} \
    --k8s-gpu-cards ${gpu_cards} \
    --job-tags "qp_dureader" \
    --job-remark "" \
    --is-standalone $((nodes <= 1 ? 1:0)) \
    --is-auto-over-sell ${not_wait} \
    --k8s-priority high \
    --wall-time ${walltime:-"00:00:00"} \
    --file-dir "." \
    --skip-config-check \
    --start-cmd "sh ${start_file} $task_name" \
    --job-conf ${conf_path}