#########################################################################################################################################
# Tests correct application of the table-level UNIQUE/DISTINCT constraint with the ENABLED option.
# Author: Bondar A.G.
#########################################################################################################################################

DATABASE stores_demo

MAIN
   DEFINE
      err_code INTEGER

   WHENEVER ERROR CONTINUE
      DROP TABLE tab_test_unique_enabled
--   WHENEVER ERROR STOP

   CREATE TABLE tab_test_unique_enabled
   (
    col_integer INTEGER,
    col_char    CHAR(25),
    col_date    DATE,  
    UNIQUE (col_integer,col_char) CONSTRAINT zu_col_integer_char ENABLED
   )

   INSERT INTO tab_test_unique_enabled(col_integer,col_char) VALUES(NULL,NULL)
   LET err_code = SQLCA.SQLCODE
   DISPLAY "SQLCA.SQLCODE = ",err_code
   INSERT INTO tab_test_unique_enabled(col_integer,col_char) VALUES(NULL,NULL)
   LET err_code = SQLCA.SQLCODE
   DISPLAY "SQLCA.SQLCODE = ",err_code

   INSERT INTO tab_test_unique_enabled(col_integer,col_char) VALUES(1,"1")
   LET err_code = SQLCA.SQLCODE
   DISPLAY "SQLCA.SQLCODE = ",err_code
   INSERT INTO tab_test_unique_enabled(col_integer,col_char) VALUES(1,"1")
   LET err_code = SQLCA.SQLCODE
   DISPLAY "SQLCA.SQLCODE = ",err_code

   INSERT INTO tab_test_unique_enabled(col_integer,col_char) VALUES(1," ")
   LET err_code = SQLCA.SQLCODE
   DISPLAY "SQLCA.SQLCODE = ",err_code
   INSERT INTO tab_test_unique_enabled(col_integer,col_char) VALUES(1,"    ")
   LET err_code = SQLCA.SQLCODE
   DISPLAY "SQLCA.SQLCODE = ",err_code

  -- DROP TABLE tab_test_unique_enabled
END MAIN
