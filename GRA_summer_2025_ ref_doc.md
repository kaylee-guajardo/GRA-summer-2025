Kaylee Guajardo Sullivan  
GRA: Week 1  
May 20, 2025

Reference Document

Notes in yellow correspond to my questions/thoughts/things relevant to Writing Project (WP)

*Key definitions in ecological statistics*

**Ch. 1: Applied Hierarchical Modeling in Ecology**

* Abundance  
  * The number of points per spatial unit  
  * Poisson distribution  
* Occurrence  
  * Presence vs absence of a given species  
  * Bernoulli distribution  
* Species richness  
  * The sum of occurring species  
* Meta-population designs  
  * Type of study design where distribution, abundance, and related demographic quantities are studied at a collection of spatial replicates  
  * Used to study the dynamics of a population, distribution, or richness  
* Distribution  
  * Possible area where a species theoretically could be present

**Ch. 1.1: Occupancy Estimation and Modeling**

* Hypothesis  
  * A plausible explanation about how a part of the world works  
* Theory  
  * A hypothesis that has withstood repeated efforts to falsify it, assuming we have faith in the efficacy of the efforts to do so  
  * Can always be disproved; never proven  
* Model  
  * An abstraction of a real-world system, which can be used to describe or predict how a system may respond to changes  
  * Three types:  
1) Conceptual model: set of ideas about how a system of interest works (may include one or more hypotheses about said system)  
2) Verbal model: translating conceptual models into words  
3) Mathematical model: translating conceptual models into a set of mathematical equations; competing hypothesis become competing models

*General notes from assigned reading*

**Ch. 1: Background & Concepts (Occupancy Estimation and Modeling)**  
**1.2 Sampling Animal Population and Communities**

* Many existing programs are not as useful as they could be due to poorly defined research questions / objectives  
  * Particularly evident in large-scale monitoring programs  
  * Feels like a tricky line between wanting to keep research questions broad enough to adjust to an evolving understanding and incapsulate sub hypotheses, but risk lacking measurable objectives  
* Three basic questions must be addressed during the design of animal sampling programs: WHY, WHAT, and HOW?  
* WHY?  
  * Efforts usually associated with one of two classes of endeavor: science, or conservation/management, or both  
    * Science: a process used to discriminate competing hypotheses, usually using mathematical models \- primary purpose is to project consequences of hypotheses and deduce predictions about system behavior  
    * Conservation/Management: estimates of state variables play three roles:  
1. To make state-dependent management decisions  
2. To evaluate the extent of meeting management objectives  
3. To develop a model thought to be predictive of system responses to management actions  
* Issues with trend detection: often leads to reactionary / retrospective management and conservation practices. It is easier for us to determine what we WANT to happen in the future rather than trying to respond/reverse what we DID NOT want to happen in the past  
* Rather than use uncertainty as an excuse to do nothing, we can incorporate uncertainty into the decision making process  
* WHAT?  
  * The selection of which state variables to monitor depends largely on the why question and the competing hypotheses  
  * With single species, the most commonly used state variable is abundance \= population size (ie how many?)  
    * Often focused on changes in abundance, like between two successive years, to model growth rate  
    * Relevant covariates include: birth rate, death rate, and movement in / out of a population  
  * Another useful state variables is occupancy \= the proportion of area, patches or sample units that is occupied by a species  
    * Generally require less effort than abundance studies; viewed as a surrogate for abundance  
    * Rare species can be impossible to model abundance, but can model occupancy  
    * Incidence functions relate patch occupancy to patch characteristics, such as size, distance to mainland or source of immigration, habitat, etc.   
      * Butterfly writing project focus?  
    * Occupancy is used as the natural state variable in studies of distribution and range of a species \- useful in studying invasive species and disease dynamics  
    * Patch occupancy dynamics \= the rate of change in occupancy over time  
    * Basic multivariate state variable of community ecology is species abundance distribution  
      * Species richness \= number of species present in a given community (metric for biodiversity)  
        * Rates of local species extinction and colonization are vital rates for change  
