
ssc install estout

* Read in data: 
import delimited using "/Users/sw3947/Desktop/FALL2024/Research Method B/assignment/1/assignment1-research-methods.csv",varname(1) clear

* Label your variables
label variable eliteschoolcandidate "Elite School Candidate"
label variable recruiteriswhite "White Recruiter"
label variable recruiterismale "Male Recruiter"
label variable bigcompanycandidate "Big Company Candidate"
label variable malecandidate "Male Candidate"


estout clear

* Run regression: 
reg calledback eliteschoolcandidate 

* Store regression
eststo r1

reg calledback eliteschoolcandidate recruiteriswhite recruiterismale bigcompanycandidate
eststo r2

reg calledback c.eliteschoolcandidate#c.recruiteriswhite c.eliteschoolcandidate#c.recruiterismale c.eliteschoolcandidate#c.bigcompanycandidate  eliteschoolcandidate recruiteriswhite recruiterismale bigcompanycandidate
eststo r3


**********************************


esttab r1 r2 r3  using"/Users/sw3947/Desktop/FALL2024/Research Method B/assignment/1/table.tex", replace label se r2 wrap width(\hsize)title("\label{tab:assignment1} The Effect of Having an Elite College on Call Back Rate") mgroups("Called Back", pattern(1 0 0 ) prefix(\multicolumn{@span}{c}{) suffix(}) span ) nomtitles keep(eliteschoolcandidate recruiteriswhite recruiterismale bigcompanycandidate c.eliteschoolcandidate#c.recruiteriswhite c.eliteschoolcandidate#c.recruiterismale c.eliteschoolcandidate#c.bigcompanycandidate ) order(eliteschoolcandidate recruiteriswhite recruiterismale bigcompanycandidate c.eliteschoolcandidate#c.recruiteriswhite c.eliteschoolcandidate#c.recruiterismale c.eliteschoolcandidate#c.bigcompanycandidate ) 



estout clear

* Run regression: 
reg calledback eliteschoolcandidate 

* Store regression
eststo r1

reg calledback eliteschoolcandidate recruiteriswhite recruiterismale malecandidate bigcompanycandidate
eststo r2

reg calledback c.eliteschoolcandidate#c.recruiteriswhite c.eliteschoolcandidate#c.recruiterismale c.eliteschoolcandidate#c.malecandidate c.eliteschoolcandidate#c.bigcompanycandidate  eliteschoolcandidate recruiteriswhite recruiterismale malecandidate bigcompanycandidate
eststo r3


**********************************


esttab r1 r2 r3  using"/Users/sw3947/Desktop/FALL2024/Research Method B/assignment/1/table1.tex", replace label se r2 wrap width(\hsize)title("\label{tab:assignment1} The Effect of Having an Elite College on Call Back Rate") mgroups("Called Back", pattern(1 0 0 ) prefix(\multicolumn{@span}{c}{) suffix(}) span ) nomtitles keep(eliteschoolcandidate recruiteriswhite recruiterismale malecandidate bigcompanycandidate c.eliteschoolcandidate#c.recruiteriswhite c.eliteschoolcandidate#c.recruiterismale c.eliteschoolcandidate#c.malecandidate c.eliteschoolcandidate#c.bigcompanycandidate ) order(eliteschoolcandidate recruiteriswhite recruiterismale malecandidate bigcompanycandidate c.eliteschoolcandidate#c.recruiteriswhite c.eliteschoolcandidate#c.recruiterismale c.eliteschoolcandidate#c.malecandidate c.eliteschoolcandidate#c.bigcompanycandidate) 
