###########################################################################################################################
# The test case must execute on connection to all ODBC RDBMS. Tests the correctness of the created table attributes and the accuracy 
# of data recorded into the table.
# Author: Bondar A.G.
###########################################################################################################################
# bug 16310
DATABASE stores
   DEFINE
      v_boolean_1,
      v_boolean_2,
      v_boolean_3,
      v_boolean_4, 
      v_boolean_5,
      v_boolean_6,
      v_boolean_7,
      v_boolean_8 BOOLEAN

MAIN
   DEFINE
      stmt    CHAR(1024),
      cnt,
      exp_cnt INTEGER
      
   WHENEVER ERROR CONTINUE   	
   DROP TABLE tab_boolean
--   WHENEVER ANY ERROR STOP 
   CREATE TABLE tab_boolean
   (
    col_boolean BOOLEAN
   )

   LET exp_cnt    = 0 
   LET cnt        = 0

   #####  TRUE  #####
   LET v_boolean_1 = TRUE
   INSERT INTO tab_boolean VALUES(v_boolean_1)
   LET exp_cnt = exp_cnt + 1
   IF SQLCA.SQLCODE = 0 AND SQLCA.SQLERRD[3] = 1
   THEN LET cnt = cnt + 1
   END IF

   LET v_boolean_2 = 1
   LET stmt = "INSERT INTO tab_boolean VALUES(?)"
   LET exp_cnt = exp_cnt + 1
   IF prep_exec_insert_using(stmt)
   THEN LET cnt = cnt + 1
   END IF

   LET v_boolean_3 = 1
   INSERT INTO tab_boolean VALUES(v_boolean_3)
   LET exp_cnt = exp_cnt + 1
   IF SQLCA.SQLCODE = 0 AND SQLCA.SQLERRD[3] = 1
   THEN LET cnt = cnt + 1
   END IF

   LET v_boolean_4 = "1"
   INSERT INTO tab_boolean VALUES(v_boolean_4)
   LET exp_cnt = exp_cnt + 1
   IF SQLCA.SQLCODE = 0 AND SQLCA.SQLERRD[3] = 1
   THEN LET cnt = cnt + 1
   END IF

   #####  FALSE  #####
   LET v_boolean_5 = FALSE
   INSERT INTO tab_boolean VALUES(v_boolean_5)
   LET exp_cnt = exp_cnt + 1
   IF SQLCA.SQLCODE = 0 AND SQLCA.SQLERRD[3] = 1
   THEN LET cnt = cnt + 1
   END IF

   LET v_boolean_6 = 0
   LET stmt = "INSERT INTO tab_boolean VALUES(?)"
   LET exp_cnt = exp_cnt + 1
   IF prep_exec_insert_using_1(stmt)
   THEN LET cnt = cnt + 1
   END IF

   LET v_boolean_7 = 0
   INSERT INTO tab_boolean VALUES(v_boolean_7)
   LET exp_cnt = exp_cnt + 1
   IF SQLCA.SQLCODE = 0 AND SQLCA.SQLERRD[3] = 1
   THEN LET cnt = cnt + 1
   END IF

   LET v_boolean_8 = "0"
   INSERT INTO tab_boolean VALUES(v_boolean_8)
   LET exp_cnt = exp_cnt + 1
   IF SQLCA.SQLCODE = 0 AND SQLCA.SQLERRD[3] = 1
   THEN LET cnt = cnt + 1
   END IF

   #####  NULL  #####
   INSERT INTO tab_boolean VALUES(NULL)
   LET exp_cnt = exp_cnt + 1
   IF SQLCA.SQLCODE = 0 AND SQLCA.SQLERRD[3] = 1
   THEN LET cnt = cnt + 1
   END IF

   CALL check_inserts(exp_cnt,cnt)
   CALL comparisons(cnt)

END MAIN

