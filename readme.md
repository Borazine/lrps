---
title: "L(og)R(ank)P(ower)S(ample Size)"
author: "H. Li; E. Kawaguchi"
date: "`r Sys.Date()`"
output:
  rmarkdown::pdf: default
  rmarkdown::html_vignette: default
vignette: "%\\VignetteIndexEntry{LRPS} %\\VignetteEngine{knitr::rmarkdown} %\\rmarkdown.html_vignette.check_title
  = FALSE %\\VignetteEncoding{UTF-8} \n"
---

```{r setup, include = FALSE}
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>")
  source(file.path("../R", "Pi.R"))
  source(file.path("../R", "lrps.R"))
  source(file.path("../R", "PowerPh.R"))
  source(file.path("../R", "PowerInt.R"))
```

## Use this package

This package contains 4 functions for LogRank test adapted from John Lachin's paper. They are:

-   `Pi(Rct, T, EHR, THR, G=NULL)`

-   `lrps(Alpha,Pis,Haz,NP,Ratio=FALSE)`

-   `PowerPH(Beg,End,Inc,Alpha,Sigma,Evt)`

-   `PowerInt(Ratios,Evt,Sigma,Alpha)`

## Pi

### Description

This function calculates $\pi$ - the probability that the event is observed under the exponential model.

This function is derived from section 2 of Lachin's paper: Lachin-Foulkes Exponential Model.

### Usage

Execute `Prob(Rct, T, EHR, THR, G=)`

### Parameters

#### Rct

numeric - Recruitment in years - corresponds to R in Lachin's article.

#### T

numeric - Length of study in years - corresponds to T in Lachin's article.

#### EHR

numeric - Event Hazard rate - corresponds to $\lambda$ in Lachin's article.

#### THR

numeric - Total Hazard rate(Event hazard rate+loss hazard rate) this corresponds to $\lambda+\eta$ in Lachin's article.

#### G - Optional

numeric - Shape parameter based on recruitment rate. This corresponds to $\gamma$ value in Lachin's paper.

Note: If `G=NULL`, then recruitment is defaulted to uniform entry.

### Example

```{r}
Pi(1, 7,1.04, 5,-0.27)
Pi(1, 7,1.04, 5)
```

This example illustrates a study with a total 7 years of duration, 1 year of recruitment with an event hazard rate of 1.04, a total hazard rate of 7 and a gamma value calculated by 40-60 recruitment distribution between first and second half of the study of -0.127 yields an event probability of 0.149.

We see a gamma correction factor -0.27 is small and does not make significant difference in event probability.

### Workflow

This function executes the following calculation to output the event probability.$\pi$.

For a uniform recruitment:

$$
\pi=\frac{\lambda}{\lambda+\eta} \left[ 1-\frac{e^{(-\lambda+\eta)(T-R)}-e^{-(\lambda+\eta)T}}{R(\lambda+\eta)}\right]
$$

And in context of this function:

$$
\pi=\frac{EHR}{THR} \left[ 1-\frac{e^{(-THR)(T-Rct)}-e^{-(THR)T}}{Rct(THR)}\right]
$$

For a non-uniform recruitment with provided

$$
\pi=\frac{\lambda}{\lambda+\eta}+\left[\frac{\lambda\gamma e^{-(\lambda+\eta)T}[1-e^{(\lambda+\eta-\gamma)R}]}{\lambda+\eta(\lambda+\eta-\gamma)(1-e^{-\gamma R})}\right] 
$$

and in the context of this function:

$$
\pi=\frac{EHR}{THR}+\left[\frac{EHR\cdot G \cdot e^{-EHR\cdot T}[1-e^{(THR-G)Rct}]}{THR(THR-g)(1-e^{-G\cdot Rct})}\right]
$$

## lrps

### Description

This function computes the Power or Sample size of a K group test.

This function is derived from section 3 of Lachin's paper - An ANOVA-like Test

### Usage

Execute `lrps(Alpha,Pis,Haz,NP,Ratio=)`

### Parameters

#### Alpha

Numeric - Two sided type I error $\iff P(H_1(\theta_1\not=\theta_j \text{ for some 1} \le j \le K)|H_0(\theta_1=\ldots=\theta_j))$

