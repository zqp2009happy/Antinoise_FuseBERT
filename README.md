# NLPCC 2020 -- 开域对话系统的抗噪回复生成模型 

## required
python3 

sacrebleu==1.1.7
```
pip3 install sacrebleu==1.1.7
```

## 测试数据
./test_set/QA10000.q: 通顺问句。

./test_set/QA10000.a: 根据QA10000.q，人工标注回复。

./test_set/Hard1000: 从日志分析的噪声语句中，随机抽取1000条。

./test_set/Hard1000.a1: 人工标注回复1 

./test_set/Hard1000.a2: 人工标注回复2 

## 噪声分布
```
python3 ./scripts/analysis_noise_distribute.py 
```

## 自动评测
```
sh eval.sh
```

## 噪声测试集人工纠正以及模型结果汇总
  
./test_result/Hard1000.labels.xlsx 