* HOW?  
  * Proper estimation of state variables and inferences over time and space require attention to: 1\) spatial variation, and 2\) detectability  
    * Spatial variation addressed through a sample of locations that are chosen based on the study objectives, and that permit inference about locations NOT surveyed (presumably via randomization?)  
      * Sampling methods that allow for inference about sites not sampled include:  
        * Simple random sampling  
        * Unequal probability sampling  
        * Stratified random sampling  
        * Systematic sampling  
        * Cluster sampling  
        * Double sampling  
        * Various kinds of adaptive sampling  
    * Detectability \= the reality that we may not detect a species even though it is present  
      * Abundance example  
        * Expected value of the count statistic \= (the true number of animals in an area) x (detection probability)  
        * Estimation of the true number of animals in an area requires an estimation of detection probability as well  
      * Offset of observer is often included in count data to account for differences in observer detection abilities  
        * Not wise to use this approach in habitat data, as habitat would be expected to i**nfluence both detection probability and animal abundance**  
        * Thus, **controlling for habitat effects by incorporating them into analyses as covariates affecting detection ONLY is not appropriate**  
    * Indices (indicator function) often thought to be relatively assumption free  
      * This is FALSE \- all assumptions used to estimate abundance must be true, plus the assumption that a constant fraction of the population is counted each survey  
        * Unlikely to be true, so have limited use in good monitoring programs  
    * HUGE issue lies in the fact that detection probabilities are usually less than 1, so we therefore must estimate them  
    * IMPORTANT THEME: robust inference about occupancy and related dynamics can only be made by explicitly accounting for detection probability\!\!\!\!  
      

**1.3 Inference about Dynamics and Causation**

* Focus is often on the ability for a model to predict outcomes of management decisions (ie if we do XXX, the population is expected to change by YYY)  
* Three major methods to generate system dynamics in ecology:  
  * True manipulative experiments  
    * Strongest strength of inference (causal)  
    * Characterized by replication, randomized assignment of treatment factors to EUs, use of a control group  
    * Replication necessary to estimate variation  
    * Challenging to implement  
  * Constrained designs / quasi experiments  
    * Mid strength of inference  
    * Restraints on characteristics of a true manipulative experiment (lack of either random assignment or replication) is a quasi experiment  
  * Observational studies  
    * No manipulation   
    * Consists of *a priori* OR *a posterior* hypotheses  
      * A priori proposes hypotheses prior to data collection \- DO THIS  
        * Study should be guided by this, with exploratory retrospective analyses possibly used as a means of hypothesis generation  
      * A posterior propose hypothesis after data collection \- NOT THIS  
        * issue is this is unlikely to yield ‘reliable knowledge’ since there will be multiple a posterior hypotheses that provide reasonable explanations (“the number of rational hypotheses that can explain any given phenomenon is infinite” \- Pirsig  
        * State variables are estimated (and thus not observed) and have high likelihood for large sampling bias and/or variance. Therefore, temporal variation in point estimates is NOT equal to temporal variation in the true population.  
        * Stochastic (random) nature of nature  
          * Loaded coin analogy and flipping it once, then asking oneself to estimate the probability of flipping heads  
        * General difficulties with correlation analysis for temporal data, as two things may be naturally changing over time but have no functional relationship with each other  
        * Weak inference overall, so should not be conducted (pg 17-18)  
    * Weakest strength of inference (associative)  
* Adaptive management: applies to state-level management, incorporates learning about system response to management actions  
  * Probabilities associated with degrees of confidence in the various system models are updated based on the distance between estimated system state and the predictions of the competing model (sounds intrinsically Bayesian to me)  
* Macroecology \= emphasis on statistical pattern analysis rather than experimental manipulation  
  * Local extinction and colonization are better indicators of one habitat being preferred over another, NOT just higher abundance of a species in a given habitat  
  * Incidence functions: model occupancy (presence/absence) as a function of characteristics of the sampled locations or patches  
  * Strong debate in the late 70s-80s over inferences based on observed data patterns  
* Suggested conclusions about drawing inference  
  * 1\) inferences about system dynamics should be based on estimates and observations of those dynamics whenever possible  
  * 2\) a priori hypotheses should be used in observational studies, ALWAYS

