MAIN
DEFINE l_query_text VARCHAR(500)
DEFINE l_idx INT
DEFINE l_rec_company RECORD
						cmpy_name CHAR(30)
					END RECORD

PREPARE s1_company_short FROM l_query_text
DECLARE c1_company_short CURSOR FOR s1_company_short

LET l_idx = 0
FOREACH c1_company_shortX INTO l_rec_company.* #c_company_shortX does not exist but is not reported at compilation time
LET l_idx = l_idx + 1
END FOREACH

PREPARE s2_company_short FROM l_query_text
DECLARE c2_company_short CURSOR FOR s2_company_shortX #prepared statement s_company_shortX does not exist but is not reported at compilation time

LET l_idx = 0
FOREACH c2_company_short INTO l_rec_company.*
LET l_idx = l_idx + 1
END FOREACH

END MAIN