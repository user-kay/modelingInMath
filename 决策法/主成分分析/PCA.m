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

r = corrcoef(data)  % r = ���ϵ������

[vec1,lamda,rate]=pcacov(r); %PCA��������
%vec1: r����������
%lamda: ��Ӧ������ֵ
%rate: �������ɷֵĹ�����

f=repmat(sign(sum(vec1)),size(vec1,1),1);    %������vec1ͬά����Ԫ��Ϊ��1�ľ���
vec2=vec1.*f;             %�޸����������������ţ�ʹ��ÿ�����������ķ�����Ϊ������Ϊ���յ���������
num = max(find(lamda>1)) %numΪѡȡ�����ɷֵĸ���,����ѡȡ����ֵ����1��
df=data*vec2(:,1:num);    %����������ɷֵĵ÷�
tf=df*rate(1:num)/100   %�����ۺϵ÷�
[stf,ind]=sort(tf,'descend'); %�ѵ÷ְ��մӸߵ��͵Ĵ�������
stf
ind=ind + 2012          %stfΪ�÷ִӸߵ�������indΪ��Ӧ���������

[COEFF,SCORE,latent] = pca(data)

