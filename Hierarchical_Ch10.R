# Chapter 10 of Hierarcichal Modeling in Ecology

library(tidyverse)
library(unmarked)
library(jagsUI)
library(rjags)

set.seed(24)

## 10.1
alpha <- seq(-10, 10, by = 1)

curve(plogis(-10 + 1*x), -2, 2, lwd = 3, ylim = c(0, 1), xlab = "Covariate")

# 21 logistic regression lines with "slope" 1 but varying intercepts
for(i in 2:21)
{ curve(plogis(alpha[i] + 1 * x), -2, 2, lwd = 3, add = T) }
(min <- (plogis(-10 + 1 * 2) - plogis(-10 + 1 * -2)) )
(max <- (plogis(0 + 1 * -2) - plogis(0 + 1 * -2)) )
# shows lack of usefulness of models where we can only estimate slope but not the intercept (as is the case in presence-only data)

## 10.3 - Simple site-occupancy model
## FREQUENTIST APPROACH
# Choose sample sizes and prepare observed data array y
M <- 100
J <- 2
y <- matrix(NA, nrow = M, ncol = J) # Prep matrix to contain the observation data

# Parameter values
psi <- 0.8
p <- 0.5

# Generate presence / absence data (THE TRUTH)
z <- rbinom(n = M, size = 1, prob = psi) # R has no Bernoulli

# Generate detection/nondetection data (presence absence measurements)
for(j in 1:J){
  y[,j] <- rbinom(n = M, size = 1, prob = z*p)
}

# Look at data
sum(z) # species occupies 86 sites

sum(apply(y, 1, max)) # we detect species at 61 sites

# Inspect data
head(cbind(z = z, y1 = y[,1], y2 = y[,2]))
# sites 1-5 have occupancy, site 6 does not
# only site 6 has no detection for both visits 1 and 2

# Analyze data using unmarked package
# Use function occu, where linear model for detection is specified before that of occupancy
umf <- unmarkedFrameOccu(y = y) # Create unmarked data frame
summary(umf) # Summarize df

fm1 <- occu(~1 ~1, data = umf) # Fit site-occupancy model
fm1

backTransform(fm1, "state") # Get estimates on probability scale
backTransform(fm1, "det")

## 10.3
## BAYESIAN APPROACH
# Bundle data and summarize data bundle
str(win.data <- list(y=y, M = nrow(y), J = ncol(y)))

# Specify model in BUGS
sink("model.txt")
cat(
  "
  model {
  # Priors
    psi ~ dunif(0, 1)
    p ~ dunif(0, 1)
    # Likelihood
    for (i in 1: M) { # Loop over sites
    z[i] ~ dbern(psi) # State model
    for (j in 1:J) { # Loop over replicate surveys
      y[i,j] ~ dbern(z[i]*p) # Observarion model (only JAGS!)
    }
    }
    }
  ", fill = T
)
sink()

#Initial values
zst <- apply(y, 1, max) # Avoid data/model/inits conflict
inits <- function(){list(z = zst)}

# Parameters monitored
params <- c("psi", "p")

# MCMC settings
ni <- 5000 ; nt <- 1 ; nb <- 1000 ; nc <- 3

# Call JAGS and summarize posteriors
fm2 <- jags(win.data, inits, params, "model.txt", n.chains = nc,
            n.thin = nt, n.iter = ni, n.burnin = nb)
print(fm2, dig = 3)
# Results very similar to those from MLE - an even larger sample would yield even closer results

# Typically we will not use this model, as it contains no covariates and is an intercept-only model
# The following exercise takes us through a more realistic and complex model, which includes covariates

## 10.4 - Realistic site-occupancy model






