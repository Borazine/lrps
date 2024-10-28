## ---------------------------
##
## Script name: Power with covariate interaction
##
## Purpose of script: This script contains a single function that computes power of the Cochran's Q test for a K-group test by quantitative covariate interaction
## Author: H. Li, E. Kawaguchi
##
## Date Created: 2024-1-2
##
## Email: hyli@ad.unc.edu
##
## ---------------------------
##
#' PowerPH
#' @description
#'This function calculates the power of the Cochran's Q test for a K-group test by quantitative covariate interaction.
#'This function is derived from section 9 of Lachin's paper: Quantitative Covariate Effects.
#' @param Ratios Numeric - The start point of hazard ratio per standard deviation change.
#' @param Evt Numeric - The end point of hazard ratio per standard deviation change.
#' @param Sigma Numeric - Numeric - Standard deviation $sigma_k$ of the covariate.
#' @param Alpha Numeric - Two sided Type I error $iff P(H_a|H_0)$
#' @return This function returns power of the Cochran's Q test for a K-group test by quantitative covariate interaction.
#' @references Lachin JM. Sample size and power for a logrank test and Cox proportional hazards model with multiple groups and strata, or a quantitative covariate with multiple strata. Stat Med. 2013;32(25):4413-4425. doi:10.1002/sim.5839
#' @author H. Li, E. Kawaguchi
#' @examples
#' PowerInt(c(1.55, 1.45, 1.35, 1.25),394,10,0.05)
#' @export
PowerInt<-function (Ratios,Evt,Sigma,Alpha){
  HRs<-Ratios
  Dk<-Evt
  sdk<-Sigma
  alpha<-Alpha
  k<-Levels<-length(HRs)
Dk <- rep(Dk, Levels)
HRsdk<-HRs
HRk <- HRsdk**(1/sdk)
thetak <- log(HRk)
vk <- sdk**2
SEk <- 1/sqrt(Dk*vk)
Thetas<-SEs <- vector(mode = "numeric", length = Levels)
for (i in 1:k) {
  Thetas[i] <- thetak[i]
  SEs[i] <- SEk[i]
}
HRsdk<-HRsdk[k]
Dk<-Dk[k]
HRk<-HRk[k]
mvle<-tw <-NCPcochran<- 0
for (j in 1:Levels) {
  w <- 1/(SEs[j]^2)
  tw <- tw + w
  mvle <- mvle + w*Thetas[j]
}
mvle<-mvle/tw
SEmvle<-sqrt(1/tw)
HRSD <- exp(mvle*sdk)
HR <- HRSD^(1/sdk)
NCPassoc <- (mvle / SEmvle)^2
df <- 1
chia <- qchisq(1-alpha, df)
powerassoc <- 1 - pchisq(chia, df, NCPassoc)
for (j in 1:Levels) {
  w <- 1/(SEs[j]^2)
  NCPcochran <- NCPcochran + w*(Thetas[j] - mvle)**2
}
df <- Levels - 1
chia <- qchisq(1-alpha, df)
powercochran <-  1 - pchisq(chia, df, ncp=NCPcochran, lower.tail=TRUE, log.p=FALSE)
results<-(data.frame(mvle,SEmvle,HRSD,sdk,HR,NCPassoc,powerassoc,NCPcochran,df,powercochran))
return(results[10])
}




