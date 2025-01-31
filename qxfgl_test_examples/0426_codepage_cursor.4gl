DATABASE stores
MAIN
  DEFINE lfname CHAR(25),
         llname CHAR(25),
         lLycEnv RECORD LIKE customer.*,
         lMes CHAR(128)
        
 LET lfname = "Ludwig"
 LET llname = "Pauli"
  
 DECLARE lycglobal1_cur CURSOR FOR
   SELECT * FROM customer
    WHERE @fname = lfname
      AND @lname = llname
 FOREACH lycglobal1_cur INTO lLycEnv.*
      LET lMes = "From cur1: ", lLycEnv.fname CLIPPED, ":",lLycEnv.lname  
       DISPLAY  lMes
  END FOREACH


 DECLARE lycglobal2_cur CURSOR FOR  
   SELECT * FROM customer
    WHERE @fname = "Ludwig"
      AND @lname = "Pauli"
 FOREACH lycglobal2_cur INTO lLycEnv.*
      LET lMes = "From cur2: ", lLycEnv.fname CLIPPED, ":",lLycEnv.lname
       DISPLAY  lMes          
  END FOREACH
 
END MAIN