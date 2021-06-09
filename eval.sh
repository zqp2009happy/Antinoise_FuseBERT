#!/usr/bin/env bash
#
# Usage: 
# Author: 
pwd_path=`pwd`
true&& {
echo "********************* AntiNgramNoise_FuseBERT_Restoration ***************************"
echo "*** QA10000 ***"
ifile=$pwd_path/test_result/qa10000.a.AntiNgramNoise_FuseBERT_Restoration
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/QA10000.a -l en-zh

echo "*** Hard1000 ***"
ifile=$pwd_path/test_result/hard1000.a.AntiNgramNoise_FuseBERT_Restoration
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/Hard1000.a1 test_set/Hard1000.a2 -l en-zh
}

true&& {
echo "********************* AntiNgramNoise_FuseBERT ***************************"
echo "*** QA10000 ***"
ifile=$pwd_path/test_result/qa10000.a.AntiNgramNoise_FuseBERT
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/QA10000.a -l en-zh

echo "*** Hard1000 ***"
ifile=$pwd_path/test_result/hard1000.a.AntiNgramNoise_FuseBERT
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/Hard1000.a1 test_set/Hard1000.a2 -l en-zh
}

true&& {
echo "********************* AntiNgramNoise ***************************"
echo "*** QA10000 ***"
ifile=$pwd_path/test_result/qa10000.a.AntiNgramNoise
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/QA10000.a -l en-zh

echo "*** Hard1000 ***"
ifile=$pwd_path/test_result/hard1000.a.AntiNgramNoise
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/Hard1000.a1 test_set/Hard1000.a2 -l en-zh
}

true && {
echo "********************* InputNgramNoise ***************************"
echo "*** QA10000 ***"
ifile=$pwd_path/test_result/qa10000.a.InputNgramNoise
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/QA10000.a -l en-zh

echo "*** Hard1000 ***"
ifile=$pwd_path/test_result/hard1000.a.InputNgramNoise
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/Hard1000.a1 test_set/Hard1000.a2 -l en-zh
}

true && {
echo "********************* Transformer ***************************"
echo "*** QA10000 ***"
ifile=$pwd_path/test_result/qa10000.a.Transformer
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/QA10000.a -l en-zh

echo "*** Hard1000 ***"
ifile=$pwd_path/test_result/hard1000.a.Transformer
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/Hard1000.a1 test_set/Hard1000.a2 -l en-zh
}
true && {
echo "********************* InputNoise ***************************"
echo "*** QA10000 ***"
ifile=$pwd_path/test_result/qa10000.a.InputNoise
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/QA10000.a -l en-zh

echo "*** Hard1000 ***"
ifile=$pwd_path/test_result/hard1000.a.InputNoise
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/Hard1000.a1 test_set/Hard1000.a2 -l en-zh
}
true && {
echo "********************* Antinoise ****************************"
echo "*** QA10000 ***"
ifile=$pwd_path/test_result/qa10000.a.Antinoise
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/QA10000.a -l en-zh

echo "*** Hard1000 ***"
ifile=$pwd_path/test_result/hard1000.a.Antinoise
sh distinct.sh ${ifile}

cat ${ifile} | sacrebleu test_set/Hard1000.a1 test_set/Hard1000.a2 -l en-zh
}
true && {
echo "********************* FuseBERT ****************************"
echo "*** QA10000 ***"
ifile=$pwd_path/test_result/qa10000.a.FuseBERT
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/QA10000.a -l en-zh

echo "*** Hard1000 ***"
ifile=$pwd_path/test_result/hard1000.a.FuseBERT
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/Hard1000.a1 test_set/Hard1000.a2 -l en-zh
}

true && {
echo "********************* Antinoise + FuseBERT ****************************"
echo "*** QA10000 ***"
ifile=$pwd_path/test_result/qa10000.a.Antinoise_FuseBERT
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/QA10000.a -l en-zh

echo "*** Hard1000 ***"
ifile=$pwd_path/test_result/hard1000.a.Antinoise_FuseBERT
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/Hard1000.a1 test_set/Hard1000.a2 -l en-zh
}
