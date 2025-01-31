globals
   DEFINE
      pr_sqlerrd1 integer
END globals

MAIN
  CALL func()
END MAIN


FUNCTION func()
  DEFINE i, pr_sqlerrd integer 
  LET i = 4
  IF i = 1 THEN
    LET pr_sqlerrd = pr_sqlerrd1
  END IF
END FUNCTION