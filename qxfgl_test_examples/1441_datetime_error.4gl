#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores

MAIN
   DEFINE
      ins_datetime_f_f,   sel_datetime_f_f   DATETIME FRACTION TO FRACTION,   
      ins_datetime_f_f1,  sel_datetime_f_f1  DATETIME FRACTION TO FRACTION(1),
      ins_datetime_f_f2,  sel_datetime_f_f2  DATETIME FRACTION TO FRACTION(2),
      ins_datetime_f_f3,  sel_datetime_f_f3  DATETIME FRACTION TO FRACTION(3),
      ins_datetime_f_f4,  sel_datetime_f_f4  DATETIME FRACTION TO FRACTION(4),
      ins_datetime_f_f5,  sel_datetime_f_f5  DATETIME FRACTION TO FRACTION(5) 

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1441
   CREATE TABLE lyc_1441
   (
    col_datetime_f_f   DATETIME FRACTION TO FRACTION,
    col_datetime_f_f1  DATETIME FRACTION TO FRACTION(1),
    col_datetime_f_f2  DATETIME FRACTION TO FRACTION(2),
    col_datetime_f_f3  DATETIME FRACTION TO FRACTION(3),
    col_datetime_f_f4  DATETIME FRACTION TO FRACTION(4),
    col_datetime_f_f5  DATETIME FRACTION TO FRACTION(5) 
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "0.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   LET ins_datetime_f_f = NULL
   INSERT INTO lyc_1441(col_datetime_f_f) VALUES(ins_datetime_f_f)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f = "0.000"
   SELECT col_datetime_f_f INTO sel_datetime_f_f FROM lyc_1441 WHERE col_datetime_f_f IS NULL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f       IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_datetime_f_f,"|"   END IF

   LET ins_datetime_f_f = "0.000"
   INSERT INTO lyc_1441(col_datetime_f_f) VALUES(ins_datetime_f_f)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f = NULL
   SELECT col_datetime_f_f INTO sel_datetime_f_f FROM lyc_1441 WHERE col_datetime_f_f = ins_datetime_f_f
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f       IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_datetime_f_f,"|"   END IF
   LET ins_datetime_f_f = "0.999"
   INSERT INTO lyc_1441(col_datetime_f_f) VALUES(ins_datetime_f_f)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f = NULL
   SELECT col_datetime_f_f INTO sel_datetime_f_f FROM lyc_1441 WHERE col_datetime_f_f = ins_datetime_f_f
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f       IS NULL   THEN DISPLAY "9.  NULL"   ELSE DISPLAY "9.  |",sel_datetime_f_f,"|"   END IF

   LET ins_datetime_f_f1 = ".0"
   INSERT INTO lyc_1441(col_datetime_f_f1) VALUES(ins_datetime_f_f1)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f1 = NULL
   SELECT col_datetime_f_f1 INTO sel_datetime_f_f1 FROM lyc_1441 WHERE col_datetime_f_f1 = ins_datetime_f_f1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f1       IS NULL   THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",sel_datetime_f_f1,"|"   END IF
   LET ins_datetime_f_f1 = ".9"
   INSERT INTO lyc_1441(col_datetime_f_f1) VALUES(ins_datetime_f_f1)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "13. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f1 = NULL
   SELECT col_datetime_f_f1 INTO sel_datetime_f_f1 FROM lyc_1441 WHERE col_datetime_f_f1 = ins_datetime_f_f1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "14. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f1       IS NULL   THEN DISPLAY "15. NULL"   ELSE DISPLAY "15. |",sel_datetime_f_f1,"|"   END IF

   LET ins_datetime_f_f2 = "0.00"
   INSERT INTO lyc_1441(col_datetime_f_f2) VALUES(ins_datetime_f_f2)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "16. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f2 = NULL
   SELECT col_datetime_f_f2 INTO sel_datetime_f_f2 FROM lyc_1441 WHERE col_datetime_f_f2 = ins_datetime_f_f2
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "17. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f2       IS NULL   THEN DISPLAY "18. NULL"   ELSE DISPLAY "18. |",sel_datetime_f_f2,"|"   END IF
   LET ins_datetime_f_f2 = "0.99"
   INSERT INTO lyc_1441(col_datetime_f_f2) VALUES(ins_datetime_f_f2)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "19. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f2 = NULL
   SELECT col_datetime_f_f2 INTO sel_datetime_f_f2 FROM lyc_1441 WHERE col_datetime_f_f2 = ins_datetime_f_f2
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "20. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f2       IS NULL   THEN DISPLAY "21. NULL"   ELSE DISPLAY "21. |",sel_datetime_f_f2,"|"   END IF

   LET ins_datetime_f_f3 = ".000"
   INSERT INTO lyc_1441(col_datetime_f_f3) VALUES(ins_datetime_f_f3)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "22. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f3 = NULL
   SELECT col_datetime_f_f3 INTO sel_datetime_f_f3 FROM lyc_1441 WHERE col_datetime_f_f3 = ins_datetime_f_f3
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "23. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f3       IS NULL   THEN DISPLAY "24. NULL"   ELSE DISPLAY "24. |",sel_datetime_f_f3,"|"   END IF
   LET ins_datetime_f_f3 = ".999"
   INSERT INTO lyc_1441(col_datetime_f_f3) VALUES(ins_datetime_f_f3)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "25. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f3 = NULL
   SELECT col_datetime_f_f3 INTO sel_datetime_f_f3 FROM lyc_1441 WHERE col_datetime_f_f3 = ins_datetime_f_f3
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "26. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f3       IS NULL   THEN DISPLAY "27. NULL"   ELSE DISPLAY "27. |",sel_datetime_f_f3,"|"   END IF

   LET ins_datetime_f_f4 = "0.0000"
   INSERT INTO lyc_1441(col_datetime_f_f4) VALUES(ins_datetime_f_f4)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "28. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f4 = NULL
   SELECT col_datetime_f_f4 INTO sel_datetime_f_f4 FROM lyc_1441 WHERE col_datetime_f_f4 = ins_datetime_f_f4
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "29. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f4       IS NULL   THEN DISPLAY "30. NULL"   ELSE DISPLAY "30. |",sel_datetime_f_f4,"|"   END IF
   LET ins_datetime_f_f4 = "0.9999"
   INSERT INTO lyc_1441(col_datetime_f_f4) VALUES(ins_datetime_f_f4)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "31. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f4 = NULL
   SELECT col_datetime_f_f4 INTO sel_datetime_f_f4 FROM lyc_1441 WHERE col_datetime_f_f4 = ins_datetime_f_f4
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "32. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f4       IS NULL   THEN DISPLAY "33. NULL"   ELSE DISPLAY "33. |",sel_datetime_f_f4,"|"   END IF

   LET ins_datetime_f_f5 = ".00000"
   INSERT INTO lyc_1441(col_datetime_f_f5) VALUES(ins_datetime_f_f5)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "34. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f5 = NULL
   SELECT col_datetime_f_f5 INTO sel_datetime_f_f5 FROM lyc_1441 WHERE col_datetime_f_f5 = ins_datetime_f_f5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "35. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f5       IS NULL   THEN DISPLAY "36. NULL"   ELSE DISPLAY "36. |",sel_datetime_f_f5,"|"   END IF
   LET ins_datetime_f_f5 = ".99999"
   INSERT INTO lyc_1441(col_datetime_f_f5) VALUES(ins_datetime_f_f5)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "37. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_datetime_f_f5 = NULL
   SELECT col_datetime_f_f5 INTO sel_datetime_f_f5 FROM lyc_1441 WHERE col_datetime_f_f5 = ins_datetime_f_f5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "38. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_datetime_f_f5       IS NULL   THEN DISPLAY "39. NULL"   ELSE DISPLAY "39. |",sel_datetime_f_f5,"|"   END IF

END MAIN
