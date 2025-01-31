#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores

MAIN
   DEFINE
      ins_interval_y9_mo,  sel_interval_y9_mo  INTERVAL YEAR(9) TO MONTH,
      ins_interval_mo9_mo, sel_interval_mo9_mo INTERVAL MONTH(9) TO MONTH,   
      ins_interval_d9_d,   sel_interval_d9_d   INTERVAL DAY(9) TO DAY,        
      ins_interval_d9_f1,  sel_interval_d9_f1  INTERVAL DAY(9) TO FRACTION(1), 
      ins_interval_d9_f2,  sel_interval_d9_f2  INTERVAL DAY(9) TO FRACTION(2),
      ins_interval_d9_f3,  sel_interval_d9_f3  INTERVAL DAY(9) TO FRACTION(3),  
      ins_interval_d9_f4,  sel_interval_d9_f4  INTERVAL DAY(9) TO FRACTION(4),    
      ins_interval_d9_f5,  sel_interval_d9_f5  INTERVAL DAY(9) TO FRACTION(5), 
      ins_interval_h9_f4,  sel_interval_h9_f4  INTERVAL HOUR(9) TO FRACTION(4),    
      ins_interval_h9_f5,  sel_interval_h9_f5  INTERVAL HOUR(9) TO FRACTION(5),
      ins_interval_mi9_f5, sel_interval_mi9_f5 INTERVAL MINUTE(9) TO FRACTION(5)

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1119
   CREATE TABLE lyc_1119
   (    
    col_interval_y9_mo  INTERVAL YEAR(9) TO MONTH,       
    col_interval_mo9_mo INTERVAL MONTH(9) TO MONTH,      
    col_interval_d9_d   INTERVAL DAY(9) TO DAY,          
    col_interval_d9_f1  INTERVAL DAY(9) TO FRACTION(1),  
    col_interval_d9_f2  INTERVAL DAY(9) TO FRACTION(2),  
    col_interval_d9_f3  INTERVAL DAY(9) TO FRACTION(3),  
    col_interval_d9_f4  INTERVAL DAY(9) TO FRACTION(4),  
    col_interval_d9_f5  INTERVAL DAY(9) TO FRACTION(5),  
    col_interval_h9_f4  INTERVAL HOUR(9) TO FRACTION(4), 
    col_interval_h9_f5  INTERVAL HOUR(9) TO FRACTION(5), 
    col_interval_mi9_f5 INTERVAL MINUTE(9) TO FRACTION(5)
   )

   LET ins_interval_y9_mo = "-999999999-11"
   INSERT INTO lyc_1119(col_interval_y9_mo) VALUES(ins_interval_y9_mo)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_y9_mo = NULL
   SELECT col_interval_y9_mo INTO sel_interval_y9_mo FROM lyc_1119 WHERE col_interval_y9_mo = ins_interval_y9_mo
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_y9_mo       IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_interval_y9_mo,"|"   END IF

   LET ins_interval_mo9_mo = "999999999"
   INSERT INTO lyc_1119(col_interval_mo9_mo) VALUES(ins_interval_mo9_mo)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_mo9_mo = NULL
   SELECT col_interval_mo9_mo INTO sel_interval_mo9_mo FROM lyc_1119 WHERE col_interval_mo9_mo = ins_interval_mo9_mo
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_mo9_mo       IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_interval_mo9_mo,"|"   END IF

   LET ins_interval_d9_d = "-999999999"
   INSERT INTO lyc_1119(col_interval_d9_d) VALUES(ins_interval_d9_d)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d9_d = NULL
   SELECT col_interval_d9_d INTO sel_interval_d9_d FROM lyc_1119 WHERE col_interval_d9_d = ins_interval_d9_d
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d9_d       IS NULL   THEN DISPLAY "9.  NULL"   ELSE DISPLAY "9.  |",sel_interval_d9_d,"|"   END IF

   LET ins_interval_d9_f1 = "999999999 23:59:59.9"
   INSERT INTO lyc_1119(col_interval_d9_f1) VALUES(ins_interval_d9_f1)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d9_f1 = NULL
   SELECT col_interval_d9_f1 INTO sel_interval_d9_f1 FROM lyc_1119 WHERE col_interval_d9_f1 = ins_interval_d9_f1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d9_f1       IS NULL   THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",sel_interval_d9_f1,"|"   END IF
 
   LET ins_interval_d9_f2 = "999999999 23:59:59.99"
   INSERT INTO lyc_1119(col_interval_d9_f2) VALUES(ins_interval_d9_f2)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "13. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d9_f2 = NULL
   SELECT col_interval_d9_f2 INTO sel_interval_d9_f2 FROM lyc_1119 WHERE col_interval_d9_f2 = ins_interval_d9_f2
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "14. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d9_f2       IS NULL   THEN DISPLAY "15. NULL"   ELSE DISPLAY "15. |",sel_interval_d9_f2,"|"   END IF

   LET ins_interval_d9_f3 = "999999999 23:59:59.999"
   INSERT INTO lyc_1119(col_interval_d9_f3) VALUES(ins_interval_d9_f3)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "16. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d9_f3 = NULL
   SELECT col_interval_d9_f3 INTO sel_interval_d9_f3 FROM lyc_1119 WHERE col_interval_d9_f3 = ins_interval_d9_f3
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "17. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d9_f3       IS NULL   THEN DISPLAY "18. NULL"   ELSE DISPLAY "18. |",sel_interval_d9_f3,"|"   END IF

   LET ins_interval_d9_f4 = "999999999 23:59:59.9999"
   INSERT INTO lyc_1119(col_interval_d9_f4) VALUES(ins_interval_d9_f4)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "19. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d9_f4 = NULL
   SELECT col_interval_d9_f4 INTO sel_interval_d9_f4 FROM lyc_1119 WHERE col_interval_d9_f4 = ins_interval_d9_f4
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "20. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d9_f4       IS NULL   THEN DISPLAY "21. NULL"   ELSE DISPLAY "21. |",sel_interval_d9_f4,"|"   END IF

   LET ins_interval_d9_f5 = "999999999 23:59:59.99999"
   INSERT INTO lyc_1119(col_interval_d9_f5) VALUES(ins_interval_d9_f5)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "22. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d9_f5 = NULL
   SELECT col_interval_d9_f5 INTO sel_interval_d9_f5 FROM lyc_1119 WHERE col_interval_d9_f5 = ins_interval_d9_f5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "23. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d9_f5       IS NULL   THEN DISPLAY "24. NULL"   ELSE DISPLAY "24. |",sel_interval_d9_f5,"|"   END IF

   LET ins_interval_h9_f4 = "999999999:59:59.9999"
   INSERT INTO lyc_1119(col_interval_h9_f4) VALUES(ins_interval_h9_f4)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "25. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_h9_f4 = NULL
   SELECT col_interval_h9_f4 INTO sel_interval_h9_f4 FROM lyc_1119 WHERE col_interval_h9_f4 = ins_interval_h9_f4
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "26. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_h9_f4       IS NULL   THEN DISPLAY "27. NULL"   ELSE DISPLAY "27. |",sel_interval_h9_f4,"|"   END IF

   LET ins_interval_h9_f5 = "999999999:59:59.99999"
   INSERT INTO lyc_1119(col_interval_h9_f5) VALUES(ins_interval_h9_f5)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "28. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_h9_f5 = NULL
   SELECT col_interval_h9_f5 INTO sel_interval_h9_f5 FROM lyc_1119 WHERE col_interval_h9_f5 = ins_interval_h9_f5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "29. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_h9_f5       IS NULL   THEN DISPLAY "30. NULL"   ELSE DISPLAY "30. |",sel_interval_h9_f5,"|"   END IF

   LET ins_interval_mi9_f5 = "999999999:59.99999"
   INSERT INTO lyc_1119(col_interval_mi9_f5) VALUES(ins_interval_mi9_f5)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "31. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_mi9_f5 = NULL
   SELECT col_interval_mi9_f5 INTO sel_interval_mi9_f5 FROM lyc_1119 WHERE col_interval_mi9_f5 = ins_interval_mi9_f5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "32. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_mi9_f5       IS NULL   THEN DISPLAY "33. NULL"   ELSE DISPLAY "33. |",sel_interval_mi9_f5,"|"   END IF

END MAIN
