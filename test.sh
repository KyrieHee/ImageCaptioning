# Directory containing preprocessed MSCOCO data.
MSCOCO_DIR="yourpath/im2txt/data/mscoco"

# Inception v3 checkpoint file.
INCEPTION_CHECKPOINT="yourpath/im2txt/data/inception_v3.ckpt"

# Directory to save the model.
MODEL_DIR="yourpath/im2txt/model"

# Build the model.
cd im2txt
bazel build -c opt //im2txt/...

# Run the training script.
bazel-bin/im2txt/train \
  --input_file_pattern="${MSCOCO_DIR}/train2014" \
  --inception_checkpoint_file="${INCEPTION_CHECKPOINT}" \
  --train_dir="${MODEL_DIR}/train" \
  --train_inception=false \
  --number_of_steps=1000000



cd yourpath/im2txt/
    
CHECKPOINT_PATH="yourpath/im2txt/model/train/newmodel.ckpt-2000000"
    
IMAGE_FILE="yourpath/im2txt/data/mscoco/val2014/COCO_val2014_000000224477.jpg"
    
bazel build -c opt ./im2txt/run_inference
    
export CUDA_VISIBLE_DEVICES=""
    
VOCAB_FILE="yourpath/im2txt/data/mscoco/word_counts.txt"

bazel-bin/im2txt/run_inference   --checkpoint_path=${CHECKPOINT_PATH}   --vocab_file=${VOCAB_FILE}   --input_files=${IMAGE_FILE}

IMAGE_FILE="yourpath/im2txt/data/mscoco/val2014/COCO_val2014_000000000283.jpg"

bazel-bin/im2txt/run_inference   --checkpoint_path=${CHECKPOINT_PATH}   --vocab_file=${VOCAB_FILE}   --input_files=${IMAGE_FILE