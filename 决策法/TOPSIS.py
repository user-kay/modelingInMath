# -*- coding: utf-8 -*-
"""
Function:TOPSIS(理想解法)
WeChat Official Account:数据小白的进阶之路
Author:fightingbob(王京)
Date:2020.08.31
"""


def TOPSIS(path, index, weight, postive):
    import pandas as pd
    import numpy as np

    data = pd.read_excel(path, index_col=index)
    A = data.values

    B = np.zeros(A.shape)
    for i in range(0, A.shape[1]):
        B[:, i] = A[:, i] / np.linalg.norm(A[:, i])

    w = np.array(weight)

    C = B * w.T

    Cstar = C.max(axis=0)

    for i in postive:
        Cstar[i] = C[:, i].min()

    C0 = C.min(axis=0)

    for i in postive:
        C0[i] = C[:, i].max()

    Sstar = np.zeros((1, C.shape[0]))
    S0 = np.zeros((1, C.shape[0]))
    for i in range(0, C.shape[0]):
        Sstar[:, i] = np.linalg.norm(C[i, :] - Cstar)
        S0[:, i] = np.linalg.norm(C[i, :] - C0)

    f = S0 / (S0 + Sstar)

    ind = data.index.values
    result = np.insert(f.T, 0, values=ind, axis=1)

    return pd.DataFrame(result[np.lexsort(-result.T)], columns=['对象', '得分'])


TOPSIS(path = "C:\\Users\\Lenovo\\Desktop\\TOPSIS\\Graduate.xlsx", index = 0, weight = [0.2, 0.3, 0.4, 0.1], postive = [3])
