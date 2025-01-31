MAIN
  DEFINE var_bool,err_fl BOOLEAN = NULL
  DEFINE var_int INTEGER = NULL
  DEFINE var_char CHAR = NULL
    
  LET err_fl = FALSE
  
  IF var_bool IS NOT NULL THEN LET err_fl = TRUE END IF
  IF var_int  IS NOT NULL THEN LET err_fl = TRUE END IF
  IF var_char IS NOT NULL THEN LET err_fl = TRUE END IF
  
  IF err_fl THEN DISPLAY "FAILED" ELSE DISPLAY "PASSED" END IF
END MAIN