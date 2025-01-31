#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_lvarchar_1,    sel_lvarchar_1    LVARCHAR(1)

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1437
   CREATE TABLE lyc_1437
   (
    col_lvarchar_1    LVARCHAR(1)
--    col_lvarchar_1    LVARCHAR(2)  --> Ok !!!
   )        
   
   LET ins_lvarchar_1 = "ä"
   DISPLAY "1.  |",ins_lvarchar_1,"|"
   INSERT INTO lyc_1437(col_lvarchar_1) VALUES(ins_lvarchar_1)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_lvarchar_1 = NULL
   SELECT col_lvarchar_1 INTO sel_lvarchar_1 FROM lyc_1437 WHERE col_lvarchar_1 = ins_lvarchar_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_lvarchar_1     IS NULL   THEN DISPLAY "4.  NULL"   ELSE DISPLAY "4.  |",sel_lvarchar_1,"|"   END IF

END MAIN
