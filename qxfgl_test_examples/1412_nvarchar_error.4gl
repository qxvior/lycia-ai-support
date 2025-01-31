#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_nvarchar_1,    sel_nvarchar_1    NVARCHAR(1)

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1412
   CREATE TABLE lyc_1412
   (
    col_nvarchar_1    NVARCHAR(1)
--    col_nvarchar_1    NVARCHAR(2)  --> Ok !!!
   )        
   
   LET ins_nvarchar_1 = "ä"
   DISPLAY "1.  |",ins_nvarchar_1,"|"
   INSERT INTO lyc_1412(col_nvarchar_1) VALUES(ins_nvarchar_1)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_nvarchar_1 = NULL
   SELECT col_nvarchar_1 INTO sel_nvarchar_1 FROM lyc_1412 WHERE col_nvarchar_1 = ins_nvarchar_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_nvarchar_1     IS NULL   THEN DISPLAY "4.  NULL"   ELSE DISPLAY "4.  |",sel_nvarchar_1,"|"   END IF

END MAIN
