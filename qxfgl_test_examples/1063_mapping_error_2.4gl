##########################################################################################################################################
# Author: Bondar A.G.
##########################################################################################################################################
DATABASE stores

MAIN
   DEFINE
      ins_date,   sel_date   LIKE lyc_1063.col_date 

   WHENEVER ANY ERROR CONTINUE
   
   LET ins_date = NULL
   INSERT INTO lyc_1063(col_date) VALUES(ins_date)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_date = "01/01/0001"
   SELECT col_date INTO sel_date FROM lyc_1063 WHERE col_date IS NULL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_date       IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_date,"|"   END IF

   LET ins_date = "01/01/0001"
   INSERT INTO lyc_1063(col_date) VALUES(ins_date)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_date = NULL
   SELECT col_date INTO sel_date FROM lyc_1063 WHERE col_date = ins_date
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_date       IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_date,"|"   END IF
   LET ins_date = "12/31/9999"
   INSERT INTO lyc_1063(col_date) VALUES(ins_date)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_date = NULL
   SELECT col_date INTO sel_date FROM lyc_1063 WHERE col_date = ins_date
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_date       IS NULL   THEN DISPLAY "9.  NULL"   ELSE DISPLAY "9.  |",sel_date,"|"   END IF

   DISPLAY "10. ins_date  ",ins_date.gettypefullname(),  ",         sel_date  ", sel_date.gettypefullname() 

END MAIN