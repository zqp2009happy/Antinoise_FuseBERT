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

./test_set/Hard1000: 从日志分析的无效语句中，随机抽取1000条。这个测试集没有人工标注回复语句，主要测试模型对无效语句的处理能力。评测指标为distinct-1、distinct-2 、平均回复句长，以及人工评测。

## 自动评测
```
sh eval.sh
```

## 人工评测
  
./test_result/Hard1000.labels.xlsx : 3位标注人员人工评测多个模型回复 


