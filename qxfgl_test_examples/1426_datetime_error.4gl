#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_datetime_y_f5,  sel_datetime_y_f5  DATETIME YEAR TO FRACTION(5),    
      ins_datetime_f_f5,  sel_datetime_f_f5  DATETIME FRACTION TO FRACTION(5)

   WHENEVER ANY ERROR CONTINUE

   DROP TABLE lyc_1412
   CREATE TABLE lyc_1412
   (
    col_datetime_y_f5  DATETIME YEAR TO FRACTION(5),    
    col_datetime_f_f5  DATETIME FRACTION TO FRACTION(5)
   )        

   LET ins_datetime_y_f5 = "9999-12-31 23:59:59.99999"
   INSERT INTO mapping_datetime(col_datetime_y_f5) VALUES(DATETIME(9999-12-31 23:59:59.99999)YEAR TO FRACTION(5))
--   INSERT INTO mapping_datetime(col_datetime_y_f5) VALUES(ins_datetime_y_f5)  --> Ok
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_y_f5 = NULL
   SELECT col_datetime_y_f5 INTO sel_datetime_y_f5 FROM mapping_datetime WHERE col_datetime_y_f5 = DATETIME(9999-12-31 23:59:59.99999)YEAR TO FRACTION(5)
--   SELECT col_datetime_y_f5 INTO sel_datetime_y_f5 FROM mapping_datetime WHERE col_datetime_y_f5 = ins_datetime_y_f5   --> Ok 
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_y_f5       IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_datetime_y_f5,"|"   END IF

   LET ins_datetime_f_f5 = ".99999"
   INSERT INTO mapping_datetime(col_datetime_f_f5) VALUES(DATETIME(.99999)FRACTION TO FRACTION(5))
--   INSERT INTO mapping_datetime(col_datetime_f_f5) VALUES(ins_datetime_f_f5)   --> Ok
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f5 = NULL
   SELECT col_datetime_f_f5 INTO sel_datetime_f_f5 FROM mapping_datetime WHERE col_datetime_f_f5 = DATETIME(.99999)FRACTION TO FRACTION(5)
--   SELECT col_datetime_f_f5 INTO sel_datetime_f_f5 FROM mapping_datetime WHERE col_datetime_f_f5 = ins_datetime_f_f5   --> Ok 
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f5       IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_datetime_f_f5,"|"   END IF

END MAIN

