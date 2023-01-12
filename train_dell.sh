echo "master_addr:" $MASTER_ADDR
echo "master_port:" $MASTER_PORT
echo "node_rank:" $RANK
echo "node_num" $AZUREML_NODE_COUNT
((GPU_NUM=4))
((WORLD_SIZE=AZUREML_NODE_COUNT*GPU_NUM))
# echo "world_size" ((REAL_WORLD_SIZE=WORLD_SIZE/4))


CONFIG_NAME=$1
ln -s /aml_output/zhez/tamming_result/ results
ln -s /aml_data/amldata/ aml_data
# python main.py --base $CONFIG_NAME -t True --no-test
python -m torch.distributed.run --nproc_per_node $GPU_NUM --nnodes=$AZUREML_NODE_COUNT --master_addr $MASTER_ADDR --master_port $MASTER_PORT --node_rank $RANK main.py --base $CONFIG_NAME -t True --no-test