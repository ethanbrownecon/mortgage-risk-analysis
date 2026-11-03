use "data/NSMO_PUF.dta", clear

/// Cleaning 
 
keep if term ==30
keep if loan_type ==1 

drop age_o1 sex_o1 borrower_num gse pmms loan_type loan_amount_cat analysis_weight survey_wave nsmoid 

/// generating variabkes
gen low_income_area =0 
	replace low_income_area =1 if metro_lmi ==2
drop if metro_lmi ==3 
drop metro_lmi
gen ARM = 0
	replace ARM = 1 if arm == 1 | arm == -1

gen Baloon = 0
	replace Baloon = 1 if baloon == 1 | arm == -1
	
gen risky_ratesp= 0 
	replace risky_ratesp=1 if rate_spread>1.5
	
gen risky_CLTV= 0 
	replace risky_CLTV =1 if cltv>90 
	
gen risky_dti= 0 
	replace risky_dti =1 if dti > 43 
	
gen has_pmi=0
	replace has_pmi=1 if pmi == 1 | pmi == -1

gen risky_pti= 0 
	replace risky_pti =1 if pti > 31

gen risky_credit= 0 
	replace risky_credit =1 if score_orig_r <620

replace hispanic = 0 if hispanic ==2

replace first_mort_r = 0 if first_mort_r ==2


gen collegeeduc = 0 
	replace collegeeduc =1 if educ==4 | educ==5 

gen race_temp = race

replace race_temp = 5 if race == 4
replace race_temp = 4 if race == 5 | hispanic == 1

replace race = race_temp
drop race_temp hispanic

label define racelabels 1 "White" 2 "Black" 3 "Asian" 4 "Hispanic" 5 "Other"
label values race racelabels


/*
The code below tells Stata to calculate the sum the variable ARM through risky_credit
*/
egen total_risk=rowtotal(ARM Baloon risky_ratesp risky_CLTV risky_dti risky_pti risky_credit)
rename score_orig_r creditscore
gen credit_100 = creditscore/100
//Generate final dummy
gen highrisk=(total_risk>=2)

save Final_Dataset.dta, replace
