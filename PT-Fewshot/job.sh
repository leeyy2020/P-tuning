#!/bin/bash
task_name=$1
echo "==============JOB BEGIN============"

# /home/HGCP_Program/software-install/openmpi-1.8.5/bin/mpirun sh run.sh
./set_up.sh &> set_up.log

#echo "install paddlepaddle_gpu-0.0.0-cp27-cp27mu-linux_x86_64.whl"
##PYDIR="python2.7_paddle_1.6.1"
#/usr/bin/python3 -m pip uninstall -y paddlepaddle-gpu
#/usr/bin/python3 -m pip uninstall -y paddlepaddle-cpu
#
#/usr/bin/python3 -m pip install paddlepaddle_gpu-0.0.0-cp37-cp37m-linux_x86_64.whl
#echo "install paddlepaddle_gpu-0.0.0-cp37-cp37m-linux_x86_64.whl whl success.."
#/usr/bin/python3 -c "import paddle; print('paddle version: ' + paddle.__version__)"
#/usr/bin/python3 -c "import paddle; print('paddle commit: ' + paddle.__git_commit__)"

echo "===============SETUP DONE=========="

./run_train.sh $task_name
echo "===============JOB END============="