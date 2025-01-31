##########################################################################################################################################
# Author: Bondar A.G.
##########################################################################################################################################
DATABASE stores
MAIN

	WHENEVER ERROR CONTINUE
	DROP TABLE life_quote
	DROP TABLE life_cust
	
	CREATE TABLE life_quote(
	doc_no serial NOT NULL,
	quote_date date,
	name_of char(60),
	country_code char(3),
	plan_code char(10),
	cust1 int,
	cust2 int,
	amount decimal(10, 2),
	iss_date date,
	smoker1 char(1),
	adb1 char(1),
	add_1 char(1),
	freq char(1),
	wop char(1),
	premium decimal(10, 2),
	added_by int,
	fee decimal(10, 2),
	age2 smallint,
	age1 smallint,
	smoker2 char(1),
	adb2 char(1),
	add_2 char(1),
	currency char(5),
	as_per_notary_date char(1))
	CREATE UNIQUE INDEX ix1552_1 ON life_quote (doc_no)
   DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	CREATE TABLE life_cust(
	name_of CHAR(80)
	)
   DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

END MAIN
