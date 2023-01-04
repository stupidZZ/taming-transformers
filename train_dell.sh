CONFIG_NAME=$1
ln -s /aml_output/zhez/tamming_result/ results
ln -s /aml_data/amldata/ aml_data
python main.py --base $CONFIG_NAME -t True --no-test