**Ch. 2: Occupancy Applications (Occupancy Estimation and Modeling)**

* 2.1 In occupancy, sampling units consist of the space(s) sample from to determine their occupancy status (detected/not detected) (space examples: 50x50 plot, a pond)  
  * If arbitrary, should be defined by the research question at hand  
* Probability of occupancy: an a priori expectation that a unit will be occupied by a given species  
* Proportion of area occupied: a realization  of the probability of occupancy process  
  * Ex: probability of flipping heads is 50/50, while proportion of 20 coin tosses may be 12/20 heads  
  * Can use proportion to estimate probability over time/replications  
* Occupancy sampling methods  
  * Basic version is to determine whether species is present or absent, either through actually seeing one or finding evidence of species presence (ie scat, prints)  
  * False absences / false zeros \= no detection of species occupancy when there indeed is occupancy  
* Within species groups, species with large ranges tend to be abundant throughout those ranges, while species with small ranges tend to be less abundant  
  * I’m sure when a species is being intensely impacted by factors such as climate change, this dynamic can fall apart  
* Magnitude of bias is a function of sampling intensity  
* Static models span one year/season only, while dynamic models span at least a few  
* Occupancy inference using presence-only data require two key assumptions (among others):  
  * Random / representative sampling \= must sample space randomly or in a way that is unbiased (often neglected in presence-only data collection)  
  * Covariates influencing species detection probabilities do not also influence true species distribution (also seldom to be met)  
  * As a result, the methods described in the book are based largely on the assumed absence of these assumptions  
    * Which can be used to make species distribution maps  
* More precise estimates of occupancy will often be obtained by surveying fewer units with a sufficient number of repeat surveys, rather than the flip  
* 2.2 Habitat relationships and resource selection  
  * Realized vs fundamental/potential niche: habitat that a species actually occupies vs habitat with all the necessary factors for a species to be present  
  * Ecologists are often interested in modeling presence/absence as a function of habitat characteristics/resources  
  * Logistic regression yields biased estimates, as it does not account for false negatives  
    * Sensitive to even LOW levels of nondetection  
    * Bias even greater when detection probabilities are related to habitat variables of interests  
    * Simple logistic regression models only where a species was found (combo of occupancy and detectability) not solely where it is (occupancy)  
      * Hence why we use zero-inflated models, ex: presence vs absence modeled by bernoulli, positive counts by poisson/neg binomial  
* 2.3 Metapopulation dynamics  
* Metapopulation \= subdivided populations connected by some degree of movement  
  * Emphasis on patch occupancy, local rates of extinction and colonization  
  * Single season data inferences  
    * Extinction threshold, by finding the proportion of patches that are suitable for a species, we know that if a system has patch suitability lower than the threshold, it is doomed for extinction  
  * Multiple-season data inferences  
* 2.5 multi-species occupancy  
  * Can investigate whether two species are independent or not  
  * Recurring emphasis of needing to define detection probabilities a priori to data collection  
    * WP to investigate biasedness of using a priori detection probabilities vs not?  
  * A large number of multi-species occupancy studies have investigated statitical issues of interactions between species, but very little to not detecting a species that is present  
  * Deducing process from observations of pattern are inherently challenging  
  * Multi-species occupancy data collected over multiple seasons can be used to draw inferences about rates of extinction and colonization in the absence of any hypothesis about interspecific interactions  
  * Guild hypotheses: null is that species belong to a guild (parallel temporal changes) vs alternative that it is not (differing temporal changes)

**Ch. 4: Basic Presence / Absence Situation (Occupancy Estimation and Modeling)**

