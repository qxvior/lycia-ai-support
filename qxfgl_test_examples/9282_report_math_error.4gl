
MAIN
 DEFINE tot_hours INTERVAL HOUR to minute
 DEFINE h_abil INTERVAL HOUR TO MINUTE
 DEFINE th_lic INTERVAL HOUR TO MINUTE    
 DEFINE th_bk  INTERVAL HOUR TO MINUTE
 DEFINE th_abs INTERVAL HOUR TO MINUTE
	START REPORT hr_mv 
	OUTPUT TO REPORT hr_mv(1)
	FINISH REPORT hr_mv

            LET tot_hours = "99:59"
            LET th_lic = "01:01"
            LET th_bk = "01:01"
            LET th_abs = "01:01"
			LET h_abil = ((tot_hours)-(th_lic+th_abs+th_bk))
            DISPLAY "Math:",h_abil
END MAIN

REPORT hr_mv(i)
 DEFINE tot_hours INTERVAL HOUR to minute
 DEFINE h_abil INTERVAL HOUR TO MINUTE
 DEFINE th_lic INTERVAL HOUR TO MINUTE    
 DEFINE th_bk  INTERVAL HOUR TO MINUTE
 DEFINE th_abs INTERVAL HOUR TO MINUTE
 DEFINE i INT
	FORMAT
        ON EVERY ROW PRINT i
		AFTER GROUP OF i
            LET tot_hours = "99:59"
            LET th_lic = "01:01"
            LET th_bk = "01:01"
            LET th_abs = "01:01"
			LET h_abil = (GROUP SUM(tot_hours)-(th_lic+th_abs+th_bk))
            PRINT "GROUP SUM",h_abil,"|"
END REPORT