#### Pis

Vector - Event probability.

The probability of event occurring as calculated by function `Pi`. This corresponds to $\pi$ in Lachin's paper.

Example:

`c(0.335057,0.335057,0.2649026,0.2649026)`

#### Haz

Vector - Hazard rate or Hazard Ratio

Example of Hazard rate:

`c(0.0875,0.0875,0.065625,0.065625)`

Example of Hazard ratio:

`c(1,1,0.75,0.75)`

#### NP

Numeric - The known value - either the sample size (N) or Power (P). The function automatically detects.

Example of power `NP=0.9`

Example of Sample size (N) `NP=5000`

#### Ratio - Optional

Boolean - Default value `FALSE` Indicates `Haz` should be treated as Hazard Rates.

Note: If Ratio is set to `TRUE`, `Haz` is treated like Hazard Ratios.

### Example

```{r}
lrps(0.05,c(0.335057,0.335057,0.2649026,0.2649026),c(0.0875,0.0875,0.065625,0.065625),0.90)
lrps(0.05,c(0.335057,0.335057,0.2649026,0.2649026),c(0.0875,0.0875,0.065625,0.065625),2315)
lrps(0.05,c(0.335057,0.335057,0.2649026,0.2649026),c(1,1,0.75,0.75),2315,Ratio=TRUE)
```

This example demonstrates a 7 year study with 3 years of recruitment period, assume the type I error is 0.05, group 3 and 4 are superior treatments and have $\frac{3}{4}$ of the hazard rate than group 1 and 2 with a reference hazard rate of 0.0875. We assume the loss-of-followup rate is 0.04. The shape parameter is -0.27 (calculated based on a 40-60 recruitment distribution between first and second half of the study). To calculate sample size needed for a power of 0.9, then the output is 2316 total subjects with 579 subjects in each group. And indeed, the power for the same study with 2316 subjects is 0.9.

### Workflow

The `lrps` is a dummy function that calls the function

-   `Nmain(alpha,pis,haz,power)` (NP $\mapsto$ Power) and calculates Sample Size

    or

-   `Powermain(alpha,pis,haz,N)` (NP $\mapsto$ Sample Size) and calculates power under log hazard rate model.

    or

-   `PowerPHmain(alpha,pis,rrs,N)`(NP $\mapsto$ Sample Size) and calculates Power under proportional hazard model.

Using this flow chart:

$$
 \text{lrps}\begin {cases} \text{lrps($\ldots$,Ratios=FALSE, NP)}\mapsto \begin{cases} \text{Nmain($\ldots$,Power=NP)} &\text{ NP}\le 1\\ \phantom{m} \\ \text{Powermain($\ldots$,N=NP)}&\text{ Otherwise} \end{cases} \\
\hfill  \\
\hfill\\
\text{lrps($\ldots$,Ratios=TRUE, NP)}
\mapsto
\text{PowerPHmain (}\ldots,\text{N=NP)}
\end{cases}
$$

In this case, the function recognizes that power are always below 1 and sample size are always above 1.

#### Calculation of Sample Size `N`

When the last parameter `NP` $\le 1$. `lrps` will assume the parameter `NP` is Power and computes sample size by calling function `Nmain` .

`Nmain` first calculates the *minimum variance linear estimator* *(* $\hat{\theta}$ ):

$$
\hat{\theta}=\frac{\sum_{j=1}^K D_j\hat{\theta_j}}{\sum_{j=1}^K D_j}
$$

