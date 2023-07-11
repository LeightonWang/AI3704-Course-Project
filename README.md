### AI3704 网络系统与控制课程项目：车队控制 仿真模型

上海交通大学 2022/23 学年网络系统与控制课程大作业 2 的仿真模型部分，从 TrueTime 2.0 的 wireless 示例修改而来。

#### 状态空间
为了能够在仿真时能够直观地体现出领航车与跟随车的运动状况，我们在使用 Simulink 建模时不采用误差及其导数组成的向量 $\mathbf e$ 作为状态空间。我们使用跟随车的运动情况 $\mathbf x$ 构建状态空间，定义为

$$\mathbf x_1=\begin{bmatrix}
x_1 \\ 
\dot x_1 \\
\ddot x_1
\end{bmatrix}$$

从而有状态空间

$$\dot{\mathbf x}_1=\begin{bmatrix}
\dot x_1 \\ 
\ddot x_1 \\
\frac{\rm d}{{\rm d}t}\ddot x_1
\end{bmatrix}=\begin{bmatrix}
0 & 1 & 0 \\
0 & 0 & 1 \\
0 & 0 & -\frac 1\tau
\end{bmatrix} \begin{bmatrix}
x_1 \\ 
\dot x_1 \\
\ddot x_1
\end{bmatrix}+\begin{bmatrix}
0 \\ 
0 \\
\frac 1\tau
\end{bmatrix}
$$

$$u=-K(\mathbf x_0 - \mathbf x_1)$$

其中 $K$ 为状态空间中的控制律参数。
$\mathbf x_0$ 为领航车的状态变量：

$$\mathbf x_0=\begin{bmatrix}
x_1 - D \\ 
\dot x_1 \\
0
\end{bmatrix}$$
