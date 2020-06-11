#!/usr/bin/env bash
#
# Usage: 
# Author: 
pwd_path=`pwd`
true && {
echo "********************* seq2seq+attn ***************************"
echo "*** QA10000 ***"
ifile=$pwd_path/test_result/qa10000.a.seq2seq
sh distinct.sh ${ifile}
cat ${ifile} | sacrebleu test_set/QA10000.a -l en-zh

echo "*** Hard1000 ***"
ifile=$pwd_path/test_result/hard1000.a.seq2seq
sh distinct.sh ${ifile}
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
}
