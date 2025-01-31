#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_nvarchar, sel_nvarchar  NVARCHAR(2000),
      i INTEGER

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_1515
   CREATE TABLE lyc_1515
   (col_nvarchar NVARCHAR(2000)
   )

   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   FOR i = 1 TO 4  --> error -999 appears
--   FOR i = 1 TO 2  --> Ok !!!
      LET ins_nvarchar = ins_nvarchar CLIPPED,"ääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääää"
   END FOR      

   INSERT INTO lyc_1515 VALUES(ins_nvarchar)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_nvarchar = NULL
   SELECT col_nvarchar INTO sel_nvarchar FROM lyc_1515 WHERE col_nvarchar = ins_nvarchar
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_nvarchar IS NULL   THEN DISPLAY "4.  NULL"   ELSE DISPLAY "4.  |",sel_nvarchar,"|"   END IF

END MAIN
