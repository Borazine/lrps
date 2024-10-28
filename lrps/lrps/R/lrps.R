##
## Script name: Sample size/Power
##
## Purpose of script: This script computes the sample size/event probability etc needed for a anova like k-group test
## a replicate of J. Lachin's SAS program.
## Author: H. Li
##
## Date Created: 2023-08-22
##
## Email: hyli@ad.unc.edu
##
#' Sample size/Power
#'
#'' @description This main function computes the sample size (N) needed for a k-group log rank test based on parameter inputed.
#'
#' @param alpha numeric Two sided type I error.
#' @param haz vector hazard rate of each group.
#' @param pis vector probability of each group.
#' @param power power of the test as desired.
#' @return returns a list of 3 data frames called values, pds, eds. "values" includes a jumbo of statistics includes:
#' non centrcentrality parameter$chinc=psi^2$, non-centrality factor $ncf=varphi^2$ , Total sample size N, sample size within each group n, total event.
#' "Pds" includes the expected probabilities under alternative hypothesis. "Eds" calculates # of subjects should have the event"
#' @examples
#' Nmain(0.05,c(0.3350577,0.3350577,0.2649026,0.2649026),c(0.0875,0.0875,0.065625,0.065625),0.9986035)
#'@export

Nmain <-function(alpha,pis,haz,power){
  K<-k<-length(haz)#k= #of groups this depends on how many haz was imported
  if (length(haz)!=length(pis))
   {
   return ("Hazard rate and probability rate mismatch")
  }
  ds <-thetas<-eds <-rep(0,k)
  dtot <- 0
  for (j in 1:K)
  {
    ds[j]=  pis[j]/k
    dtot <- dtot + ds[j]
  }
  #degrees of freedom
  df <- k - 1
  chia <- qchisq(1 - alpha, df)
  #chia -- the critical value
  chinc <-
    uniroot(function(x)
      pchisq(chia, df, ncp = x) - (1 - power), c(0, 10000000))$root
  #chinc -- the noncentrality parameter(psi ^2)
  ncf <- thetabar <- totevt<- 0
  for (j in 1:K) {
    thetas[j] = log(haz[j])
    thetabar = thetabar + ds[j] * thetas[j]
  }
  thetabar = thetabar / dtot
  for (j in 1:K) {
    ncf = ncf + ds[j] * (thetas[j] - thetabar) ^ 2
  }

  #ncf, non-centrality factor \varphi^2
  avehaz = exp(thetabar)
  #average hazard rate
  N =round((chinc / ncf),4)
  N=ceiling(N)
  for (j in 1:K) {
    eds[j] <- N * ds[j]
    totevt <- totevt + eds[j]
  }
  ncf=round(ncf,digits=4)
  chinc=round(chinc,digits=4)
  if (N%%k !=0){
    N=N+(k-(N%%k))
  }
  n<-N/k
  results <-data.frame(chinc,ncf,N,n,totevt)
  rpds<-reds<-data.frame(N)
  for (i in 1:K) {
    assign(paste0("pi", i), pis[i])
    rpds[paste0("pi", i)] <- pis[i]
  }

  for (i in 1:K) {
    assign(paste0("ed", i), eds[i])
    reds[paste0("ed", i)] <- eds[i]
  }
  return (list(results,rpds,reds))
}





#'' @description This main function computes Power needed for a k-group log rank test based on parameter inputed under the proportional hazard model.
#'
#' @param alpha numeric Two sided type I error.
#' @param pis vector probability of each group.
#' @param rrs vector hazard ratio of each group.
#' @param N Number of subjects in the study cohort.
#' @return returns a list of 3 dataframes called values, pds, eds. "values" includes a PhsPower and total event.
#' "pis" includes the expected probabilities under alternative hypothesis. "Eds calculates # of subjects should have the event"
#' @examples
#' PowerPHmain(0.05,c(0.335057,0.335057,0.2649026,0.2649026),c(1,1,0.75,0.75),2315)
#' @export

