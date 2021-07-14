%% Using PCA to calculate seven criteria to get the comprehensive test score 
%criteria:
%   Labor Force Participation population with bachelor's degree or higher between age 25 and 64(%)
%   Proportion of GDP on higher education expenditures(%)
%   Higher education graduation rate(%)
%   Proportion of population with bachelor's degree or higher aged 25 and over(%)
%   The number of World top awards winners
%   Number of papers published in the field of natural sciences

clc;
clear;
data = [
91.8000	2.5200	99.9170	12.8370	0	427265;
91.6000	2.6100	99.2840	13.8750	0.1	432216;
91	2.4700	99.1160	14.0110	0.5	422808
];

%% realize PCA

data = zscore(data);

r = corrcoef(data)  % r = 相关系数矩阵

[vec1,lamda,rate]=pcacov(r); %PCA分析函数
%vec1: r的特征向量
%lamda: 对应的特征值
%rate: 各个主成分的贡献率

f=repmat(sign(sum(vec1)),size(vec1,1),1);    %构造与vec1同维数的元素为±1的矩阵
vec2=vec1.*f;             %修改特征向量的正负号，使得每个特征向量的分量和为正，即为最终的特征向量
num = max(find(lamda>1)) %num为选取的主成分的个数,这里选取特征值大于1的
df=data*vec2(:,1:num);    %计算各个主成分的得分
tf=df*rate(1:num)/100   %计算综合得分
[stf,ind]=sort(tf,'descend'); %把得分按照从高到低的次序排列
stf
ind=ind + 2012          %stf为得分从高到低排序，ind为对应的样本编号

[COEFF,SCORE,latent] = pca(data)

