#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################

DATABASE stores

MAIN
   DEFINE
      ins_boolean,  sel_boolean  BOOLEAN  

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_1580
   CREATE TABLE lyc_1580
   (
    col_boolean BOOLEAN
   )
   
   LET ins_boolean = TRUE
   INSERT INTO lyc_1580(col_boolean) VALUES(ins_boolean)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_boolean = NULL
   SELECT col_boolean INTO sel_boolean FROM lyc_1580 WHERE col_boolean = ins_boolean
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_boolean       IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_boolean,"|"   END IF

   LET ins_boolean = FALSE
   INSERT INTO lyc_1580(col_boolean) VALUES(ins_boolean)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_boolean = NULL
   SELECT col_boolean INTO sel_boolean FROM lyc_1580 WHERE col_boolean = ins_boolean
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_boolean       IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_boolean,"|"   END IF

END MAIN