* 4.1 sampling situation  
  * May be interested in estimating:  
    * Proportion of area inhabited by a species  
    * Probability the species is present in a sampling area  
  * Random sample of sampling units allows for inference to greater population of sampling units  
  * Essentially IMPOSSIBLE to confirm whether a species is absent (false negative phenomenon)  
  * Scheme: s sampling units from S sampling unit population, surveyed K times for a target species  
  * Methods for detection: visual, auditory, indirect (through signs/evidence)  
  * Revisit section 6.2 for addressing false positives (via misidentification) in Section 6.2 for WP  
  * Revisit section 4.4.6 to relax assumption that sampling units are either occupied or unoccupied during the surveying period for WP  
  * Assumptions: no false positives (detection when really species was not present), sampling units are either occupied or unoccupied during entirety of survey period   
  * “Sampling season” or just “season”: a suitable timeframe during which the sampling units (areas) are CLOSED to changes in occupancy state (ie either are occupied or unoccupied during the length of the sampling period)  
  * Two processes underlying this situation:  
    * Occupancy (ie is the species occupying the sampling area?) \- primary variable of interest  
    * Detectability (ie how hard is the species to find?) \- considered a nuisance parameter, also known as the probability of detection  
* 4.2 Estimation of occupancy if probability of detection is \<1 or known without error  
  * Probability of being occupied, denoted   
  * Number of units occupied by target species x in a random sample of s units will follow Binomial distribution  
    * E(x) \= s   
    * Var(x) \= s  (1 \- )  
    * Estimate when species is detected perfectly:  hat \= x / s  
    * If covariates included for estimating presence/absence, use standard logistic regression  
  * Probability of detecting species in a single survey of an occupied unit, denoted p, known value exactly (ie no associated sampling error)  
    * Probability of detecting the species at least once after K surveys of the unit is p\* \= 1-(1-p)^K  
    * Number of units where species is detected also follows Binomial distribution  
    * Variance of the probability that a species is present AND detected at a site has two additive components  
      * First component \= from binomial variation associated with the true underlying value of   
      * Second component \= from imperfect detection of a species  
      * Note: variance of occupancy estimator can NEVER be smaller than the binomial variation term  
  * Typically, detection and occupancy probabilities will be unknown and will need to be estimated  
* 4.3 two-step *ad hoc* approaches (two classes)  
  * Geissler-Fuller Method  
    * Uses a Horvitz/Thompson based estimate of the occupancy probability  
      *  hat \= (i \= 1swi/p\* hat) / s  
      * Where wi is an indicator function, 1 if species observed, 0 otherwise  
    * Actual estimator should be the median or mean value obtained a large number of non-parametric bootstraps  
    * Standard error for estimators approximated from non-parametric bootstrap procedure  
    * Key assumptions:   
      * probability of detecting the species at a unit is constant for ALL surveys, across ALL sampling units  
      * detection probability doesn’t change after the observation of an individual of the species  
  * Azuma-Baldwin-Noon Method  
    * Similar to above, in that s sampling units are monitored for presence/absence of a species with up to K repeat surveys of each unit  
    * **Once sampling unit is found to be occupied (positive detection), sampling unit is not surveyed again**  
      * Called a removal study design (since sampling units are “removed” after detection)  
    * Assumed constant probability of detecting a species (given presence), denoted p  
    * Model number of surveys required to detect a species (Y) as a truncated geometric distribution (see pg 121 for formula)  
    * Azuma suggests a MOM based estimator for p, equating it to sample mean & solving for p  
  * Nichols-Karanth Method  
    * More general approach to estimating proportion of area occupancy, applicable to large-scale monitoring  
    * Short-coming: no constraints on the value x hat, the estimated number of individuals in a population that were never captured, so estimated number of occupied units could be greater than number of sampling units surveyed, implying that   \> 1 ( \= disregard for range of probability parameter)  
