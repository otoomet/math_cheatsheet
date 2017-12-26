taylorLikelihood <- function(n, lambdas, Rs, O=1, kappa=1e-9) {
   ## compute
   ## O   How many simulations of R to include to the profile
   sll <- foreach(R = Rs, .combine=rbind) %do% {
      rRes <- foreach(lambda = lambdas, .combine = rbind) %dopar% {
         set.seed(4)
         simLogL <- foreach(i = 1:O, .combine=sum) %do% {
            xx <- rpois(R, lambda)
            sPr <- tabulate(1 + xx, nbins=max(n) + 1)/R
                           # simulated probability values
            sum(log(sPr[1 + n] + kappa))
         }
         simLogL <- simLogL/O
         pp <- dpois(n, lambda)
         P0 <- (1 - pp)^R
         P1 <- 1 - P0
         T0 <- sum(P0)*log(kappa) + sum(P1*dpois(n, lambda, log=TRUE))
         T2 <- T0 - sum(P1*1/2/pp^2 * pp*(1 - pp)/R)
         T3 <- T2 + sum(P1*1/3/pp^3 * pp*(1 - pp)*(1 - 2*pp)/R^2)
         T4 <- T3 - sum(P1*1/4/pp^4 * pp*(1 - pp)*(1 - 3*pp + 3*pp^2)/R^3)
         T5 <- T4 + sum(P1*1/5/pp^5 * pp*(1 - pp)*(1 - 2*pp)*(1 - 2*pp + 2*pp^2)/R^4)
         T6 <- T5 - sum(P1*1/6/pp^6 * pp*(1 - pp)*(1 - 5*pp + 10*pp^2 - 10*pp^3 + 5*pp^4)/R^5)
         data.frame(simLogL=simLogL, T2=T2, T3=T3, T4=T4, T5=T5, T6=T6,
                    trueLogL = sum(dpois(n, lambda, log=TRUE)))
      }
      cbind(lambda=lambdas, R=R, rRes)
   }
   sll
}