where as `K=length(Pis)`. $D_j$=$\pi_j \frac{1}{k}=$ `Pis[j]` $\cdot \frac{1}{k}$ and $\hat{\theta}_j$ is the log of the hazard rate = $\log$(`haz[j])`.

The Non-Centrality Parameter value $\psi^2$ for the non-central $\chi^2$ distribution on a `k-1` degrees of freedom (df) is:

$\psi^2 =$`uniroot(function(x) pchisq(qchisq(1 - Alpha, df), df, ncp = x) - (1 - power), c(0, 10000000))$root`

Then, `Nmain` calculates the non-centrality factor $\varphi^2$

$$\varphi^2 = \sum_{j=1}^K D_j(\hat{\theta}_j-\hat{\theta})^2$$

Finally the sample size `N` is calculated by:

$$
N=\frac{\psi^2}{\varphi^2}
$$

#### Calculation of Power using log hazard rates

When the last parameter NP $> 1$ `lrps` will assume the parameter is Sample size and computes Power by calling function `Powermain`

`Powermain` first calculates the *minimum variance linear estimator (* $\hat{\theta}$ *):*

$$ \hat{\theta}=\frac{\sum_{j=1}^K E(D_j)\hat{\theta_j}}{\sum_{j=1}^K E(D_j)} $$

whereas `K=length(pis)`. The expected event $E(D_j)$=$\frac{N}{K}\pi_j$.

And $\pi_j$ denote the event probability `Pi[j]` calculated by the function `Pi` and $\hat{\theta}_j$ is the log of the hazard rate = $\log$(`haz[j]`).

`Powermain` then calculates the Non-Centrality Parameter $\psi^2$

$$
\psi^2=\sum_{j=1}^K E(D_j)(\hat{\theta}_j-\hat{\theta})^2
$$

Finally the power is calculated by 1- $\chi^2$ distribution with k-1 degrees of freedom (`df`) and $\psi^2$ as the Non-Centrality Parameter.

$$
\text{Power}=1-\beta
$$

whereas $\beta$ = `pchisq(qchisq(1 - alpha, df) , df, ncp = ncp, lower.tail = TRUE, log.p = FALSE)`

#### Calculation of Power using log hazard ratios

When the variable `ratios` is set to be true, `lrps` will assume `NP` is sample size (N) and call function `PowerPHmain` using proportional hazard model.

`PowerPHmain` first Calculate the expected number of events `Eds` for each group: `Eds` $= N \cdot \frac{1}{k} \cdot \text{pis[j]} \quad$

Then the total number of expect event `totevt` is calculated by $\sum_{j=1}^{K} eds_j$

The non-centrality parameter (NCP) $\psi^2$ is calculated by:

$$
 \text{phsncp} = \sum_{j=2}^{K} \left( \text{totevt} \cdot \frac{1}{k} \cdot \left(1 -
 \frac{1}{k}\right) \cdot \beta_j^2 \right) - \sum_{j=2}^{K-1} 
\sum_{k=j+1}^{K} \left( 2 \cdot \text{totevt} \cdot \frac{1}{k} \cdot 
\frac{1}{k} \cdot \beta_j \cdot \beta_k \right) 
$$

where $\beta_j$ is log of hazard ratios `Haz[j]`.

Finally the power is calculated by 1- $\chi^2$ distribution with k-1 degrees of freedom (`df`).

$$ \text{phspower}=1-\beta $$

whereas $\beta$ = `pchisq(qchisq(1 - alpha, df) , df, ncp = phsncp, lower.tail = TRUE, log.p = FALSE)`

## PowerPH

### Description

This function calculates the power of association for a quantitative covariate under the Proportional Hazard model.

This function is derived from section 9 of Lachin's paper: *Quantitative Covariate Effects*.

### Usage

execute `PowerPH(Beg,End,Inc,Alpha,Sigma,Evt)`

### Parameters

#### Beg

Numeric - The start point of hazard ratio per standard deviation change.

#### End

Numeric - The end point of hazard ratio per standard deviation change.

#### Inc

Numeric - Unit of increasing of hazard ratio per standard deviation change.

#### Alpha

Numeric - Two sided Type I error $\iff P(H_1|H_0)$

#### Sigma

Numeric - Standard deviation of the covariate, this is $\sigma$ in Lachin's paper.

#### Evt

Numeric - Number of total events expected for N subjects. This can be calculated by $$\sum_{j=1}^K N \zeta_j\pi_j$$ Whereas $\zeta_j$ is sample fraction of subjects assigned to each group. $\pi_j$ is the event probability calculated by function `Prob`.

### Example

```{r}
PowerPH(1.1,1.4,0.05,0.05,10,1576)

```

This example illustrates the calculation of power of association for each 0.05 increases from 1.1 to 1.4 per standard deviation change in covariate hazard ratio with 1576 expected events within the group and standard 0.05 significance level.

We see that the HR per standard deviation change of 1.1 yield a power of 0.96 and 1.4 yield a power of almost 1.

### Workflow

For each iteration of $\text{HR}_{\text{SD}} \in [\text{srt,end}] \text{ by inc}$ ,`PowerPH` performs the following to output a `powerassoc`.

`PowerPH` first calculates the Non-centrality parameter of the test $\psi^2$ :

$$
\psi^2=(\frac{\theta}{\text{std. error}})^2
$$

Whereas $\theta$ is the Log of each $\text{HR}_{\text{SD}}$.

In `PowerPH` $\psi^2$ is calculated by:

$$
\psi^2=\log{({\text{HR}_{\text{SD}}}}^{\frac{1}{\sigma}})^2\cdot D \cdot \sigma^2 
$$

The type II error $\beta$ is calculated by:

$\beta=$ `pchisq(qchisq(1-Alpha, 1), 1, ncp=NCPassoc, lower.tail = TRUE,log.p=FALSE)`. Whereas `NCPassoc` is $\psi^2$.

Finally, power is calculated by:

$$
\text{Power=1-}\beta
$$

## PowerInt

### Description

This function calculates the power of the Cochran's Q test for a K-group test by quantitative covariate interaction.

This function is derived from section 9 of Lachin's paper: *Quantitative Covariate Effects.*

### Usage

Execute `PowerInt(Ratios,Evt,Sigma,Alpha)`

### Parameters

#### Ratios

Vector - Hazard ratio coefficient values.

#### Evt

Numeric - Expected number of event for each group. This can be calculated by $$N \zeta_j\pi_j$$ where as $\zeta_j$ is sample fraction of subjects assigned to each group, $\pi_j$ is the event probability calculated by function `Prob` .

#### Sigma

Numeric - Standard deviation $\sigma_k$ of the covariate.

#### Alpha

Numeric - Two sided type I error $\iff P(H_1|H_0)$.

### Example

```{r}
PowerInt(c(1.55, 1.45, 1.35, 1.25),394,10,0.05)
```

This example illustrates 4 covariate hazard ratio coefficients of 1.55,1.45,1.35,1.25 with each group having expected 394 events with standard significance level of 0.05 and standard deviation of 10 yields a power of only 0.76 to detect those difference in hazard ratios.

### Workflow

`PowerInt` First calculates the *Minimum Variance Linear Estimator (MVLE)* of the common coefficient among group $\hat{\beta}$.

$$\hat{\beta}=\frac{\sum_{j=1}^K D_j\sigma_j^2\hat{\beta_j}}{\sum_{j=1}^K D_j\sigma_j^2}$$ Whereas $D_j$ is `Evt` , the expected event among each group, $\sigma_j$ is `sd` ,the standard deviation of covariate and $\hat{\beta}_j$ is the Log of the hazard ratio per unit increase in covariate which is $\log({\text{HRs}^\text{sdk}})$ .

`PowrInt` Then calculates the non centrality factor $\psi^2$ of the test of the hypothesis of homogeneity of the covariate effects among groups.

$$
\psi^2=\sum_{j=1}^{K-1}D_j\sigma^2_j (\hat{\beta}-\hat{\beta}_j) 
$$

The notations of this equation and equivalent parameters are the same as the notation of the MVLE as shown above.

Finally the Type II Error $\beta$ is calculated by `pchisq(qchisq(1-alpha, df), df, ncp=NCPcochran, lower.tail=TRUE, log.p=FALSE)`. Whereas `df` is the degrees of freedom k-1 and NCPcochran is $\psi$.

The power is calculated by

$$
\text{Power=1-}\beta
$$

## Further reading and References

1: Lachin JM. Sample size and power for a logrank test and Cox proportional hazards model with multiple groups and strata, or a quantitative covariate with multiple strata. *Stat Med*. 2013;32(25):4413-4425. <doi:10.1002/sim.5839> 2: Lachin JM, Foulkes MA. Evaluation of sample size and power for analyses of survival with allowance for nonuniform patient entry, losses to follow-up, noncompliance, and stratification. Biometrics. 1986;42(3):507-519.
