#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################

MAIN
   DEFINE
  	v_datetime_y_y   DATETIME YEAR TO YEAR,
  	v_datetime_y_mo  DATETIME YEAR TO MONTH,
  	v_datetime_y_f4  DATETIME YEAR TO FRACTION(4)      

   WHENEVER ANY ERROR CONTINUE

   LET v_datetime_y_y = "0001"
   LET v_datetime_y_y = v_datetime_y_y + 9998 UNITS YEAR + 11 UNITS MONTH + 30 UNITS DAY + 23 UNITS HOUR + 59 UNITS MINUTE + 59 UNITS SECOND + 0.99999 UNITS FRACTION(5)
   IF status <> 0 THEN DISPLAY "1.  status = ",status END IF
   IF v_datetime_y_y IS NULL    THEN DISPLAY "2.  NULL"   ELSE DISPLAY "2.  |",v_datetime_y_y,"|"   END IF

   LET v_datetime_y_y = "0001"
   LET v_datetime_y_f4 = v_datetime_y_y + 9998 UNITS YEAR + 11 UNITS MONTH + 30 UNITS DAY + 23 UNITS HOUR + 59 UNITS MINUTE + 59 UNITS SECOND + 0.99999 UNITS FRACTION(5)
   IF status <> 0 THEN DISPLAY "3.  status = ",status END IF
   IF v_datetime_y_f4 IS NULL    THEN DISPLAY "4.  NULL"   ELSE DISPLAY "4.  |",v_datetime_y_f4,"|"   END IF

   LET v_datetime_y_f4 = "0001-01-01 00:00:0.0000"
   LET v_datetime_y_f4 = v_datetime_y_f4 + 9998 UNITS YEAR + 11 UNITS MONTH + 30 UNITS DAY + 23 UNITS HOUR + 59 UNITS MINUTE + 59 UNITS SECOND + 0.99999 UNITS FRACTION(5)
   IF status <> 0 THEN DISPLAY "5.  status = ",status END IF
   IF v_datetime_y_f4 IS NULL    THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",v_datetime_y_f4,"|"   END IF


   LET v_datetime_y_mo = "0001-01"
   LET v_datetime_y_mo = v_datetime_y_mo + 9998 UNITS YEAR + 11 UNITS MONTH + 30 UNITS DAY + 23 UNITS HOUR + 59 UNITS MINUTE + 59 UNITS SECOND + 0.99999 UNITS FRACTION(5)
   IF status <> 0 THEN DISPLAY "7.  status = ",status END IF
   IF v_datetime_y_mo IS NULL    THEN DISPLAY "8.  NULL"   ELSE DISPLAY "8.  |",v_datetime_y_mo,"|"   END IF

   LET v_datetime_y_mo = "0001-01"
   LET v_datetime_y_f4 = v_datetime_y_mo + 9998 UNITS YEAR + 11 UNITS MONTH + 30 UNITS DAY + 23 UNITS HOUR + 59 UNITS MINUTE + 59 UNITS SECOND + 0.99999 UNITS FRACTION(5)
   IF status <> 0 THEN DISPLAY "9.  status = ",status END IF
   IF v_datetime_y_f4 IS NULL    THEN DISPLAY "10. NULL"   ELSE DISPLAY "10. |",v_datetime_y_f4,"|"   END IF

   LET v_datetime_y_f4 = "0001-01-01 00:00:0.0000"
   LET v_datetime_y_f4 = v_datetime_y_f4 + 9998 UNITS YEAR + 11 UNITS MONTH + 30 UNITS DAY + 23 UNITS HOUR + 59 UNITS MINUTE + 59 UNITS SECOND + 0.99999 UNITS FRACTION(5)
   IF status <> 0 THEN DISPLAY "11. status = ",status END IF
   IF v_datetime_y_f4 IS NULL    THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",v_datetime_y_f4,"|"   END IF

END MAIN
