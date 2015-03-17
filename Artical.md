### 多元线性回归在设定TOS规格反包灯标线的运用 ###

Sheldon

---

生产中有经验公式，反包灯标线=  PU/2-(PA-PU)/2  经过验证，就算加上1.5的回归常数，也是没有办法通过t检验的。
所以有没有一种更加精确的模型呢?

将无关的列向量删除，只保留pu，pa，bt，ut四列
	

对其做主成分分析

	>conomy.pr<- princomp(formula = ~pa+pu+ut+bt,data = data,cor = TRUE)
	
	>summary(conomy.pr,loading=TRUE)
	Importance of components:
	                          Comp.1    Comp.2     Comp.3     Comp.4
	Standard deviation     1.8477741 0.6812837 0.28416680 0.20207093
	Proportion of Variance 0.8535673 0.1160369 0.02018769 0.01020817
	Cumulative Proportion  0.8535673 0.9696041 0.98979183 1.00000000
	
	Loadings:
	   Comp.1 Comp.2 Comp.3 Comp.4
	pa  0.521  0.262  0.579  0.570
	pu  0.522  0.305  0.160 -0.780
	ut  0.523  0.170 -0.796  0.253
	bt  0.427 -0.900          

pa，pu，ut的方差累积贡献百分率达到了0.98979183，如图1所示，根据此，我们排除了bt周长的影响。用log（）对数据进行平稳化，最终选择了如下模型

反包灯标线=exp(3.2819822-0.0052771*PA + 0.0113477 *PU)

对其进行检验：

> ##### summary(lm(data = data,formula = log(actually)~pa+pu)) #####

	Call:
	lm(formula = log(actually) ~ pa + pu, data = data)
	
	Residuals:
	      Min        1Q    Median        3Q       Max 
	-0.226279 -0.030616 -0.003949  0.038177  0.176274 
	
	Coefficients:
	              Estimate Std. Error t value Pr(>|t|)    
	(Intercept)  3.2819822  0.1478684  22.195  < 2e-16 ***
	pa          -0.0052771  0.0006542  -8.067 9.31e-10 ***
	pu           0.0113477  0.0011125  10.200 1.96e-12 ***
	---
	Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
	
	Residual standard error: 0.05999 on 38 degrees of freedom
	Multiple R-squared:  0.7818,	Adjusted R-squared:  0.7704 
	F-statistic: 68.09 on 2 and 38 DF,  p-value: 2.733e-13

最近几次实测中多次命中，具有可行性。

