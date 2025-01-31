#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_lvarchar,      sel_lvarchar       LVARCHAR,  
      ins_lvarchar_1,    sel_lvarchar_1     LVARCHAR(1),
      ins_lvarchar_4000, sel_lvarchar_4000  LVARCHAR(4000),
      i INTEGER

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_1509
   CREATE TABLE lyc_1509
   (col_lvarchar      LVARCHAR,
    col_lvarchar_1    LVARCHAR(1),
    col_lvarchar_4000 LVARCHAR(4000)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "0.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   FOR i = 1 TO 64
      LET ins_lvarchar = ins_lvarchar CLIPPED,"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
   END FOR      
   SQL INSERT INTO lyc_1509(col_lvarchar) VALUES($ins_lvarchar) END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_lvarchar = NULL
   SQL SELECT col_lvarchar INTO $sel_lvarchar FROM lyc_1509 WHERE col_lvarchar = $ins_lvarchar END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_lvarchar       IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_lvarchar,"|"   END IF

   LET ins_lvarchar_1 = "a"
   DELETE FROM lyc_1509
   SQL INSERT INTO lyc_1509(col_lvarchar_1) VALUES($ins_lvarchar_1) END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_lvarchar_1 = NULL
   SQL SELECT col_lvarchar_1 INTO $sel_lvarchar_1 FROM lyc_1509 WHERE col_lvarchar_1 = $ins_lvarchar_1 END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_lvarchar_1     IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_lvarchar_1,"|"   END IF

   FOR i = 1 TO 16
      LET ins_lvarchar_4000 = ins_lvarchar_4000 CLIPPED,"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
   END FOR      
   DELETE FROM lyc_1509
   SQL INSERT INTO lyc_1509(col_lvarchar_4000) VALUES($ins_lvarchar_4000) END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_lvarchar_4000 = NULL
   SQL SELECT col_lvarchar_4000 INTO $sel_lvarchar_4000 FROM lyc_1509 WHERE col_lvarchar_4000 = $ins_lvarchar_4000 END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_lvarchar_4000 IS NULL   THEN DISPLAY "9.  NULL"   ELSE DISPLAY "9.  |",sel_lvarchar_4000,"|"   END IF

END MAIN
