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
      ins_interval_h9_f,  sel_interval_h9_f  INTERVAL HOUR(9) TO FRACTION   

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
   INSERT INTO lyc_0692(col_interval_y_y) VALUES(ins_interval_y_y)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_y_y = NULL
   SELECT col_interval_y_y INTO sel_interval_y_y FROM lyc_0692 WHERE col_interval_y_y = ins_interval_y_y
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_y_y       IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_interval_y_y,"|"   END IF

   LET ins_interval_y_mo = "9999-11"
   INSERT INTO lyc_0692(col_interval_y_mo) VALUES(ins_interval_y_mo)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_y_mo = NULL
   SELECT col_interval_y_mo INTO sel_interval_y_mo FROM lyc_0692 WHERE col_interval_y_mo = ins_interval_y_mo
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_y_mo       IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_interval_y_mo,"|"   END IF

   LET ins_interval_mo_mo = "99"
   INSERT INTO lyc_0692(col_interval_mo_mo) VALUES(ins_interval_mo_mo)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_mo_mo = NULL
   SELECT col_interval_mo_mo INTO sel_interval_mo_mo FROM lyc_0692 WHERE col_interval_mo_mo = ins_interval_mo_mo
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_mo_mo       IS NULL   THEN DISPLAY "9.  NULL"   ELSE DISPLAY "9.  |",sel_interval_mo_mo,"|"   END IF

   LET ins_interval_d_d = "99"
   INSERT INTO lyc_0692(col_interval_d_d) VALUES(ins_interval_d_d)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d_d = NULL
   SELECT col_interval_d_d INTO sel_interval_d_d FROM lyc_0692 WHERE col_interval_d_d = ins_interval_d_d
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d_d       IS NULL   THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",sel_interval_d_d,"|"   END IF

   LET ins_interval_d9_h = "123456789 23"
   INSERT INTO lyc_0692(col_interval_d9_h) VALUES(ins_interval_d9_h)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "13. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d9_h = NULL
   SELECT col_interval_d9_h INTO sel_interval_d9_h FROM lyc_0692 WHERE col_interval_d9_h = ins_interval_d9_h
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "14. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d9_h       IS NULL   THEN DISPLAY "15. NULL"   ELSE DISPLAY "15. |",sel_interval_d9_h,"|"   END IF

   LET ins_interval_d_mi = "99 23:59"
   INSERT INTO lyc_0692(col_interval_d_mi) VALUES(ins_interval_d_mi)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "16. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d_mi = NULL
   SELECT col_interval_d_mi INTO sel_interval_d_mi FROM lyc_0692 WHERE col_interval_d_mi = ins_interval_d_mi
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "17. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d_mi       IS NULL   THEN DISPLAY "18. NULL"   ELSE DISPLAY "18. |",sel_interval_d_mi,"|"   END IF

   LET ins_interval_d9_s = "123456789 23:59:59"
   INSERT INTO lyc_0692(col_interval_d9_s) VALUES(ins_interval_d9_s)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "19. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d9_s = NULL
   SELECT col_interval_d9_s INTO sel_interval_d9_s FROM lyc_0692 WHERE col_interval_d9_s = ins_interval_d9_s
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "20. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d9_s       IS NULL   THEN DISPLAY "21. NULL"   ELSE DISPLAY "21. |",sel_interval_d9_s,"|"   END IF

   LET ins_interval_d_f = "99 23:59:59.999"
   INSERT INTO lyc_0692(col_interval_d_f) VALUES(ins_interval_d_f)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "22. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_d_f = NULL
   SELECT col_interval_d_f INTO sel_interval_d_f FROM lyc_0692 WHERE col_interval_d_f = ins_interval_d_f
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "23. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_d_f       IS NULL   THEN DISPLAY "24. NULL"   ELSE DISPLAY "24. |",sel_interval_d_f,"|"   END IF

   LET ins_interval_h_h = "99"
   INSERT INTO lyc_0692(col_interval_h_h) VALUES(ins_interval_h_h)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "25. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_h_h = NULL
   SELECT col_interval_h_h INTO sel_interval_h_h FROM lyc_0692 WHERE col_interval_h_h = ins_interval_h_h
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "26. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_h_h       IS NULL   THEN DISPLAY "27. NULL"   ELSE DISPLAY "27. |",sel_interval_h_h,"|"   END IF

   LET ins_interval_h9_mi = "123456789:59"
   INSERT INTO lyc_0692(col_interval_h9_mi) VALUES(ins_interval_h9_mi)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "28. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_h9_mi = NULL
   SELECT col_interval_h9_mi INTO sel_interval_h9_mi FROM lyc_0692 WHERE col_interval_h9_mi = ins_interval_h9_mi
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "29. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_h9_mi       IS NULL   THEN DISPLAY "30. NULL"   ELSE DISPLAY "30. |",sel_interval_h9_mi,"|"   END IF

   LET ins_interval_h_s = "99:59:59"
   INSERT INTO lyc_0692(col_interval_h_s) VALUES(ins_interval_h_s)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "31. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_h_s = NULL
   SELECT col_interval_h_s INTO sel_interval_h_s FROM lyc_0692 WHERE col_interval_h_s = ins_interval_h_s
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "32. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_h_s       IS NULL   THEN DISPLAY "33. NULL"   ELSE DISPLAY "33. |",sel_interval_h_s,"|"   END IF

   LET ins_interval_h9_f = "123456789:59:59.999"
   INSERT INTO lyc_0692(col_interval_h9_f) VALUES(ins_interval_h9_f)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "34. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_h9_f = NULL
   SELECT col_interval_h9_f INTO sel_interval_h9_f FROM lyc_0692 WHERE col_interval_h9_f = ins_interval_h9_f
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "35. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_h9_f       IS NULL   THEN DISPLAY "36. NULL"   ELSE DISPLAY "36. |",sel_interval_h9_f,"|"   END IF

END MAIN
