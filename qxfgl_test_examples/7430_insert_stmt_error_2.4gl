##########################################################################################################################################
# Author: Bondar A.G.
##########################################################################################################################################
DATABASE stores
MAIN
	DEFINE dt_rec_life_quote_screen TYPE AS
		RECORD
			doc_no LIKE life_quote.doc_no,
			quote_date LIKE life_quote.quote_date,
			country_code LIKE life_quote.country_code,
			plan_code LIKE life_quote.plan_code,
			iss_date LIKE life_quote.iss_date,
			freq LIKE life_quote.freq,
			amount LIKE life_quote.amount,
			currency LIKE life_quote.currency, #HuHo added 30.12.2021
			cust1 LIKE life_quote.cust1,
			name1 LIKE life_cust.name_of,
			cust2 LIKE life_quote.cust2,
			premium LIKE life_quote.premium,
			fee LIKE life_quote.fee,
			age1 LIKE life_quote.age1,
			smoker1 LIKE life_quote.smoker1,
			adb1 LIKE life_quote.adb1,
			add_1 LIKE life_quote.add_1,
			wop LIKE life_quote.wop,
			age2 LIKE life_quote.age2,
			smoker2 LIKE life_quote.smoker2
		END RECORD

	DEFINE p_rec_life_quote dt_rec_life_quote_screen

	DEFINE
		l_added_by int

	DEFINE rec_life_quote RECORD LIKE life_quote.*

	LET p_rec_life_quote.doc_no  = 1
	LET p_rec_life_quote.quote_date = "01/01/2022"
	LET p_rec_life_quote.name1 = "name1"
	LET p_rec_life_quote.country_code = "cod"
	LET p_rec_life_quote.plan_code = "p_rec_life"
	LET p_rec_life_quote.cust1 = 1
	LET p_rec_life_quote.cust2 = 2
	LET p_rec_life_quote.amount = 1.1
	LET p_rec_life_quote.currency = "curre"
	LET p_rec_life_quote.iss_date = "01/01/2022"
	LET p_rec_life_quote.smoker1 = "s"
	LET p_rec_life_quote.adb1 = "a"
	LET p_rec_life_quote.add_1 = "b"
	LET p_rec_life_quote.freq = "f"
	LET p_rec_life_quote.wop = "w"
	LET p_rec_life_quote.premium = 2.2 
	LET p_rec_life_quote.fee = 3.3
	LET p_rec_life_quote.age2 = 3
	LET p_rec_life_quote.age1 = 4
	LET p_rec_life_quote.smoker2 = "s"
	LET l_added_by = 5

	INSERT INTO life_quote 
	( 
		doc_no,
		quote_date,
		name_of,
		country_code,
		plan_code,
		cust1,
		cust2,
		amount,
		currency,
		iss_date,
		smoker1,
		adb1,
		add_1,
		freq,
		wop,
		premium,
		fee,
		age2,
		age1,
		smoker2,
		added_by
	)
	VALUES
	(
		p_rec_life_quote.doc_no,
		p_rec_life_quote.quote_date,
		p_rec_life_quote.name1,
		p_rec_life_quote.country_code,
		p_rec_life_quote.plan_code,
		p_rec_life_quote.cust1,
		p_rec_life_quote.cust2,
		p_rec_life_quote.amount,
		p_rec_life_quote.currency,
		p_rec_life_quote.iss_date,
		p_rec_life_quote.smoker1,
		p_rec_life_quote.adb1,
		p_rec_life_quote.add_1,
		p_rec_life_quote.freq,
		p_rec_life_quote.wop,
		p_rec_life_quote.premium,
		p_rec_life_quote.fee,
		p_rec_life_quote.age2,
		p_rec_life_quote.age1,
		p_rec_life_quote.smoker2,
		l_added_by
	)

   DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	SELECT * INTO rec_life_quote.* FROM life_quote 
	DISPLAY rec_life_quote.*

END MAIN