FUNCTION comparisons(cnt)
   DEFINE 
      stmt  CHAR(1024),
      cnt, 
      r_cnt INTEGER

   #####  TRUE  #####
   DISPLAY "Testing boolean(column) = boolean(bind)"
   SELECT COUNT(*) INTO r_cnt FROM tab_boolean WHERE tab_boolean.col_boolean = v_boolean_1
   CALL check_count(4,r_cnt)

   DISPLAY "Testing boolean(column) = boolean(bind)"
   LET stmt = "SELECT COUNT(*) FROM tab_boolean WHERE tab_boolean.col_boolean = ?"
   CALL prep_exec_count_using(stmt,4)

   DISPLAY "Testing boolean(column) = boolean(bind)"
   SELECT COUNT(*) INTO r_cnt FROM tab_boolean WHERE tab_boolean.col_boolean = v_boolean_3
   CALL check_count(4,r_cnt)

   DISPLAY "Testing boolean(column) = boolean(bind)"
   SELECT COUNT(*) INTO r_cnt FROM tab_boolean WHERE tab_boolean.col_boolean = v_boolean_4
   CALL check_count(4,r_cnt)

   #####  FALSE  #####
   DISPLAY "Testing boolean(column) = boolean(bind)"
   SELECT COUNT(*) INTO r_cnt FROM tab_boolean WHERE tab_boolean.col_boolean = v_boolean_5
   CALL check_count(4,r_cnt)

   DISPLAY "Testing boolean(column) = boolean(bind)"
   LET stmt = "SELECT COUNT(*) FROM tab_boolean WHERE tab_boolean.col_boolean = ?"
   CALL prep_exec_count_using_1(stmt,4)

   DISPLAY "Testing boolean(column) = boolean(bind)"
   SELECT COUNT(*) INTO r_cnt FROM tab_boolean WHERE tab_boolean.col_boolean = v_boolean_7
   CALL check_count(4,r_cnt)

   DISPLAY "Testing boolean(column) = boolean(bind)"
   SELECT COUNT(*) INTO r_cnt FROM tab_boolean WHERE tab_boolean.col_boolean = v_boolean_8
   CALL check_count(4,r_cnt)

   #####  NULL  #####
   DISPLAY "Testing boolean(column) = NULL"
   SELECT COUNT(*) INTO r_cnt FROM tab_boolean WHERE tab_boolean.col_boolean IS NULL
   CALL check_count(1,r_cnt)

END FUNCTION

FUNCTION prep_exec_insert_using(stmt)
   DEFINE 
      stmt     CHAR(1024),
      ret_code INTEGER

   PREPARE p_insert_using FROM stmt
   EXECUTE p_insert_using USING v_boolean_2

   IF SQLCA.SQLCODE = 0 AND SQLCA.SQLERRD[3] = 1
   THEN LET ret_code = 1
   ELSE LET ret_code = 0
        DISPLAY """prep_exec_insert_using()"",ERROR: ",stmt CLIPPED
   END IF
   RETURN ret_code

END FUNCTION

FUNCTION prep_exec_insert_using_1(stmt)
   DEFINE 
      stmt     CHAR(1024),
      ret_code INTEGER

   PREPARE p_insert_using_1 FROM stmt
   EXECUTE p_insert_using_1 USING v_boolean_6

   IF SQLCA.SQLCODE = 0 AND SQLCA.SQLERRD[3] = 1
   THEN LET ret_code = 1
   ELSE LET ret_code = 0
        DISPLAY """prep_exec_insert_using_1()"",ERROR: ",stmt CLIPPED
   END IF
   RETURN ret_code

END FUNCTION

FUNCTION prep_exec_count_using(stmt, cnt)
   DEFINE 
      stmt  CHAR(1024),
      cnt,
      r_cnt INTEGER

   PREPARE p_count_using FROM stmt
   EXECUTE p_count_using INTO r_cnt USING v_boolean_2 

   IF SQLCA.SQLCODE = 0
   THEN CALL check_count(cnt,r_cnt) 
   ELSE DISPLAY """prep_exec_count_using()"",ERROR: ",stmt CLIPPED
   END IF

END FUNCTION

FUNCTION prep_exec_count_using_1(stmt, cnt)
   DEFINE 
      stmt  CHAR(1024),
      cnt,
      r_cnt INTEGER

   PREPARE p_count_using_1 FROM stmt
   EXECUTE p_count_using_1 INTO r_cnt USING v_boolean_4 

   IF SQLCA.SQLCODE = 0
   THEN CALL check_count(cnt,r_cnt) 
   ELSE DISPLAY """prep_exec_count_using_1()"",ERROR: ",stmt CLIPPED
   END IF

END FUNCTION

FUNCTION check_inserts(exp_cnt,r_cnt)
   DEFINE exp_cnt, 
          r_cnt   INTEGER

   IF exp_cnt <> r_cnt 
   THEN DISPLAY "INSERT: attempted: ", exp_cnt, ", succeeded: ", r_cnt
   END IF

END FUNCTION

FUNCTION check_count(exp_cnt,r_cnt)
   DEFINE 
      exp_cnt,
      r_cnt    INTEGER

   IF exp_cnt <> r_cnt 
   THEN DISPLAY "SELECT COUNT: expected: ", exp_cnt, ", got: ", r_cnt
   END IF

END FUNCTION
