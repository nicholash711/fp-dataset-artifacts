TASK:=nli
DATASET:=snli
BATCH_SIZE:=8


default=train



train:
ifdef TRAIN_SIZE
	python run.py --do_train --task $(TASK) --dataset $(DATASET) --per_device_train_batch_size $(BATCH_SIZE) --max_train_samples $(TRAIN_SIZE) --output_dir ./trained_model/
else
	python run.py --do_train --task $(TASK) --dataset $(DATASET) --per_device_train_batch_size $(BATCH_SIZE) --output_dir ./trained_model/
endif

eval:
	python run.py --do_eval --task $(TASK) --dataset $(DATASET) --model ./trained_model/ --output_dir ./output/
.PHONY: