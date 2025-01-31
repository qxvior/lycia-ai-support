#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################

DATABASE stores

MAIN
   DEFINE
      ins_datetime_y_y,   sel_datetime_y_y   DATETIME YEAR TO YEAR,           
      ins_datetime_y_mo,  sel_datetime_y_mo  DATETIME YEAR TO MONTH,          
      ins_datetime_y_d,   sel_datetime_y_d   DATETIME YEAR TO DAY,            
      ins_datetime_y_h,   sel_datetime_y_h   DATETIME YEAR TO HOUR,           
      ins_datetime_y_mi,  sel_datetime_y_mi  DATETIME YEAR TO MINUTE,         
      ins_datetime_y_s,   sel_datetime_y_s   DATETIME YEAR TO SECOND,         
      ins_datetime_y_f,   sel_datetime_y_f   DATETIME YEAR TO FRACTION,       
      ins_datetime_y_f1,  sel_datetime_y_f1  DATETIME YEAR TO FRACTION(1),    
      ins_datetime_y_f2,  sel_datetime_y_f2  DATETIME YEAR TO FRACTION(2),    
      ins_datetime_y_f3,  sel_datetime_y_f3  DATETIME YEAR TO FRACTION(3),    
      ins_datetime_y_f4,  sel_datetime_y_f4  DATETIME YEAR TO FRACTION(4),     
      ins_datetime_y_f5,  sel_datetime_y_f5  DATETIME YEAR TO FRACTION(5)    

   WHENEVER ERROR CONTINUE
   
   DROP TABLE lyc_2664
   CREATE TABLE lyc_2664
   (
      col_datetime_y_y   DATETIME YEAR TO YEAR,
      col_datetime_y_mo  DATETIME YEAR TO MONTH,
      col_datetime_y_d   DATETIME YEAR TO DAY,
      col_datetime_y_h   DATETIME YEAR TO HOUR,
      col_datetime_y_mi  DATETIME YEAR TO MINUTE,   
      col_datetime_y_s   DATETIME YEAR TO SECOND,
      col_datetime_y_f   DATETIME YEAR TO FRACTION,   
      col_datetime_y_f1  DATETIME YEAR TO FRACTION(1),   
      col_datetime_y_f2  DATETIME YEAR TO FRACTION(2),
      col_datetime_y_f3  DATETIME YEAR TO FRACTION(3),    
      col_datetime_y_f4  DATETIME YEAR TO FRACTION(4),      
      col_datetime_y_f5  DATETIME YEAR TO FRACTION(5)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   
   LET ins_datetime_y_y = "0001"
   INSERT INTO lyc_2664(col_datetime_y_y) VALUES(DATETIME(0001)YEAR TO YEAR)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_y = NULL
   SELECT col_datetime_y_y INTO sel_datetime_y_y FROM lyc_2664 WHERE col_datetime_y_y = DATETIME(0001)YEAR TO YEAR
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_y       IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_datetime_y_y,"|"   END IF

   LET ins_datetime_y_mo = "0001-01"
   INSERT INTO lyc_2664(col_datetime_y_mo) VALUES(DATETIME(0001-01)YEAR TO MONTH)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_mo = NULL
   SELECT col_datetime_y_mo INTO sel_datetime_y_mo FROM lyc_2664 WHERE col_datetime_y_mo = DATETIME(0001-01)YEAR TO MONTH
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_mo       IS NULL   THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",sel_datetime_y_mo,"|"   END IF

   LET ins_datetime_y_d = "0001-01-01"
   INSERT INTO lyc_2664(col_datetime_y_d) VALUES(DATETIME(0001-01-01)YEAR TO DAY)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "16. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_d = NULL
   SELECT col_datetime_y_d INTO sel_datetime_y_d FROM lyc_2664 WHERE col_datetime_y_d = DATETIME(0001-01-01)YEAR TO DAY
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "17. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_d       IS NULL   THEN DISPLAY "18. NULL"   ELSE DISPLAY "18. |",sel_datetime_y_d,"|"   END IF

   LET ins_datetime_y_h = "0001-01-01 00"
   INSERT INTO lyc_2664(col_datetime_y_h) VALUES(DATETIME(0001-01-01 00)YEAR TO HOUR)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "22. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_h = NULL
   SELECT col_datetime_y_h INTO sel_datetime_y_h FROM lyc_2664 WHERE col_datetime_y_h = DATETIME(0001-01-01 00)YEAR TO HOUR
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "23. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_h       IS NULL   THEN DISPLAY "24. NULL"   ELSE DISPLAY "24. |",sel_datetime_y_h,"|"   END IF

   LET ins_datetime_y_mi = "0001-01-01 00:00"
   INSERT INTO lyc_2664(col_datetime_y_mi) VALUES(DATETIME(0001-01-01 00:00)YEAR TO MINUTE)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "28. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_mi = NULL
   SELECT col_datetime_y_mi INTO sel_datetime_y_mi FROM lyc_2664 WHERE col_datetime_y_mi = DATETIME(0001-01-01 00:00)YEAR TO MINUTE
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "29. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_mi       IS NULL   THEN DISPLAY "30. NULL"   ELSE DISPLAY "30. |",sel_datetime_y_mi,"|"   END IF

   LET ins_datetime_y_s = "0001-01-01 00:00:00"
   INSERT INTO lyc_2664(col_datetime_y_s) VALUES(DATETIME(0001-01-01 00:00:00)YEAR TO SECOND)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "34. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_s = NULL
   SELECT col_datetime_y_s INTO sel_datetime_y_s FROM lyc_2664 WHERE col_datetime_y_s = DATETIME(0001-01-01 00:00:00)YEAR TO SECOND
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "35. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_s       IS NULL   THEN DISPLAY "36. NULL"   ELSE DISPLAY "36. |",sel_datetime_y_s,"|"   END IF

   LET ins_datetime_y_f = "0001-01-01 00:00:00.000"
   INSERT INTO lyc_2664(col_datetime_y_f) VALUES(DATETIME(0001-01-01 00:00:00.000)YEAR TO FRACTION)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "40. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_f = NULL
   SELECT col_datetime_y_f INTO sel_datetime_y_f FROM lyc_2664 WHERE col_datetime_y_f = DATETIME(0001-01-01 00:00:00.000)YEAR TO FRACTION
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "41. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_f       IS NULL   THEN DISPLAY "42. NULL"   ELSE DISPLAY "42. |",sel_datetime_y_f,"|"   END IF

   LET ins_datetime_y_f1 = "0001-01-01 00:00:00.0"
   INSERT INTO lyc_2664(col_datetime_y_f1) VALUES(DATETIME(0001-01-01 00:00:00.0)YEAR TO FRACTION(1))
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "46. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_f1 = NULL
   SELECT col_datetime_y_f1 INTO sel_datetime_y_f1 FROM lyc_2664 WHERE col_datetime_y_f1 = DATETIME(0001-01-01 00:00:00.0)YEAR TO FRACTION(1)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "47. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_f1       IS NULL   THEN DISPLAY "48. NULL"   ELSE DISPLAY "48. |",sel_datetime_y_f1,"|"   END IF

   LET ins_datetime_y_f2 = "0001-01-01 00:00:00.00"
   INSERT INTO lyc_2664(col_datetime_y_f2) VALUES(DATETIME(0001-01-01 00:00:00.00)YEAR TO FRACTION(2))
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "52. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_f2 = NULL
   SELECT col_datetime_y_f2 INTO sel_datetime_y_f2 FROM lyc_2664 WHERE col_datetime_y_f2 = DATETIME(0001-01-01 00:00:00.00)YEAR TO FRACTION(2)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "53. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_f2       IS NULL   THEN DISPLAY "54. NULL"   ELSE DISPLAY "54. |",sel_datetime_y_f2,"|"   END IF
   LET ins_datetime_y_f2 = "9999-12-31 23:59:59.99"
   INSERT INTO lyc_2664(col_datetime_y_f2) VALUES(DATETIME(9999-12-31 23:59:59.99)YEAR TO FRACTION(2))
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "55. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_f2 = NULL
   SELECT col_datetime_y_f2 INTO sel_datetime_y_f2 FROM lyc_2664 WHERE col_datetime_y_f2 = DATETIME(9999-12-31 23:59:59.99)YEAR TO FRACTION(2)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "56. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_f2       IS NULL   THEN DISPLAY "57. NULL"   ELSE DISPLAY "57. |",sel_datetime_y_f2,"|"   END IF

   LET ins_datetime_y_f3 = "0001-01-01 00:00:00.000"
   INSERT INTO lyc_2664(col_datetime_y_f3) VALUES(DATETIME(0001-01-01 00:00:00.000)YEAR TO FRACTION(3))
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "58. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_f3 = NULL
   SELECT col_datetime_y_f3 INTO sel_datetime_y_f3 FROM lyc_2664 WHERE col_datetime_y_f3 = DATETIME(0001-01-01 00:00:00.000)YEAR TO FRACTION(3)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "59. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_f3       IS NULL   THEN DISPLAY "60. NULL"   ELSE DISPLAY "60. |",sel_datetime_y_f3,"|"   END IF

   LET ins_datetime_y_f4 = "0001-01-01 00:00:00.0000"
   INSERT INTO lyc_2664(col_datetime_y_f4) VALUES(DATETIME(0001-01-01 00:00:00.0000)YEAR TO FRACTION(4))
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "64. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_f4 = NULL
   SELECT col_datetime_y_f4 INTO sel_datetime_y_f4 FROM lyc_2664 WHERE col_datetime_y_f4 = DATETIME(0001-01-01 00:00:00.0000)YEAR TO FRACTION(4)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "65. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_f4       IS NULL   THEN DISPLAY "66. NULL"   ELSE DISPLAY "66. |",sel_datetime_y_f4,"|"   END IF

   LET ins_datetime_y_f5 = "0001-01-01 00:00:00.00000"
   INSERT INTO lyc_2664(col_datetime_y_f5) VALUES(DATETIME(0001-01-01 00:00:00.00000)YEAR TO FRACTION(5))
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "70. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_f5 = NULL
   SELECT col_datetime_y_f5 INTO sel_datetime_y_f5 FROM lyc_2664 WHERE col_datetime_y_f5 = DATETIME(0001-01-01 00:00:00.00000)YEAR TO FRACTION(5)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "71. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_f5       IS NULL   THEN DISPLAY "72. NULL"   ELSE DISPLAY "72. |",sel_datetime_y_f5,"|"   END IF

END MAIN

