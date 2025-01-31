#########################################################################################################################################
# # Author Bondar A.G.
#########################################################################################################################################

DATABASE stores

MAIN
   DEFINE
      ins_interval_y_y,   sel_interval_y_y   INTERVAL YEAR TO YEAR,    
      ins_interval_y_mo,  sel_interval_y_mo  INTERVAL YEAR TO MONTH,   
      ins_interval_mo_mo, sel_interval_mo_mo INTERVAL MONTH TO MONTH,  

      ins_interval_d_d,   sel_interval_d_d   INTERVAL DAY TO DAY,
      ins_interval_d9_h,  sel_interval_d9_h  INTERVAL DAY(9) TO HOUR,
      ins_interval_d_mi,  sel_interval_d_mi  INTERVAL DAY TO MINUTE,   
      ins_interval_d9_s,  sel_interval_d9_s  INTERVAL DAY(9) TO SECOND,
      ins_interval_d_f,   sel_interval_d_f   INTERVAL DAY TO FRACTION,   
      
      ins_interval_h_h,   sel_interval_h_h   INTERVAL HOUR TO HOUR,       
      ins_interval_h9_mi, sel_interval_h9_mi INTERVAL HOUR(9) TO MINUTE,     
      ins_interval_h_s,   sel_interval_h_s   INTERVAL HOUR TO SECOND,     
      ins_interval_h9_f,  sel_interval_h9_f  INTERVAL HOUR(9) TO FRACTION,   
      stmt CHAR(1024)

   WHENEVER ANY ERROR CONTINUE

   DROP TABLE lyc_0692
   CREATE TABLE lyc_0692
   ( 
    col_interval_y_y    INTERVAL YEAR TO YEAR,    
    col_interval_y_mo   INTERVAL YEAR TO MONTH,   
    col_interval_mo_mo  INTERVAL MONTH TO MONTH,  

    col_interval_d_d    INTERVAL DAY TO DAY,
    col_interval_d9_h   INTERVAL DAY(9) TO HOUR,
    col_interval_d_mi   INTERVAL DAY TO MINUTE,   
    col_interval_d9_s   INTERVAL DAY(9) TO SECOND,
    col_interval_d_f    INTERVAL DAY TO FRACTION,   

    col_interval_h_h    INTERVAL HOUR TO HOUR,       
    col_interval_h9_mi  INTERVAL HOUR(9) TO MINUTE,     
    col_interval_h_s    INTERVAL HOUR TO SECOND,     
    col_interval_h9_f   INTERVAL HOUR(9) TO FRACTION   
   )   

   LET ins_interval_y_y = "9999" 
   LET stmt = "INSERT INTO lyc_0692(col_interval_y_y) VALUES(?)"
   PREPARE p_stmt_1 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_1 USING ins_interval_y_y
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_y_y = NULL
   LET stmt = "SELECT col_interval_y_y FROM lyc_0692 WHERE col_interval_y_y = ?"
   PREPARE p_stmt_2 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_2  USING ins_interval_y_y INTO sel_interval_y_y
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_y_y       IS NULL   THEN DISPLAY "5.  NULL"   ELSE DISPLAY "5.  |",sel_interval_y_y,"|"   END IF

   LET ins_interval_y_mo = "9999-11" 
   LET stmt = "INSERT INTO lyc_0692(col_interval_y_mo) VALUES(?)"
   PREPARE p_stmt_3 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_3 USING ins_interval_y_mo
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_y_mo = NULL
   LET stmt = "SELECT col_interval_y_mo FROM lyc_0692 WHERE col_interval_y_mo = ?"
   PREPARE p_stmt_4 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_4  USING ins_interval_y_mo INTO sel_interval_y_mo
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_y_mo       IS NULL   THEN DISPLAY "10. NULL"   ELSE DISPLAY "10. |",sel_interval_y_mo,"|"   END IF

   LET ins_interval_mo_mo = "99" 
   LET stmt = "INSERT INTO lyc_0692(col_interval_mo_mo) VALUES(?)"
   PREPARE p_stmt_5 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_5 USING ins_interval_mo_mo
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "12. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_mo_mo = NULL
   LET stmt = "SELECT col_interval_mo_mo FROM lyc_0692 WHERE col_interval_mo_mo = ?"
   PREPARE p_stmt_6 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "13. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_6  USING ins_interval_mo_mo INTO sel_interval_mo_mo
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "14. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_mo_mo       IS NULL   THEN DISPLAY "15. NULL"   ELSE DISPLAY "15. |",sel_interval_mo_mo,"|"   END IF

   LET ins_interval_d_d = "99" 
   LET stmt = "INSERT INTO lyc_0692(col_interval_d_d) VALUES(?)"
   PREPARE p_stmt_7 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "16. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_7 USING ins_interval_d_d
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "17. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d_d = NULL
   LET stmt = "SELECT col_interval_d_d FROM lyc_0692 WHERE col_interval_d_d = ?"
   PREPARE p_stmt_8 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "18. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_8  USING ins_interval_d_d INTO sel_interval_d_d
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "19. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d_d       IS NULL   THEN DISPLAY "20. NULL"   ELSE DISPLAY "20. |",sel_interval_d_d,"|"   END IF

   LET ins_interval_d9_h = "123456789 23" 
   LET stmt = "INSERT INTO lyc_0692(col_interval_d9_h) VALUES(?)"
   PREPARE p_stmt_9 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "21. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_9 USING ins_interval_d9_h
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "22. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d9_h = NULL
   LET stmt = "SELECT col_interval_d9_h FROM lyc_0692 WHERE col_interval_d9_h = ?"
   PREPARE p_stmt_10 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "23. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_10 USING ins_interval_d9_h INTO sel_interval_d9_h
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "24. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d9_h       IS NULL   THEN DISPLAY "25. NULL"   ELSE DISPLAY "25. |",sel_interval_d9_h,"|"   END IF

   LET ins_interval_d_mi = "99 23:59" 
   LET stmt = "INSERT INTO lyc_0692(col_interval_d_mi) VALUES(?)"
   PREPARE p_stmt_11 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "26. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_11 USING ins_interval_d_mi
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "27. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d_mi = NULL
   LET stmt = "SELECT col_interval_d_mi FROM lyc_0692 WHERE col_interval_d_mi = ?"
   PREPARE p_stmt_12 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "28. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_12 USING ins_interval_d_mi INTO sel_interval_d_mi
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "29. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d_mi       IS NULL   THEN DISPLAY "30. NULL"   ELSE DISPLAY "30. |",sel_interval_d_mi,"|"   END IF

   LET ins_interval_d9_s = "123456789 23:59:59" 
   LET stmt = "INSERT INTO lyc_0692(col_interval_d9_s) VALUES(?)"
   PREPARE p_stmt_13 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "31. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_13 USING ins_interval_d9_s
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "32. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d9_s = NULL
   LET stmt = "SELECT col_interval_d9_s FROM lyc_0692 WHERE col_interval_d9_s = ?"
   PREPARE p_stmt_14 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "33. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_14 USING ins_interval_d9_s INTO sel_interval_d9_s
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "34. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d9_s       IS NULL   THEN DISPLAY "35. NULL"   ELSE DISPLAY "35. |",sel_interval_d9_s,"|"   END IF

   LET ins_interval_d_f = "99 23:59:59.999" 
   LET stmt = "INSERT INTO lyc_0692(col_interval_d_f) VALUES(?)"
   PREPARE p_stmt_15 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "36. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_15 USING ins_interval_d_f
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "37. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d_f = NULL
   LET stmt = "SELECT col_interval_d_f FROM lyc_0692 WHERE col_interval_d_f = ?"
   PREPARE p_stmt_16 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "38. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_16 USING ins_interval_d_f INTO sel_interval_d_f
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "39. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d_f       IS NULL   THEN DISPLAY "40. NULL"   ELSE DISPLAY "40. |",sel_interval_d_f,"|"   END IF

   LET ins_interval_h_h = "99" 
   LET stmt = "INSERT INTO lyc_0692(col_interval_h_h) VALUES(?)"
   PREPARE p_stmt_17 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "36. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_17 USING ins_interval_h_h
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "37. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_h_h = NULL
   LET stmt = "SELECT col_interval_h_h FROM lyc_0692 WHERE col_interval_h_h = ?"
   PREPARE p_stmt_18 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "38. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_18 USING ins_interval_h_h INTO sel_interval_h_h
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "39. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_h_h       IS NULL   THEN DISPLAY "40. NULL"   ELSE DISPLAY "40. |",sel_interval_h_h,"|"   END IF   

   LET ins_interval_h9_mi = "123456789:59" 
   LET stmt = "INSERT INTO lyc_0692(col_interval_h9_mi) VALUES(?)"
   PREPARE p_stmt_19 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "41. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_19 USING ins_interval_h9_mi
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "42. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_h9_mi = NULL
   LET stmt = "SELECT col_interval_h9_mi FROM lyc_0692 WHERE col_interval_h9_mi = ?"
   PREPARE p_stmt_20 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "43. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_20 USING ins_interval_h9_mi INTO sel_interval_h9_mi
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "44. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_h9_mi       IS NULL   THEN DISPLAY "45. NULL"   ELSE DISPLAY "45. |",sel_interval_h9_mi,"|"   END IF   

   LET ins_interval_h_s = "99:59:59" 
   LET stmt = "INSERT INTO lyc_0692(col_interval_h_s) VALUES(?)"
   PREPARE p_stmt_21 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "46. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_21 USING ins_interval_h_s
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "47. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_h_s = NULL
   LET stmt = "SELECT col_interval_h_s FROM lyc_0692 WHERE col_interval_h_s = ?"
   PREPARE p_stmt_22 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "48. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_22 USING ins_interval_h_s INTO sel_interval_h_s
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "49. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_h_s       IS NULL   THEN DISPLAY "50. NULL"   ELSE DISPLAY "50. |",sel_interval_h_s,"|"   END IF   

   LET ins_interval_h9_f = "123456789:59:59.999" 
   LET stmt = "INSERT INTO lyc_0692(col_interval_h9_f) VALUES(?)"
   PREPARE p_stmt_23 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "51. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_23 USING ins_interval_h9_f
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "52. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_h9_f = NULL
   LET stmt = "SELECT col_interval_h9_f FROM lyc_0692 WHERE col_interval_h9_f = ?"
   PREPARE p_stmt_24 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "53. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_24 USING ins_interval_h9_f INTO sel_interval_h9_f
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "54. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_h9_f       IS NULL   THEN DISPLAY "55. NULL"   ELSE DISPLAY "55. |",sel_interval_h9_f,"|"   END IF   

END MAIN