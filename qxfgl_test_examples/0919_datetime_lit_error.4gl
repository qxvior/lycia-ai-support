#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores

MAIN
   DEFINE
      ins_datetime_y_f5,  sel_datetime_y_f5  DATETIME YEAR     TO FRACTION(5),    
      ins_datetime_mo_f5, sel_datetime_mo_f5 DATETIME MONTH    TO FRACTION(5),
      ins_datetime_d_f5,  sel_datetime_d_f5  DATETIME DAY      TO FRACTION(5),
      ins_datetime_h_f5,  sel_datetime_h_f5  DATETIME HOUR     TO FRACTION(5),            
      ins_datetime_mi_f5, sel_datetime_mi_f5 DATETIME MINUTE   TO FRACTION(5),
      ins_datetime_s_f5,  sel_datetime_s_f5  DATETIME SECOND   TO FRACTION(5),      
      ins_datetime_f_f5,  sel_datetime_f_f5  DATETIME FRACTION TO FRACTION(5)

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_0919
   CREATE TABLE lyc_0919
   (
      col_datetime_y_f5  DATETIME YEAR     TO FRACTION(5),    
      col_datetime_mo_f5 DATETIME MONTH    TO FRACTION(5),
      col_datetime_d_f5  DATETIME DAY      TO FRACTION(5),
      col_datetime_h_f5  DATETIME HOUR     TO FRACTION(5),            
      col_datetime_mi_f5 DATETIME MINUTE   TO FRACTION(5),
      col_datetime_s_f5  DATETIME SECOND   TO FRACTION(5),      
      col_datetime_f_f5  DATETIME FRACTION TO FRACTION(5)
    )  

   LET ins_datetime_y_f5 = "9999-12-31 23:59:59.99999"
   INSERT INTO lyc_0919(col_datetime_y_f5) VALUES(DATETIME(9999-12-31 23:59:59.99999)YEAR TO FRACTION(5))
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_f5 = NULL
   SELECT col_datetime_y_f5 INTO sel_datetime_y_f5 FROM lyc_0919 WHERE col_datetime_y_f5 = DATETIME(9999-12-31 23:59:59.99999)YEAR TO FRACTION(5)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_f5       IS NULL   THEN DISPLAY "3 . NULL"   ELSE DISPLAY "3.  |",sel_datetime_y_f5,"|"   END IF

   LET ins_datetime_mo_f5 = "12-31 23:59:59.99999"
   INSERT INTO lyc_0919(col_datetime_mo_f5) VALUES(DATETIME(12-31 23:59:59.99999)MONTH TO FRACTION(5))
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4 . SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_mo_f5 = NULL
   SELECT col_datetime_mo_f5 INTO sel_datetime_mo_f5 FROM lyc_0919 WHERE col_datetime_mo_f5 = DATETIME(12-31 23:59:59.99999)MONTH TO FRACTION(5)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_mo_f5       IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_datetime_mo_f5,"|"   END IF

   LET ins_datetime_d_f5 = "28 23:59:59.99999"
   INSERT INTO lyc_0919(col_datetime_d_f5) VALUES(DATETIME(28 23:59:59.99999) DAY TO FRACTION(5))
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_d_f5 = NULL
   SELECT col_datetime_d_f5 INTO sel_datetime_d_f5 FROM lyc_0919 WHERE col_datetime_d_f5 = DATETIME(28 23:59:59.99999) DAY TO FRACTION(5)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_d_f5       IS NULL   THEN DISPLAY "9.  NULL"   ELSE DISPLAY "9.  |",sel_datetime_d_f5,"|"   END IF

   LET ins_datetime_h_f5 = "23:59:59.99999"
   INSERT INTO lyc_0919(col_datetime_h_f5) VALUES(DATETIME(23:59:59.99999)HOUR TO FRACTION(5))
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_h_f5 = NULL
   SELECT col_datetime_h_f5 INTO sel_datetime_h_f5 FROM lyc_0919 WHERE col_datetime_h_f5 = DATETIME(23:59:59.99999)HOUR TO FRACTION(5)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_h_f5       IS NULL   THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",sel_datetime_h_f5,"|"   END IF

   LET ins_datetime_mi_f5 = "59:59.99999"
   INSERT INTO lyc_0919(col_datetime_mi_f5) VALUES(DATETIME(59:59.99999)MINUTE TO FRACTION(5))
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "13. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_mi_f5 = NULL
   SELECT col_datetime_mi_f5 INTO sel_datetime_mi_f5 FROM lyc_0919 WHERE col_datetime_mi_f5 = DATETIME(59:59.99999)MINUTE TO FRACTION(5)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "14. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_mi_f5       IS NULL   THEN DISPLAY "15. NULL"   ELSE DISPLAY "15. |",sel_datetime_mi_f5,"|"   END IF

   LET ins_datetime_s_f5 = "59.99999"
   INSERT INTO lyc_0919(col_datetime_s_f5) VALUES(DATETIME(59.99999)SECOND TO FRACTION(5))
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "16. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_s_f5 = NULL
   SELECT col_datetime_s_f5 INTO sel_datetime_s_f5 FROM lyc_0919 WHERE col_datetime_s_f5 = DATETIME(59.99999)SECOND TO FRACTION(5)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "17. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_s_f5       IS NULL   THEN DISPLAY "18. NULL"   ELSE DISPLAY "18. |",sel_datetime_s_f5,"|"   END IF

   LET ins_datetime_f_f5 = ".99999"
   INSERT INTO lyc_0919(col_datetime_f_f5) VALUES(DATETIME(.99999)FRACTION TO FRACTION(5))
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "19. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f5 = NULL
   SELECT col_datetime_f_f5 INTO sel_datetime_f_f5 FROM lyc_0919 WHERE col_datetime_f_f5 = DATETIME(.99999)FRACTION TO FRACTION(5)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "20. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f5       IS NULL   THEN DISPLAY "21. NULL"   ELSE DISPLAY "21. |",sel_datetime_f_f5,"|"   END IF

END MAIN

