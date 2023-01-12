echo "master_addr:" $MASTER_ADDR
echo "master_port:" $MASTER_PORT
echo "node_rank:" $RANK
echo "world_size" $WORLD_SIZE

CONFIG_NAME=$1
ln -s /aml_output/zhez/tamming_result/ results
ln -s /aml_data/amldata/ aml_data
# python main.py --base $CONFIG_NAME -t True --no-test


python -m torch.distributed.run --nproc_per_node 4 --nnodes=$WORLD_SIZE --master_addr $MASTER_ADDR --master_port $MASTER_PORT --node_rank $RANK main.py --base $CONFIG_NAME -t True --no-test