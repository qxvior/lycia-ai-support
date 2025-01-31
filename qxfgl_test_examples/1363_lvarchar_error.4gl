#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_lvarchar, sel_lvarchar LVARCHAR

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1363
   CREATE TABLE lyc_1363
   (
    col_lvarchar LVARCHAR(80)
   )

   LET ins_lvarchar = NULL
   INSERT INTO lyc_1363 VALUES(ins_lvarchar)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   LET sel_lvarchar = "?"
   SELECT col_lvarchar INTO sel_lvarchar FROM lyc_1363 WHERE col_lvarchar IS NULL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_lvarchar       IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_lvarchar,"|"   END IF

END MAIN
