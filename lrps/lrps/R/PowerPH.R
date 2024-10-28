## ---------------------------
##
## Script name: Power under Prop hazard model
##
## Purpose of script: This script contains a single function that power under the proportional harzard model.
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
#'This function calculates the power of association for a quantitative covariate under the Proportional Hazard model.
#'This function is derived from section 9 of Lachin's paper: Quantitative Covariate Effects.
#' @param Beg Numeric - The start point of hazard ratio per standard deviation change.
#' @param End Numeric - The end point of hazard ratio per standard deviation change.
#' @param Inc Numeric - Unit of increasing of hazard ratio per standard deviation change.
#' @param Alpha Numeric - Two sided Type I error iff P(H_a|H_0)$
#' @param Sigma Numeric - Standard deviation of the covariate, this is $sigma$ in Lachin's paper.
#' @param Evt Numeric - Number of total events expected for N subjects. This can be calculated by $$sum_{j=1}^K N zeta_j pi_j$$ Whereas $zeta_j$ is sample fraction of subjects assigned to each group. $pi_j$ is the event probability calculated by function Prob.
#' @return This function returns list of each increase per unit of hazard ratio and power.
#' @references Lachin JM. Sample size and power for a logrank test and Cox proportional hazards model with multiple groups and strata, or a quantitative covariate with multiple strata. Stat Med. 2013;32(25):4413-4425. doi:10.1002/sim.5839
#' @author H. Li, E. Kawaguchi
#' @examples
#' PowerPH(1.1,1.4,0.05,0.05,10,1576)
#' @export


PowerPH<-function(Beg,End,Inc,Alpha,Sigma,Evt){
srt<-Beg
end<-End
inc<-Inc
alpha<-Alpha
sd<-Sigma
d<-D<-Evt
v <- sd^2 # variance of covariate
SE <- 1/sqrt(D*v) # SE of the theta-hat
result <- data.frame()
for(hrsd in seq(srt, end, by = inc)){
  HR <- hrsd**(1/sd)
  theta <- log(HR)
  NCPassoc <- (theta / SE)**2
  df <- 1
  chia <- qchisq(1-alpha, df)
  betaassoc <-pchisq(qchisq(1-Alpha, 1), 1, ncp=NCPassoc, lower.tail = TRUE,log.p=FALSE)
  powerassoc <- 1 - betaassoc
  za <- qnorm(0.95)
  ZB <- theta*sd*sqrt(D) - za
  test<-log((hrsd**(1/sd)))**2*sd**2*d
  power <- pnorm(ZB)
  power<-round(power,5)
  powerassoc<-round(powerassoc,5)
  HR<-round(HR,5)
  theta<-round(theta,5)
 result<- rbind(result, data.frame(hrsd = hrsd, powerassoc = powerassoc,HR = HR, theta = theta, NCPassoc = NCPassoc,
                             chia = chia, betaassoc = betaassoc, powerassoc = powerassoc))
}
return(result[1:2])
}
