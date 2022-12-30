ln -s /aml_output/zhez/tamming_result/ results
ln -s /aml_data/amldata/ aml_data
python main.py --base configs/imagenet_cond_transformer.yaml -t True --gpus 0