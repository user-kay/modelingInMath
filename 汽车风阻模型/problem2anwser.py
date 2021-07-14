import matplotlib.pyplot as plt

weatherLevel = [4, 5, 6, 7, 8, 9]
# dataCar = [36.6 , 34.16,31.95, 29.33, 25.95, 21.38] #小汽车的数据

dataCar = [38.57, 37.53, 36.32, 35.65, 33.18, 31.11 ] #客车的数据


plt.rcParams['font.sans-serif']=['SimHei'] #用来正常显示中文标签
plt.plot( weatherLevel, dataCar,ls = 'solid')
plt.ylabel('小汽车最大安全速度')
plt.xlabel('台风级数')
plt.grid()
plt.show()
