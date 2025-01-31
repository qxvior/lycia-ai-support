#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
MAIN
  DEFINE
     v_interval1_h_mi INTERVAL HOUR TO MINUTE,
     v_integer        INTEGER

  WHENEVER ANY ERROR CONTINUE

  LET v_interval1_h_mi  = "99:59"
  LET v_integer = 123
  IF v_interval1_h_mi =  v_integer  THEN  ELSE  END IF
  DISPLAY "1.  STATUS = ",status
  IF v_interval1_h_mi <> v_integer  THEN  ELSE  END IF
  DISPLAY "2.  STATUS = ",status
  IF v_interval1_h_mi <   v_integer  THEN  ELSE  END IF
  DISPLAY "3.  STATUS = ",status
  IF v_interval1_h_mi <= v_integer  THEN  ELSE  END IF
  DISPLAY "4.  STATUS = ",status
  IF v_interval1_h_mi >  v_integer  THEN  ELSE  END IF
  DISPLAY "5.  STATUS = ",status
  IF v_interval1_h_mi >=  v_integer  THEN  ELSE  END IF
  DISPLAY "6.  STATUS = ",status

  IF v_interval1_h_mi =  123  THEN  ELSE  END IF
  DISPLAY "7.  STATUS = ",status
  IF v_interval1_h_mi <> 123  THEN  ELSE  END IF
  DISPLAY "8.  STATUS = ",status
  IF v_interval1_h_mi <   123  THEN  ELSE  END IF
  DISPLAY "9.  STATUS = ",status
  IF v_interval1_h_mi <= 123  THEN  ELSE  END IF
  DISPLAY "10. STATUS = ",status
  IF v_interval1_h_mi >  123  THEN  ELSE  END IF
  DISPLAY "11. STATUS = ",status
  IF v_interval1_h_mi >=  123  THEN  ELSE  END IF
  DISPLAY "12. STATUS = ",status

END MAIN