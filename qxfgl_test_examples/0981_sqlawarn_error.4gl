##############################################################################################################
# Author: Bondar A.G.
##############################################################################################################
DATABASE stores
MAIN
   DEFINE
      v_char_9    CHAR(9)

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_0981
   CREATE TABLE lyc_0981
   (col_char_10    CHAR(10),
    col_varchar_10 VARCHAR(10)
   )

   INSERT INTO lyc_0981 VALUES("123","123")

   WHENEVER WARNING CONTINUE
   SELECT col_char_10 INTO v_char_9 FROM lyc_0981
   DISPLAY "1. WHENEVER ERROR CONTINUE   ",status,sqlca.sqlcode,sqlca.sqlerrd[3],sqlca.sqlawarn

   SELECT col_varchar_10 INTO v_char_9 FROM lyc_0981
   DISPLAY "2. WHENEVER ERROR CONTINUE   ",status,sqlca.sqlcode,sqlca.sqlerrd[3],sqlca.sqlawarn

   WHENEVER WARNING GOTO lab_1
   SELECT col_char_10 INTO v_char_9 FROM lyc_0981
   LABEL lab_1:
   DISPLAY "3. WHENEVER ERROR GOTO lab_1 ", status,sqlca.sqlcode,sqlca.sqlerrd[3],sqlca.sqlawarn

   WHENEVER WARNING GOTO lab_2
   SELECT col_varchar_10 INTO v_char_9 FROM lyc_0981
   LABEL lab_2:
   DISPLAY "4. WHENEVER ERROR GOTO lab_2 ", status,sqlca.sqlcode,sqlca.sqlerrd[3],sqlca.sqlawarn

   END MAIN
