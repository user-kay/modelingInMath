from math import cos, sin, atan
import math
import matplotlib.pyplot as plt
import numpy as np
vWind = 25.4
# vCar = 1
A = 2.05 #小车的正交投影面积
m = 1140 #小车的质量
r = 500 #这个数据我瞎编的，表示曲线半径
kcs = 0.034 #小车的风力系数1
kcl = 0.02 #小车的风力系数2
p = 1.2 #空气密度
u = 0.35 #下雨天的摩擦系数
a = 0.02 #横坡的路拱坡度
a1 = 0.03 #纵坡的路拱坡度
g = 9.8 #重力加速度

dataF = [] #表示F
dataR = [] #表示R
dataVcar = [] #表示车速
dataFR = []
datalist = []


for vCar in np.arange(1,50,0.01):
    dataVcar.append(vCar)
    F = (m * vCar * vCar) / r + (p * A * kcs * math.degrees(math.atan((vWind / vCar))) * (vWind * vWind + vCar * vCar)) / 2
    R = u * (m * g * cos(a1) * cos(a) - ( p * A * kcs * math.degrees(math.atan((vWind / vCar))) * (vWind * vWind + vCar * vCar)) / 2) + m * g * cos(a1) * sin(a)
    dataF.append(F)
    dataR.append(R)
    dataFR.append(F/R)
    if((F / R) <= 0.99 and (F / R) >= 0.9):
        # print(vCar)
        # print(F/R)
        datalist.append(vCar)

print('------------------------------')
# print(math.degrees(math.atan((vWind / vCar))))
print(sum(datalist) / len(datalist))
fig, ax1 = plt.subplots()
ax2 = ax1.twinx()
ax1.plot(dataVcar, dataF,'g-')
ax2.plot(dataVcar, dataR,'b-')

ax1.set_xlabel("speed of car")
ax1.set_ylabel("F", color='g')
ax1.set(ylim=[1500,7000])
ax1.set(ylim=[1500,7000])
ax2.set_ylabel("E", color='b')

plt.show()