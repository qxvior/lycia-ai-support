#########################################################################################################################################
# Authtor Bondar A.G.
#########################################################################################################################################
DATABASE stores

MAIN
   DEFINE
      v_big BIGINT
--      v_big INTEGER --> error -989 does not appear

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_0713
   CREATE TABLE lyc_0713
   (
    col_serial8 SERIAL8
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   LET v_big = 0
   INSERT INTO lyc_0713 VALUES(v_big)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   
   LET v_big = NULL
   SELECT col_serial8 INTO v_big FROM lyc_0713 WHERE  col_serial8 = 1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF v_big  IS NULL THEN DISPLAY "5.  NULL"   ELSE DISPLAY "5.",v_big END IF

END MAIN
