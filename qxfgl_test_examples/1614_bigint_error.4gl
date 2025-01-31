#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################

DATABASE stores

MAIN
   DEFINE
      ins_bigint,  sel_bigint  BIGINT,   
      stmt CHAR(1024)

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_1614
   CREATE TABLE lyc_1614
   (
    col_bigint BIGINT
   )

   LET ins_bigint = -9223372036854775807
   LET stmt = "INSERT INTO lyc_1614(col_bigint) VALUES(""",ins_bigint,""")"
   PREPARE p_stmt_1 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_bigint = NULL
   LET stmt = "SELECT col_bigint FROM lyc_1614 WHERE col_bigint = """,ins_bigint,""""
   PREPARE p_stmt_2 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_2 INTO sel_bigint
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_bigint       IS NULL   THEN DISPLAY "5.  NULL"   ELSE DISPLAY "5.  |",sel_bigint,"|"   END IF

END MAIN
