#########################################################################################################################################
# Authtor Bondar A.G.
#########################################################################################################################################
DATABASE stores

MAIN
   DEFINE
      v_int INTEGER

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_0714_2
   CREATE TABLE lyc_0714_2
   (
    col_bigserial BIGSERIAL(1000)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   INSERT INTO lyc_0714_2 VALUES(0)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET v_int = 0
   INSERT INTO lyc_0714_2 VALUES(v_int)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   
   LET v_int = NULL
   SELECT col_bigserial INTO v_int FROM lyc_0714_2 WHERE  col_bigserial = 1000
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF v_int  IS NULL THEN DISPLAY "5.  NULL"   ELSE DISPLAY "5.",v_int END IF
   LET v_int = NULL
   SELECT col_bigserial INTO v_int FROM lyc_0714_2 WHERE  col_bigserial = 1001
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF v_int  IS NULL THEN DISPLAY "7.  NULL"   ELSE DISPLAY "7.",v_int END IF

END MAIN
