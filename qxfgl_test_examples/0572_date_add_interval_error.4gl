#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
MAIN
   DEFINE
      v_date              DATE,      
      v_res_datetime_y_y  DATETIME YEAR TO YEAR,
      v_res_datetime_y_mo DATETIME YEAR TO MONTH,
      v_res_datetime_y_d  DATETIME YEAR TO DAY,
      v_res_datetime_y_h  DATETIME YEAR TO HOUR,
      v_res_datetime_y_mi DATETIME YEAR TO MINUTE,
      v_res_datetime_y_s  DATETIME YEAR TO SECOND,
      v_res_datetime_y_f  DATETIME YEAR TO FRACTION,

      v_interval_y_y      INTERVAL YEAR TO YEAR, 
      v_interval_y_mo     INTERVAL YEAR TO MONTH,
      v_interval_mo_mo    INTERVAL MONTH(9) TO MONTH

	WHENEVER ANY ERROR CONTINUE

   # + Addition
   # DATE + INTERVAL
   LET v_date = "01/01/0001"
   LET v_interval_y_y  = "9998"
   LET v_res_datetime_y_y = v_date + v_interval_y_y
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_y IS NULL    THEN DISPLAY "1.  NULL"   ELSE DISPLAY "1.  |",v_res_datetime_y_y,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_y_mo = "9998-11"
   LET v_res_datetime_y_y = v_date + v_interval_y_mo
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_y IS NULL    THEN DISPLAY "2.  NULL"   ELSE DISPLAY "2.  |",v_res_datetime_y_y,"|"   END IF

   LET v_date  = "01/01/0001"
   LET v_interval_mo_mo = "119987"
   LET v_res_datetime_y_y = v_date + v_interval_mo_mo
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_y IS NULL    THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",v_res_datetime_y_y,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_y_y   = "9998"
   LET v_res_datetime_y_mo = v_date + v_interval_y_y
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_mo IS NULL    THEN DISPLAY "4.  NULL"   ELSE DISPLAY "4.  |",v_res_datetime_y_mo,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_y_mo  = "9998-11"
   LET v_res_datetime_y_mo = v_date + v_interval_y_mo
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_mo IS NULL    THEN DISPLAY "5.  NULL"   ELSE DISPLAY "5.  |",v_res_datetime_y_mo,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_mo_mo = "119987"
   LET v_res_datetime_y_mo = v_date + v_interval_mo_mo
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_mo IS NULL    THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",v_res_datetime_y_mo,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_y_y  = "9998"
   LET v_res_datetime_y_d = v_date + v_interval_y_y
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_d IS NULL    THEN DISPLAY "7.  NULL"   ELSE DISPLAY "7.  |",v_res_datetime_y_d,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_y_mo = "9998-11"
   LET v_res_datetime_y_d = v_date + v_interval_y_mo
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_d IS NULL    THEN DISPLAY "8.  NULL"   ELSE DISPLAY "8.  |",v_res_datetime_y_d,"|"   END IF

   LET v_date  = "01/01/0001"
   LET v_interval_mo_mo = "119987"
   LET v_res_datetime_y_d = v_date + v_interval_mo_mo
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_d IS NULL    THEN DISPLAY "9.  NULL"   ELSE DISPLAY "9.  |",v_res_datetime_y_d,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_y_y  = "9998"
   LET v_res_datetime_y_h = v_date + v_interval_y_y
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_h IS NULL    THEN DISPLAY "10. NULL"   ELSE DISPLAY "10. |",v_res_datetime_y_h,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_y_mo = "9998-11"
   LET v_res_datetime_y_h = v_date + v_interval_y_mo
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_h IS NULL    THEN DISPLAY "11. NULL"   ELSE DISPLAY "11. |",v_res_datetime_y_h,"|"   END IF

   LET v_date  = "01/01/0001"
   LET v_interval_mo_mo = "119987"
   LET v_res_datetime_y_h = v_date + v_interval_mo_mo
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_h IS NULL    THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",v_res_datetime_y_h,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_y_y   = "9998"
   LET v_res_datetime_y_mi = v_date + v_interval_y_y
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_mi IS NULL    THEN DISPLAY "13. NULL"   ELSE DISPLAY "13. |",v_res_datetime_y_mi,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_y_mo  = "9998-11"
   LET v_res_datetime_y_mi = v_date + v_interval_y_mo
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_mi IS NULL    THEN DISPLAY "14. NULL"   ELSE DISPLAY "14. |",v_res_datetime_y_mi,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_mo_mo = "119987"
   LET v_res_datetime_y_mi = v_date + v_interval_mo_mo
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_mi IS NULL    THEN DISPLAY "15. NULL"   ELSE DISPLAY "15. |",v_res_datetime_y_mi,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_y_y = "9998"
   LET v_res_datetime_y_s = v_date + v_interval_y_y
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_s IS NULL    THEN DISPLAY "16. NULL"   ELSE DISPLAY "16. |",v_res_datetime_y_s,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_y_mo = "9998-11"
   LET v_res_datetime_y_s = v_date + v_interval_y_mo
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_s IS NULL    THEN DISPLAY "17. NULL"   ELSE DISPLAY "17. |",v_res_datetime_y_s,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_mo_mo = "119987"
   LET v_res_datetime_y_s = v_date + v_interval_mo_mo
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_s IS NULL    THEN DISPLAY "18. NULL"   ELSE DISPLAY "18. |",v_res_datetime_y_s,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_y_y  = "9998"
   LET v_res_datetime_y_f = v_date + v_interval_y_y
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_f IS NULL    THEN DISPLAY "19. NULL"   ELSE DISPLAY "19. |",v_res_datetime_y_f,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_y_mo = "9998-11"
   LET v_res_datetime_y_f = v_date + v_interval_y_mo
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_f IS NULL    THEN DISPLAY "20. NULL"   ELSE DISPLAY "20. |",v_res_datetime_y_f,"|"   END IF

   LET v_date = "01/01/0001"
   LET v_interval_mo_mo = "119987"
   LET v_res_datetime_y_f = v_date + v_interval_mo_mo
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_datetime_y_f IS NULL    THEN DISPLAY "21. NULL"   ELSE DISPLAY "21. |",v_res_datetime_y_f,"|"   END IF
      
END MAIN
