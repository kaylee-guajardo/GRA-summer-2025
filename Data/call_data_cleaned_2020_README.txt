"NABAT_CellNum" : GRTS selection number for cell from NABat 
"NABAT_SiteNum" : Site number within GRTS cell. Note that site numbers may be assigned to different sites across years. For example the 2020 and 2024 deployments of site 1 may be in different locations.
"Installation_Date" : Date the detector was installed (and first recording night) format-Year-Month-Day 00:00:00
"Location": text field with cell and site
"SiteID" : Deployment ID number. Links to the site attribute table
"Master_Class" : Identification field for hand review. Species 4-code and species group are used. Also Noise, Bird, or Insect may be noted when the call does not contain echolocation pulses.
"Hand_Class" : Assessment of certainty for calls assigned a 4-code in "Master Class"
	D: Definative Calls. Call contains pulses that can only be made by the identified species. We are certain this call was made by that species.
	P: Probable Calls. Call contains pulses that are consistent with the identified species. Other species may also produce similar calls, but infrequently. Likely the identified species, but we are not 100% certain. 
	NC: Not Confident. Calls look consistent with the identified species, but other species also make similar calls and we are not confident in the identification provided
	Z: Calls not reviewed as average attributes are shared with other species. These calls might be identifiable but we are unlikely to get beyond frequency group.
	X: Not Reviewed. Definative call sequence(s) were identified within the period of interest. We use this as a quick way to filter our sites which have been reviewed. 
	NULL: Not reviewed
"Sample_Night" : Night the call was recorded. Note that calls recorded after midnight are attributed to the previous day.  
"Classifier" : Which Classifier was used in Sonobat (Mountains, Plains, or South). The following variables correspond to Sonobat Outputs for the given classifier.
"SppAccp": 4-code for top species from the Mountains Classifer. Note that NULL values are calls that were not identified to species    
"Prob" : Probability calculated by Sonobat that the ID for the Given Classifer is correct
"MajCalls" : Number of pulses analyzed 
"AccpCalls" : Number of pulses accepted for ID (Mountains)
"HiF" : calls from the high frequency present. Note if both HI and Low are populated atleast 2 bats are in sequence   
"LoF" : calls from low frequency group present. Note if both HI and Low are populated atleast 2 bats are in sequence 
"ApproxSpp" : Possible species from classifer. Not recorded if "SppAccp" is populated
"ApproxProb" : Probability calculated by Sonobat that the ID       
"FcMean" : Mean characteristic frequency of call from major pulses 
"FcStdDev" : SD from "FcMean"
"DurMean" : Mean pulse duration 
"DurStdDev" : SD for "DurMean"
"Mean_Calls_Sec" : Mean pulses per second"
"Mean_HiFreq" : Mean high frequencyof pulses
"Mean_LoFreq" : Mean low frequency of pulses
"Mean_UpprSlp" : Mean slope of upper pulses 
"Mean_LwrSlp" : Mean slope of lower pulses
"Mean_TotalSlp" : Mean slope across pulses
"Mean_PrecedingIntvl" : Mean inter-pulse interval
"Species1" : Most Likely Species 
"Species2" : Second most likely species
"Species3" : third most likely species 
"Species4" : fourth most likley species
"Latitude" : Latitude of deployment WGS84
"Longitude" : Longitude of deployment WGS84
"Decommision Date" : Date the detector was collected. Note that the previous day is the last recording night. format-Year-Month-Day 00:00:00
"Detector_Survey_Type" : Detector and microphone type used to conduct survey. field is preffered over detector type and microphone type fields.
"AnalysisGroup" : classifer(s) used for data analysis. Classifiers are Mountains, Plains, and South. All is all classifiers run. South_Plains is South and Plains, Mountains is Mountains. 
			Mountains: MYYU,MYCA,MYCI,MYVO,MYLU,MYEV,EPFU,LANO,COTO,MYTH,LACI,EUMA
			Plains: MYCI,MYVO,MYLU,MYEV,EPFU,LANO,COTO,MYTH,LACI,EUMA, LABO, MYSE
			South:MYCI,MYVO,MYLU,MYEV,EPFU,LANO,COTO,MYTH,LACI,EUMA, LABO, ANPA
"NABAT_SiteDesc" : text field with written description
"NABAT_SiteType" : Site Type as recorded at the detector deployment in a given year. Note NULL values were not assessed by the observer. 
"NABAT_ClutterType" : Type of closest cover
"NABAT_ClutterDistance" : DO NOT USE! 2024 had an import error. will revisit next week when Braden is back in the office
"NABAT_WaterType" : Type of closest water
"NABAT_WaterDistance" : DO NOT USE! 2024 had an import error. will revisit next week when Braden is back in the office
"quadrant" : which quadrant of Montana was the call recorded. Derived with latitude and lognitude, with quadrant splits along the midpoints of each axis. 
"Year" : Year in which the call was recorded
"Sample_Night_int" : Integer Indicating which night of the deployment the call was recorded. 1 indicates the first night, so if deployed 6/07/20 and Sample_Night_int = 1, then the call was recorded 6/07/20 or 6/08/20 if recorded after midnight.