* 4.4 Model-Based Approach (**USE THIS\!**)  
  * Alternative to the *ad hoc* estimation methods described in 4.3 (above)  
  * Models the probability of the observed outcomes resulting from the stochastic biological & sampling process  
    * Allows estimation of occupancy and detection parameters simultaneously  
    * Allows for direct means to investigate potential relationship between probabilities of occupancy and detection AND factors like habitat type or weather conditions at time of survey  
      * Permits comparison of competing hypotheses about the system  
    * Enables unequal survey efforts at different sampling units, so highly flexible design in nature  
  * 4.4.1 Building a model  
    * Consists of: 1\) take a set of hypotheses to create a conceptual model about the system, 2\) construct a verbal model based on first step, 3\) translate verbal model into set of mathematical equations which can be used to estimate parameters of interest  
    * Based on conceptual model that there is a biological and sampling (observation) process occuring that affects whether a species is detected  
      * Biological component: unit is either occupied (with probability ) or unoccupied (probability 1 \- ) by species  
        * Presence / absence random variable denoted as z\_i, with probability of presence : z\_i \~ Bernoulli ()  
      * Sampling component: Conditional on the unit being occupied, then each survey (j) has a probability of an observer detecting the species (p) or not detecting the species (1 \- p)  
        * Z\_i considered latent random variable since not directly observable  
        * Detection / non-detection of species, denoted h\_ij:   
          h\_ij | z\_i \~ Bernoulli(z\_i p\_j)  
    * **Assumption: occupancy status does not change between surveys \= closure of unit to changes in occupancy state)**  
      * Can be relaxed  
    * Two approaches/way where model likelihood can be developed for parameter estimation:  
      * Observed data likelihood  
        * Estimates probability of detection (given occupancy probability) using the pattern of observed data (detection or nondetection) at a given site for K surveys (see pg 127 for formula)  
        * Estimates probability of nondetection (given occupancy probability)  
        * Addition of these two terms permits accounting for both scenarios; known as integration of latent variable  
        * Model likelihood formula on pg 128  
      * Complete data likelihood  
        * Constructed assuming that the value of latent variable z\_i is known (naturally untrue)  
        * Consists of formulas for probability of detection given occupancy, probability of nondetection given occupancy, and probability of nondetection given lack of occupancy  
        * Likelihood consists of: probability of species being present at each surveyed unit, and probability of observed detection data given true occupancy status at each unit  
        * Or, one component that contains occupancy probabilities, one that contains detection probabilities  
        * Latent variable z\_i must be estimated using MCMC algorithms or similar (likelihood alone insufficient) \[use OpenBUGS or JAGS software\]  
      * Assumptions:   
        * Occupancy state doesn’t change during survey period  
        * Probability of occupancy equal across all units  
        * Probability of detecting species given presence is equal across all units  
        * Detection of species in each survey of unit is independent of detections during other surveys of the unit (anticipated challenge to address for GNP data)  
        * Detection histories observed at each location are independent  
        * No species misidentification resulting in false absences (anticipated challenge to address for GNP data)  
      * These assumptions can be relaxed under certain conditions though\!\!  
  * 4.4.2-3 Estimation, Constant Detection Probability Model  
    * Focus here is frequentist approach to estimating parameters using MLE  
      * ie take first derivative of likelihood (or log-likelihood) w respect to parameter, set equal to zero, solve for parameter estimate (pg 131\)  
    * Likelihood theory suggests that the asymptotic variance for occupancy probability can be obtained by inverting the information matrix  
  * 4.4.4 Survey-specific detection probability model  
    * Also uses MLE  
    * Equations on pg 133  
  * 4.4.5 Probability of occupancy given species not detected at unit  
    * Uses Bayes Theorem of conditional probabilities  
    * Pg 133 for equation breakdown using Bayes Thm  
  * 4.4.6 Blue Ridge Salamander example  
    * Includes frequentist MLE approach and Bayesian MCMC approach for parameter estimation  
  * 4.4.7 Missing Observations  
    * Assumption that detection probabilities are consistent across units only makes sense when units are surveyed at the same time (or relatively short time frame)  
      * Yes within a site for GNP data, questionable for between sites (surveyed on different days)  
    * Given this, can think about days where one sit was surveyed but another was not as missing data for the day of the non surveyed site  
      * **So equal sampling efforts not required across all sampling units**  
      * Ask Katie about potential to use this for GNP data  
  * 4.4.8 Covariate modeling  
    * Often not able to assume that detection and occupancy probabilities are equal and consistent across all units  
      * \= heterogenous probabilities  
      * May vary based on other factors at play (weather conditions, habitat of site, coverage level)  
      * Can use appropriate link function to include these as covariates  
        * Parallels generalized logistic regression techniques  
        * Logit() \= linear combination of covariates  
    * Allows for large range of different models to be investigated  
      * This, in combination with ability to account for missing observations, provides overall superior structure compared to *ad hoc* methods  
  * 4.4.9 Violations of model assumptions  
    * Occupancy status doesn’t change for a unit over a season (units ‘closed’ to changes in occupancy) \-\> Violation of Closure  
      * Estimates of abundance for site biased high when individuals exhibit random movement in and out of study area, but accurate for total number of individuals in superpopulation surrounding study area  
      * Occupancy estimator becomes probability a unit is USED by target species  
      * Pg 147 details impact of sampling unit distance from each other  
      * Generally difficult to address; best move is to have researchers use their knowledge about phenology of target species and design the study to try and minimize violations in the closure assumption  
        * Closure is species-level, NOT individual-level; as long as at least one individual is present in the unit at any given time, then the closure assumption is “met”  
    * Prob of occupancy is constant across all units OR differences modeled using covariates \-\> Heterogeneity of Occupancy Probability  
      * The impacts of of unmodeled variation in occupancy probability among units are rather unknown compared to other model assumptions  
        * More simulation studies needed \- WP? Ehh, see below  
      * Challenging to consider a real life scenario where occupancy probabilities differ but detection probabilities are equivalent across units…  
      * Inferences less reliable if an important covariate is missed  
    * Prob of detection is constant across all units & surveys OR is a function of unit-survey covariates (no unmodeled heterogeneity in detection probs) \-\> Heterogeneity of Detection Probability  
      * Violation can produce negatively biased occupancy estimates  
        * Lots of existing research on this using closed-population capture-recapture studies  
      * Good to try to mitigate using study design & including as many   
      * Roye and Nichols (2003) suspect differences in local abundance at sampling units may constitute for the greatest differences in probability of detection  
    * Detection of species and histories at each location are indep. \-\> Lack of Independence  
      * Independence assumption only relates to the observations from the units, not independence of the units themselves  
        * So, even if units are nearby and display a high degree of spatial correlation, this is not necessarily a violation of indep  
        * Thus, it is perfectly valid to have the same individual using multiple sample units (good to know for WP)  
        * Can happen when call survey are spaced to closely together and thus the same vocalization event spans multiple surveys  
      * Violating independence at unit-level looks like:  
        * When multiple units are being surveyed simultaneously and similar detection events are consistently registered across the multiple units  
        * When units are not selected from the population independently of one another (this might be an issue for GNP data plots in a site)  
          * Seen in clustering of sites  
          * True level of uncertainty in the occupancy estimate will be larger than indicated by the reported standard error  
        * Both cases can be seen as forms of overdispersion  
          * Could be adjusted based upon a variance inflation factor (VIF)  
      * BIG TAKEAWAY: deviations from statistical ideals in the name of logistical convenience will have repercussions on the required analyses (ie increased complexity) and resulting inferences  
    * Species are correctly identified (no false positives) \[anticipated challenge for WP\] \-\> Species misidentification  
      * Biases occupancy probability high  
      * Even low rates of false positives may induce substantial bias  
      * Reiterate major takeaway: always try to minimize assumption violations via proper study design  
  * 4.4.10 Assessing model fit  
    * Note that model selection methods (ie AIC, BIC) may choose a best model, but not a GOOD model  
    * Many ecological studies have too small of sample size to detect poor model fit (ie tests for model fit may have too low of power)  
      * Can lead to false confidence that a model is adequate when really it is lacking information  
      * No solution; only suggestion is it may be appropriate tp use larger Type I error rates than typically used  
    * For many models used by ecologists, no adequate methods for assessing fit have been developed  
      * Ex: no tests for lack of fit for vast majority of mark-recapture models, particularly when individual covariates are used  
      * Best ‘test’ of model fit is to compare predictions from the model with an independent data set  
    * MacKenzie and Bailey (2004) developed a method to assess fit of single-season occupancy models (pg 157-159)  
    * If Bayesian methods used, check model fit using Bayesian p-values and posterior predictive checks  
      * Bayesian p-value calculated as the proportion of times the selected summary statistic calculated for the generated data is greater than the value calculated from the observed data  
  * 4.4.11 Diagnostic Plots  
    * ALSO lacking for assessing model fit for all occupancy models, including single-season  
    * Notable exception uses Dunn-Smyth residuals: based on CDF of standard normal variable and the observed variable x\_i  
      * Intent is to be able to produce residual plots that are analogous to those used in standard linear regression problems  
      * (More detail on pgs 163\)  
    * Or CUSUM method (pg 164, helpful figure on 165\)  
