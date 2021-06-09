#!/usr/bin/env python
# coding: utf-8
#
# Usage: 
# Author: qpz46(ross.zhu@aispeech.com)

import sys
import xlrd
import numpy as np
import pdb

class DPMinEditDistance():
        
    def __init__(self, A, B):          
        self.A = "#" + A#在A和B的头部添加“#”的目的，是占一个位置，用来表示一个“相同的开始”，
        #即二者在最开始的位置是相等的，编辑代价是0，后面在这个基础上累计
        self.B = "#" + B
        self.A_len = len(self.A)
        self.B_len = len(self.B)
        #，用这个值做标记
        self.edit_path_list = []#用来收集所有可行的编辑方案。这里将每个编辑方案看做一个路径。这样有利于后面理解动态规划算法的”状态“
        
        #初始化编辑路径得分矩阵
        self.step_matrix = np.zeros((self.A_len, self.B_len))
        for i in range(self.A_len): self.step_matrix[i,0] = i#这一列相当于将A的字符全部删除
        for i in range(self.B_len): self.step_matrix[0, i] = i#这一列相当于把B的字符串全部、依次添加到A的末尾

    def fit(self):
        chess = [['' for j in list(range(self.B_len))] for i in list(range(self.A_len))]
        for i in range(1,self.A_len):
            for j in range(1, self.B_len):
                self.step_matrix[i, j], chess[i][j] = self.d_i_j(self.step_matrix, i, j)#使用状态更新公式计算到达每一个为指导的代价
        #print(self.step_matrix)
        
        #回溯得到最佳编辑方案
        index_A, index_B = self.A_len-1, self.B_len-1
        best_edit_path = []
        #print("A = {}, B = {}".format(self.A, self.B))
        #print("最小编辑距离是", self.step_matrix[index_A, index_B])
        while index_A>0 and index_B>0:
            if chess[index_A][index_B] in ['rep','keep']: 
                best_edit_path.append(chess[index_A][index_B])
                index_A -= 1
                index_B -= 1
            if chess[index_A][index_B] == 'del':
                best_edit_path.append(chess[index_A][index_B])
                index_A -= 1
            if chess[index_A][index_B] == 'ins':
                best_edit_path.append(chess[index_A][index_B])
                index_B -= 1
        best_edit_path.reverse()
        #pdb.set_trace()
        #print("最佳编辑路径是", best_edit_path)    
        return best_edit_path
    
    #计算到达当前状态的最佳路径，对应的总代价    
    def d_i_j(self, step_matrix, i, j): 
        c1 = step_matrix[i-1, j] + 1
        c2 = step_matrix[i, j-1] + 1
        c3 = step_matrix[i-1, j-1] + 1
        if self.A[i]==self.B[j]:
            c3 = step_matrix[i-1, j-1]
        min_c = min(c1, c2, c3)
        temp = ''
        if c1 == min_c:
            temp = 'del'
        elif c2 == min_c:
            temp = 'ins'
        elif c3 == min_c and self.A[i]==self.B[j]:
            temp = 'keep'
        else:
            temp = 'rep'
        return min_c, temp

data = xlrd.open_workbook('test_result/脱敏日志_噪声标注_uniq_人工转写.xlsx')
table = data.sheets()[0]
nrows = table.nrows
ncols = table.ncols
noise_num = 0 
del_num = 0 
rep_num = 0 
ins_num = 0 
keep_num = 0
word_num = 0
for i in range(1, nrows):
    row_v = [str(table.cell_value(i, j)) for j in range(ncols)]
    if len(row_v) == 6:
        noise_snt = row_v[1].strip()
        denoise_snt = row_v[3].strip()
        label = int(float(row_v[2].strip()))
        if label == 1:
            word_num += len(noise_snt)
            keep_num += len(noise_snt)
        if len(noise_snt) > 0 and len(denoise_snt) > 0:
            vilent_v2 = DPMinEditDistance(denoise_snt, noise_snt)
            diff = vilent_v2.fit()
            for d in diff:
                if d == 'del':
                    del_num += 1
                    noise_num += 1
                elif d == 'rep':
                    rep_num += 1
                    noise_num += 1
                elif d == 'ins':
                    ins_num += 1
                    noise_num += 1
                elif d == 'keep':
                    keep_num += 1
            word_num += len(noise_snt)
print('word_num = {}, noise_num = {}, noise_num/word_num={}, del_num = {}, rep_num = {}, ins_num = {}, keep_num = {}, del_num/noise_num = {}, rep_num/noise_num = {}, ins_num/noise_num = {}'.format(word_num, noise_num, float(noise_num/word_num), del_num, rep_num, ins_num, keep_num, float(del_num/noise_num), float(rep_num/noise_num), float(ins_num/noise_num)))
