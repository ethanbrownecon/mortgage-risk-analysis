use "Final_Dataset.dta", clear

// sum stats 
	sum 
	outreg2 using sumstatsproject.doc, sum(log) dec(3) replace 
	
// Exploratory Analysis 



histogram creditscore, normal
pwcorr ltv cltv dti pti creditscore, sig



graph box creditscore, over(race)

graph bar (mean) total_risk, over(race)
graph bar total_risk, over(race) 
graph bar highrisk, over(open_year) over(race)


preserve 
collapse (mean) highrisk, by(race open_year )
twoway ///
  (line highrisk open_year if race==1, lcolor(blue) lwidth(medium) msymbol(circle)) ///
  (line highrisk open_year if race==2, lcolor(red) lwidth(medium) msymbol(square)) ///
  (line highrisk open_year if race==3, lcolor(green) lwidth(medium) msymbol(triangle)) ///
  (line highrisk open_year if race==4, lcolor(orange) lwidth(medium) msymbol(diamond)) ///
  , legend(order(1 "White" 2 "Black" 3 "Hispanic" 4 "Asian")) ///
    ytitle("Proportion High Risk") xtitle("Loan Origination Year") ///
    title("Trends in High-Risk Loans by Race")
restore
//regressions
reg baloon i.race credit_100 
est store reg1

reg highrisk i.race c.age i.race##c.age sex collegeeduc


reg highrisk race collegeeduc low_income_area credit_100 i.race##collegeeduc
est store reg2

outreg2 [reg1  ] using "Results2.doc", replace dec(3)