* Several examples related to Ch 4 (pg 170-202)

**Ch. 7: Modeling Heterogenous Detection Probs (Occupancy Estimation and Modeling)**

* Abundance-induced heterogeneity: occupancy easier to detect when abundance is high, harder when abundance is low  
  * Most important when sampled populations are small (eg \< 10\)  
  * Diminish in importance as average population size becomes larger, in which assuming constant probability may be sufficient  
* Not accounting for heterogeneity of detection probability for sites will lead to biased estimates of occupancy  
* Existing models suppose that p detection probability varies by individual i in a site  
* This is getting into N mixture modeling, which Katie asked that I skip for now \- eventually circle back to

**Notes on best practices from good enough computing paper**

* Best practices cover:  
  * Data management  
    * Saving raw and intermediate forms  
    * Documenting all steps  
    * Creating tidy data amenable to analysis  
  * Programming / software  
    * Writing, organizing, sharing scripts used in analysis  
  * Collaborating with colleagues  
    * Make it easy for existing and new collaborators to understand and contribute to a project  
  * Organizing projects  
    * Organizing digital artifacts of a project to ease discovery and understanding  
  * Tracking work	  
    * Record how various components change over time  
  * Writing manuscripts  
    * Doing so in a way that leaves an audit trail and minimizes manual merging of conflict  
