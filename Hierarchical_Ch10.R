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
# MODEL
# For occupancy:
# z_i ~ Bernoulli(phi_i) with logit(phi_i) = B_0 + B_1*vegHt_i
# vegHt as covariate for occupancy

# For detection:
# y_ij | z_i ~ Bernoulli(z_i*p_ij) with logit(p_ij) = a_0 + a_1*wind_ij
# wind as covariate for detection

# Choose sample sizes and prepare obs data array y
set.seed(1)
M <- 100 # Number of sites
J <- 3 # Number of visits/site
y <- matrix(NA, nrow = M, ncol = J) # to contain the obs data

# Create a covariate called vegHt
vegHt <- sort(runif(M, -1, 1)) # Sort for graphical convenience

# Choose parameter values for occupancy model and compute occupancy
beta0 <- 0 # Logit-scale intercept
beta1 <- 3 # Logit-scale slope for vegHt
psi <- plogis(beta0 + beta1*vegHt) # Occupancy prob

# Now visit each site and observe occupancy status PERFECTLY
z <- rbinom(M, 1, psi) # True presence/absence

# Look at data so far
table(z)

# Plot the true system state
par(mfrow = c(1,3), mar = c(5, 5, 2, 2), cex.axis = 1.5, cex.lab = 1.5)
plot(vegHt, z, xlab = "Vegetation height", ylab = "True occupancy state (z)", frame = F, cex = 1.5)
plot(function(x) plogis(beta0 + beta1*x), -1, 1, add = T, lwd = 3, col = "red")
# Models ideal scenario with no false negative measurement errors
# This pretty much never happens.

# Create covariate: wind
wind <- array(runif(M*J, -1, 1), dim = c(M, J))

# Choose parameter values for measurement error model and compute detectability
alpha0 <- -2
alpha1 <- -3

p <- plogis(alpha0 + alpha1*wind) # Detection prob
plot(p ~ wind, ylim = c(0,1))
# No such thing in reality where wind can be negative... always important to consider natural limitations when modeling vars

# Take J = 3 presence/absence measurements (one from each visit/site)
for(j in 1:J){
  y[,j] <- rbinom(M, z, p[,j])
}

# Number of sites with observed presence: 27
sum(apply(y, 1, max))

# Plot observed data and true effect of wind on detection prob
plot(wind, y, xlab = "Wind", ylab = "Observed det/nondetection data (y)", frame = F, cex = 1.5)
plot(function(x) plogis(alpha0 + alpha1*x), -1, 1, add = T, lwd = 3, col = "red")

# Look at the data: occupancy prob for site i, true presence/absence (z), measurements / detection status (y)
cbind(psi = round(psi, 2), z=z, y1 = y[,1], y2 = y[,2], y3 = y[,3])
# High occupancy probability does not equate to high detection probability
# Rather, it is a necessary condition for z = 1 in order for y to ever be = 1, but it does not guarantee it!

# Create factors
time <- matrix(rep(as.character(1:J), M), ncol = J, byrow = T)
hab <- c(rep("A", 33), rep("B", 33), rep("C", 34)) # Must have total = 100 = M

# To fit model in unmarked package, must package data into an unmarked df first
# Format data and summarize
umf <- unmarkedFrameOccu(
  y = y,
  siteCovs = data.frame(vegHt = vegHt, hab = hab), # site-specific covariates
  obsCovs = list(wind = wind, time = time) # obs-specific covariates
)
summary(umf)

# Fit model and extract covariates
# Detection covariates follow first tilde, then occupancy covariates
fm1.occ <- occu(~wind ~vegHt, data = umf)
summary(fm1.occ)

# Predict occupancy and detection as function of covs (with 95% CIs)
# Add truth from data simulation
newdat <- data.frame(vegHt = seq(-1, 1, 0.01))
pred.occ <- predict(fm1.occ, type = "state", newdata = newdat)
newdat <- data.frame(wind = seq(-1, 1, 0.1))
pred.det <- predict(fm1.occ, type = "det", newdata=newdat)

# Predictions for specified values of vegHt: 0.2 and 2.1
newdat <- data.frame(vegHt=c(0.2, 2.1))
predict(fm1.occ, type = "state", newdata = newdat, append = T)

# Fit detection-naive GLM to observed occurrence and plot comparison
fm.glm <- glm(apply(y, 1, max) ~ vegHt, family = binomial)
summary(fm.glm)
plot(vegHt, apply(y, 1, max), xlab = "Vegetation height", ylab = "Observed occurence (ever observed ?)", frame = F, cex = 1.5)
plot(function(x) plogis(beta0 + beta1*x), -1, 1, add = T, lwd = 3, col = "red")
lines(vegHt, predict(fm.glm,,"response"), type = "l", lwd = 3)
lines(vegHt, predict(fm1.occ, type = "state")[,1], col = "blue", lwd = 3)
legend(-1, 0.9, c("Truth", "'LR' with p", "LR without p"), col = c("red", "blue", "black"))

# Random effect z_i: the presence/absence state at each site - estimates represent our best guess of whether a particular site is occupied or not
ranef(fm1.occ)
# These predictions fo the random effects z are called "conditional occupancy probability" - conditional meaning, "given the observed data at that site"
# Can be read as: given that we did not detect the species at site i, what is the probability that the site is actually occupied?
# Result follows form an application of Bayes' rule

# Calculate Pr(z_i = 1 | y_i = 0)
(psi1 <- predict(fm1.occ, type = "state")[1,1])
(p1 <- predict(fm1.occ, type = "det")[c(1:3), 1])
(z1 <- (psi1*prod(1-p1)) / ((1-psi1) + psi1*prod(1-p1)))
# Matches row 1 output from ranef function

# Define function for finite-sample number and proportion of occupied sites
fs.fn <- function(fm){
  Nocc <- sum(ranef(fm)@post[,2,])
  psi.fs <- Nocc / nrow(fm@data@y)
  out <- c(Nocc = Nocc, psi.fs = psi.fs)
  return(out)
}





