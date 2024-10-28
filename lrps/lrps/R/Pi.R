## ---------------------------
##
## Script name: Event probability
##
## Purpose of script: This script contains a single function that computes the probability that the event is observed
## Author: H. Li, E. Kawaguchi
##
## Date Created: 2024-1-2
##
## Email: hyli@ad.unc.edu
##
## ---------------------------
##
#' Pi
#'
#'' This function calculates $pi$ - the probability that the event is observed under the exponential model.
#''This function is derived from section 2 of Lachin's paper: Lachin-Foulkes Exponential Model.
#' @param Rct numeric (R) Years of recruitment
#' @param T numeric (T) Total duration of study (includes followup)
#' @param EHR numeric Event Hazard rate
#' @param THR numeric total Hazard rate(Event hazard rate+loss hazard rate)
#' @param G numeric (gamma)The shape parameter for the density function.
#' @param Method String, if Method='Unif' then assume the recruitment is uniform entry, else, a gamma value must be provided.
#' @return This function returns a single value that is the expected probability $pi$
#' @references Lachin JM. Sample size and power for a logrank test and Cox proportional hazards model with multiple groups and strata, or a quantitative covariate with multiple strata. Stat Med. 2013;32(25):4413-4425. doi:10.1002/sim.5839
#' @author H. Li, E. Kawaguchi
#' @examples
#' Pi(1, 7,1.04, 5,-0.27)
#' Pi(1, 7,1.04, 5)
#' @export
Pi <- function(Rct, T, EHR, THR, G=NULL)
  {
  rr<-Rct
  tt<-T
  l<-EHR
  ht<-THR
  g<-G

  if (!is.null(G))
    #check if gamma is provided for non-uniform recruitment
    {
  gm <- l * g * exp(-ht * tt) * (1 - exp((ht - g) * rr))
  ev <- (l / ht) + (gm / ((1 - (exp(-g * rr))) * ht * (ht - g)))
  }
  else if ( is.null(G))
    {
    ev<-((l/ht)*(1-((exp((tt-rr)*(-ht))-exp((-ht*tt)))/(ht*rr))))
  }
  else return('Invalid Method')
  return(ev)
}