* Data management  
  * Recommendation to work towards ready-to-analyze data incrementally, documenting the process and the intermediate data  
    * Save the raw data, including the process used to receive it and details around it (download date, official version number, etc)  
    * Create the data you wish you received  
      * Use CSV for data  
      * Rename variables to be easily decipherable  
      * Replace artificial codes for missing data (ie replace false 0s with NA)  
    * Create analysis friendly data  
      * Make sure each column is a variable  
      * Make each row an observation  
    * Record all steps used to process and tidy the data  
      * Use script files for this  
* Software   
  * Provide brief explanatory comments at the start of every program  
  * Give functions and variables meaningful names  
* Collaboration  
  * Create an overview of your project  
    * Have a short file in projects home directory that explains the purpose of the project (often called a README) \- should contain project title, brief description, contact info  
    * Create a CONTRIBUTING file that describes what people need to do to contribute  
  * Create a shared public to-do list  
  * Make license explicit  
    * Have a LICENSE file in project’s home directory that states all licenses  
  * Include a citation file in home directory to make the project citable  
* Project organization  
  * Put each project in its own directory, which should be named after the project  
  * Put text documents in the doc directory  
  * Put raw data and metadata in a “data” directory, and files generated during cleanup and analysis in a “results” directory  
    * Results directory likely to have subdirectories to organiza data  
  * Put project source code in the “src” directory  
    * Contains all code written for the project  
  * Put external scripts or compiled programs in the “bin” directory  
  * Name all files to reflect their content / function  
    * Don’t include sequential numbers (ie no results1.csv)  
* Keep track of changes   
  * Use version control systems, such as Git  
  * Back up (almost) everything created by a human being as soon as it is created   
    * Save, save, save  
  * Keep changes small  
  * Share changes frequently  
  * Use a checklist for saving and sharing changes  
    * Should include writing log messages that explain any changes, teh size and content of individual changes, style guidelines for code, updating to-do lists

Definitions

* Branch  
  * A “parallel universe” within a version control repository  
  * Done so collaborators can make multiple changes independently, and simultaneously  
* Unit test  
  * One small test of a particular feature of the software

**Applied Hierarchical Modeling in Ecology: Chapter 10 \- Occurrence**

