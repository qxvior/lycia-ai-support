###########################################################################################################################
# The test case must execute on connection to any DBMS. Tests the correctness of the created table attributes and the accuracy of data recorded into the table. 
# Author: Bondar A.G.
###########################################################################################################################
# bug 16696,16819,16820
DATABASE stores
   DEFINE
      v_bigint_min,
      v_bigint_max,
      v_bigint_null LIKE tab_bigint.col_bigint

MAIN
   DEFINE
      stmt    CHAR(1024),
      cnt,
      exp_cnt INTEGER
      
   WHENEVER ERROR CONTINUE   	

   DELETE FROM tab_bigint

   LET exp_cnt = 0 
   LET cnt     = 0
 
   LET v_bigint_min  = -9223372036854775807
   LET v_bigint_max  =  9223372036854775807 
   LET v_bigint_null = NULL
   
   INSERT INTO tab_bigint(col_bigint) VALUES(v_bigint_min)  
   LET exp_cnt = exp_cnt + 1
   IF SQLCA.SQLCODE = 0 AND SQLCA.SQLERRD[3] = 1
   THEN LET cnt = cnt + 1
   END IF

   LET stmt = "INSERT INTO tab_bigint(col_bigint) VALUES(",v_bigint_max,")"
   LET exp_cnt = exp_cnt + 1
   IF prep_exec_insert(stmt)
   THEN LET cnt = cnt + 1
   END IF

   INSERT INTO tab_bigint(col_bigint) VALUES(v_bigint_null)  
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

   DISPLAY "Testing BIGINT(column) = BIGINT(bind)"
   SELECT COUNT(*) INTO r_cnt FROM tab_bigint WHERE tab_bigint.col_bigint = v_bigint_min
   CALL check_count(1,r_cnt)

   DISPLAY "Testing BIGINT(column) = BIGINT(literal)"
   LET stmt = "SELECT COUNT(*) FROM tab_bigint WHERE tab_bigint.col_bigint = ",v_bigint_max
   CALL prep_exec_count(stmt,1)

   DISPLAY "Testing BIGINT(column) = BIGINT(bind)"
   SELECT COUNT(*) INTO r_cnt FROM tab_bigint WHERE tab_bigint.col_bigint IS NULL
   CALL check_count(1,r_cnt)

END FUNCTION

FUNCTION prep_exec_insert(stmt)
   DEFINE 
      stmt     CHAR(1024),
      ret_code INTEGER

   PREPARE p_insert FROM stmt
   EXECUTE p_insert

   IF SQLCA.SQLCODE = 0 AND SQLCA.SQLERRD[3] = 1
   THEN LET ret_code = 1
   ELSE LET ret_code = 0
        DISPLAY """prep_exec_insert()"",ERROR: ",stmt CLIPPED
   END IF
   RETURN ret_code

END FUNCTION

FUNCTION prep_exec_count(stmt, cnt)
   DEFINE 
      stmt  CHAR(1024),
      cnt,
      r_cnt INTEGER

   PREPARE p_count FROM stmt
   EXECUTE p_count INTO r_cnt

   IF SQLCA.SQLCODE = 0
   THEN CALL check_count(cnt,r_cnt) 
   ELSE DISPLAY """prep_exec_count()"",ERROR: ",stmt CLIPPED
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