PowerPHmain <-function(alpha,pis,rrs,N){
  K<-k <-length(pis)
  eds<-betas<-rep(0,k)
  df<-k-1
  chia <- qchisq(1 - alpha, df)
  #chia -- the critical value
  totevt<-phsncp <- 0
  for(j in 1:K){
    eds[j] <- N*(1/k)*pis[j]
    totevt <- totevt + eds[j]
    betas[j] <- log(rrs[j])
  }
  for(j in 2:K){
    phsncp <- phsncp + totevt*1/k*(1-(1/k))*(betas[j]^2)
  }
  for(j in 2:(K-1)){
    for(k in (j+1):K){
      phsncp <- phsncp - 2*totevt*(1/k)*(1/k)*betas[j]*betas[k]
    }
  }
  phsPwr <- 1 - pchisq(chia, df, ncp = phsncp, lower.tail = TRUE, log.p = FALSE)

  results <-data.frame(phsPwr,totevt)
  rpds<-reds<-data.frame(phsPwr)
  for (i in 1:K) {
    assign(paste0("pd", i), pis[i])
    rpds[paste0("pd", i)] <- pis[i]
  }

  for (i in 1:K) {
    assign(paste0("ed", i), eds[i])
    reds[paste0("ed", i)] <- eds[i]
  }
  rpds<-round(rpds,digits=4)
  reds<-round(reds,digits=4)
  return (list(results,rpds,reds))
}














#'' @description This main function computes Power needed for a k-group log rank test based on parameter inputed.
#'
#' @param alpha numeric Two sided type I error.
#' @param haz vector hazard rate of each group.
#' @param pis vector probability of each group.
#' @param N Number of subjects in the study cohort.
#' @return returns a list of 3 dataframes called values, pds, eds. "values" includes a jumbo of statistics includes:R,T,
#' non centrcentrality parameter$chinc=psi^2$, non-centrality factor $ncf=varphi^2$ gamma, sample size N, total event.
#' "Pds" includes the expected probabilities under alternative hypothesis. "Eds calculates # of subjects should have the event"
#' @examples
#' Powermain(0.05,c(1,1,0.75,0.75),0.0875,0.04,3,7,-0.27,5000)
#' @export


Powermain <-function(alpha,pis,haz,N){
  if (length(haz)!=length(pis))
  {
    return ("Hazard rate and probability rate mismatch")
  }
  K<-k <-length(haz)
  totevt<-ncp<-thetabar<- 0
  thetas <- eds <-rep(0,k)
  for(j in 1:k){
    eds[j] <- N*(1/k)*pis[j]
  }
  df<-k-1
  chia <- qchisq(1 - alpha, df)
  #chia -- the critical value
  for(j in 1:K){
    totevt <- totevt + eds[j]
    thetas[j] <- log(haz[j])
    thetabar <- thetabar + eds[j]*thetas[j]
  }
  thetabar <- thetabar/totevt
  for(j in 1:K){
    ncp <- ncp + eds[j]*(thetas[j] - thetabar)^2
  }
  #ncp, the non-centrality parameter
  avehaz <- exp(thetabar)
  beta <- pchisq(chia, df, ncp = ncp, lower.tail = TRUE, log.p = FALSE)
  #beta is calculated by chisquare with applied non-centrality parameter with df=k-1
  power <- 1 - beta
  results <-data.frame(power,totevt)
  rpds<-reds<-data.frame(power)
  for (i in 1:K) {
    assign(paste0("pd", i), pis[i])
    rpds[paste0("pd", i)] <- pis[i]
  }

  for (i in 1:K) {
    assign(paste0("ed", i), eds[i])
    reds[paste0("ed", i)] <- eds[i]
  }
  rpds<-round(rpds,digits=4)
  reds<-round(reds,digits=4)
  return (list(results,rpds,reds))
}

#' lrps
#'
#''@description
#''This function This function computes the Power or Sample size of a K group test.
#''This function is derived from section 3 of Lachin's paper - An ANOVA-like Test
#'
#' @param alpha numeric Two sided type I error.
#' @param haz vector hazard rate/ratios of each group.
#' @param pis vector probability of each group.
#' @param NP Number of subjects/power of the test.
#' @return phsPower/Power/N n
#' @examples
#'  lrps(0.05,c(0.335057,0.335057,0.2649026,0.2649026),c(0.0875,0.0875,0.065625,0.065625),5004)
#'  lrps(0.05,c(0.335057,0.335057,0.2649026,0.2649026),c(0.0875,0.0875,0.065625,0.065625),0.9986035)
#'  lrps(0.05,c(0.335057,0.335057,0.2649026,0.2649026),c(1,1,0.75,0.75),5000,Ratio=TRUE)
#' @export
lrps<-function(Alpha,Pis,Haz,NP,Ratio=FALSE){
  alpha<-Alpha
pis<-Pis
if (Ratio)
  {
  result<-PowerPHmain(alpha,pis,Haz,NP)
  return (result[[1]][1])
}
  else if (NP<=1){
    result<-Nmain(alpha,pis,Haz,NP)
    return(result[[1]][3:4])
    }
  else if(NP>1) {
    result<-Powermain(alpha,pis,Haz,NP)
    return (result[[1]][1])
  }
}