* Occurence modeled as Bernoulli r.v. with prob of occupancy as phi  
  * Effects of covariates modeled on the link scale \- logit is the canonical link for Bernoulli/Binomial  
  * Y represents detection r.v., Z represents true occupancy state  
    *  If y \= 0 (nondetection) and z \= 1 (site is occupied), this is a false negative error  
    * If y \= 1 (detection) and z \= 0 (site is not occupied), this is false positive error (usually comes from misidentification)  
  * Known as a *site-occupancy model*  
* Chapter 19 covers false positives \- read for WP  
* Increased observation period or occupancy area \-\> increased occupancy probability  
* Ex of a two-level hierarchical model  
* 5 major types of data  
  * Point pattern  
    * The “mother” of all distribution and abundance data  
    * Arises when you search an area thoroughly and record the location of each object present  
    * Spatial point pattern models (PPMs) treat both the number and locations of the objects in an area as the outcome of a random process  
    * Best modeled as a Poisson generalized linear model (GLM)  
    * When an object fails to be recorded, the point pattern is called “thinned”  
    * In ecology, used for trees, plants, gopher mounds (all static)  
  * Presence-only  
    * Often characteristic of museum datasets, where a collection of species has known collection dates and sites, but no recording of absence  
    * Can be augmented with data on the environmental conditions at some of the larger number of sites  
    * Difficult to obtain meaningful inference from  
  * Presence / absence  
    * Misnomer, should be called “detection / nondetection”  
    * Classically uses logistic regression \- more specifically, a binomial generalized linear model  
    * Typically cannot separately estimate detection probability from occupancy probability  
    * Does allow you to estimate the intercept that a presence-only model prevents  
  * Presence / absence replicated over time  
    * Allows one to model joint probability of detection and occupancy using site-occupancy models  
  * Count data (possibly replicated over time)  
    * Unreplicated count data can be modeled as Poisson GLM   
      * Probability of occupancy is probability of a count greater than 0  
    * When replicated over a short time span such that the occupancy status is closed during the sampling period, one may be able to use an N-mixture model

**Generalized Site Occupancy Models Allowing for False Positives & Negative Errors (Royle & Link, 2006\)**  
Abstract

* Even low false positive error rates can induce extreme bias in estimates of site occupancy  
* Model to allow for both false positive & negative error rates  
  * Can be represented as a two-component finite mixture model  
  * Easily fit using free software

Intro

* Parameter of interest  
  * \= Occurrence probability  
    * \= Proportion of area occupies (PAO)  
    * \= “Site occupancy”  
  * Allows for tracking of species geographical distribution, especially over time  
  * Ease of implementing surveys  
* Misidentification as root cause of false positives (detection y \= 1 when no presence z \= 0\)  
  * If not accommodate for in the model, the apparent occupancy will tend to 1.0 as the number of visits to sites increases  
  * Even for low false positive error rates can induce extreme error in estimates of occupancy  
  * Classification probability has two possible values, 0/1 for detected, as well as 0/1 for occupancy (K \= 2\)  
* Model assumptions  
  * Occupancy statuses of sites are indep  
  * System is closed to changes in occupancy status during the sampling period  
* Define the set of (mis)classification probabilities as:  
  * P\_kl \= Pr(y\_it \= k | z\_i \= l)  
    * Sum to 1 for each value of z\_i  
* Model implies that, conditional on occupancy state (the value of z\_i), the site-specific counts y\_i have a binomial distribution with a state-dependent detection probability parameter  
  * For an occupied site, y\_i is binomial with parameter p\_11 (detection probability)  
  * For an unoccupied site, y\_i is binomial with parameter p\_10 \= prob of falsely detecting a species at an unoccupied site (false positive rate parameter)  
* Seminal MacKenzie et al. (2002) site-occupancy paper assuming no false positives is a special case of this model, arising under the constraint p\_10 \= 0 (no false detection)

**Modelling misclassification in multi‐species acoustic data when**  
**estimating occupancy and relative activity (Wright et al. 2020\)**

* *Notes written in notebook to practice writing theoretical models*
