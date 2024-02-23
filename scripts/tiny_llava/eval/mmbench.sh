#!/bin/bash

SPLIT="mmbench_dev_20230712"

MODEL_PATH="./checkpoints/tiny-llava-v1-1.1B-clip-vit-large-patch14-336-finetune"
MODEL_NAME="tiny-llava-v1-1.1b"
EVAL_DIR="/root/autodl-tmp/data/eval"

python -m tinyllava.eval.model_vqa_mmbench \
    --model-path $MODEL_PATH \
    --question-file $EVAL_DIR/mmbench/$SPLIT.tsv \
    --answers-file $EVAL_DIR/mmbench/answers/$SPLIT/$MODEL_NAME.jsonl \
    --single-pred-prompt \
    --temperature 0 \
    --conv-mode vicuna_v1

mkdir -p $EVAL_DIR/mmbench/answers_upload/$SPLIT

python scripts/convert_mmbench_for_submission.py \
    --annotation-file $EVAL_DIR/mmbench/$SPLIT.tsv \
    --result-dir $EVAL_DIR/mmbench/answers/$SPLIT \
    --upload-dir $EVAL_DIR/mmbench/answers_upload/$SPLIT \
    --experiment $MODEL_NAME
