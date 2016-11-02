---
layout: post
title: "行列式的应用-一个简单的例子"
---
学习行列式一直没有发现它如何使用，如何使得复杂的计算变得简单，反而觉得它本身的计算比较复杂而一直没有多大的学习兴趣，但是当我昨天做物理作业的时候我发现了行列式在解决一些问题上面的简洁性。
今天我们举一个简单的例子来看看（作业中的一个关于角动量的简单的题目）：

>习题4-1 质量为1.0kg的质点沿着由 $\textbf{r}=2t^3\textbf{i}+(t^4-3t^3)\textbf{j}$ 决定的曲线运动，其中t是时间，单位为s，r的单位为m.求此质点在 t=1.0s 时所受的相对坐标原点的 $\textbf{O}$ 的力矩.

$$\textbf{r}(1)=2\textbf{i}+(-2)\textbf{j}$$

$$\textbf{a}=\frac{d^{2}\textbf{r}}{dt^{2}}=12t\textbf{i}+(12t^2-18t)\textbf{j}$$

$$\textbf{a}(1)=12\textbf{i}+(-6)\textbf{j}$$

$$\therefore \textbf{F}(1)=m\textbf{a}(1)=12\textbf{i}+(-6)\textbf{j}$$

$$即 \textbf{M}=\textbf{F}\times\textbf{r}$$

这里当然可以用常规的方法来计算$(12\textbf{i}-6\textbf{j})\times(2\textbf{i}-2\textbf{j})$,不过要先求得模和夹角度。但是如若我们用行列是来求解问题就变得相对简单：

$$
\mathbf{M} =  \begin{vmatrix} \mathbf{i} &\mathbf{j} &\mathbf{k} \\
12 &  -6 & 0 \\
2 &  -2 & 0 \end{vmatrix}
$$

由行列式的一些性质显而易见答案为$-12\textbf{k}$.
