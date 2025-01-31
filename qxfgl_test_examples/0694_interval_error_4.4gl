#########################################################################################################################################
# # Author Bondar A.G.
#########################################################################################################################################

DATABASE stores

MAIN
   DEFINE
      ins_interval_mi_mi, sel_interval_mi_mi INTERVAL MINUTE TO MINUTE,     
      ins_interval_mi9_s, sel_interval_mi9_s INTERVAL MINUTE(9) TO SECOND,     
      ins_interval_mi_f,  sel_interval_mi_f  INTERVAL MINUTE TO FRACTION,   

      ins_interval_s_s,   sel_interval_s_s   INTERVAL SECOND TO SECOND,     
      ins_interval_s9_f,  sel_interval_s9_f  INTERVAL SECOND(9) TO FRACTION,   

      ins_interval_f_f,   sel_interval_f_f   INTERVAL FRACTION TO FRACTION

   WHENEVER ANY ERROR CONTINUE

   DROP TABLE lyc_0694
   CREATE TABLE lyc_0694
   ( 
    col_interval_mi_mi  INTERVAL MINUTE TO MINUTE,     
    col_interval_mi9_s  INTERVAL MINUTE(9) TO SECOND,     
    col_interval_mi_f   INTERVAL MINUTE TO FRACTION,   

    col_interval_s_s    INTERVAL SECOND TO SECOND,     
    col_interval_s9_f   INTERVAL SECOND(9) TO FRACTION,   

    col_interval_f_f    INTERVAL FRACTION TO FRACTION
   )   

   LET ins_interval_mi_mi = "99"
   SQL INSERT INTO lyc_0694(col_interval_mi_mi) VALUES($ins_interval_mi_mi) END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "37. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_mi_mi = NULL
   SQL SELECT col_interval_mi_mi INTO $sel_interval_mi_mi FROM lyc_0694 WHERE col_interval_mi_mi = $ins_interval_mi_mi END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "38. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_mi_mi       IS NULL   THEN DISPLAY "39. NULL"   ELSE DISPLAY "39. |",sel_interval_mi_mi,"|"   END IF

   LET ins_interval_mi9_s = "123456789:59"
   SQL INSERT INTO lyc_0694(col_interval_mi9_s) VALUES($ins_interval_mi9_s) END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "40. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_mi9_s = NULL
   SQL SELECT col_interval_mi9_s INTO $sel_interval_mi9_s FROM lyc_0694 WHERE col_interval_mi9_s = $ins_interval_mi9_s END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "41. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_mi9_s       IS NULL   THEN DISPLAY "42. NULL"   ELSE DISPLAY "42. |",sel_interval_mi9_s,"|"   END IF

   LET ins_interval_mi_f = "99:59.999"
   SQL INSERT INTO lyc_0694(col_interval_mi_f) VALUES($ins_interval_mi_f) END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "43. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_mi_f = NULL
   SQL SELECT col_interval_mi_f INTO $sel_interval_mi_f FROM lyc_0694 WHERE col_interval_mi_f = $ins_interval_mi_f END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "44. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_mi_f       IS NULL   THEN DISPLAY "45. NULL"   ELSE DISPLAY "45. |",sel_interval_mi_f,"|"   END IF

   LET ins_interval_s_s = "99"
   SQL INSERT INTO lyc_0694(col_interval_s_s) VALUES($ins_interval_s_s) END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "46. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_s_s = NULL
   SQL SELECT col_interval_s_s INTO $sel_interval_s_s FROM lyc_0694 WHERE col_interval_s_s = $ins_interval_s_s END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "47. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_s_s       IS NULL   THEN DISPLAY "48. NULL"   ELSE DISPLAY "48. |",sel_interval_s_s,"|"   END IF

   LET ins_interval_s9_f = "123456789.999"
   SQL INSERT INTO lyc_0694(col_interval_s9_f) VALUES($ins_interval_s9_f) END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "49. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_s9_f = NULL
   SQL SELECT col_interval_s9_f INTO $sel_interval_s9_f FROM lyc_0694 WHERE col_interval_s9_f = $ins_interval_s9_f END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "50. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_s9_f       IS NULL   THEN DISPLAY "51. NULL"   ELSE DISPLAY "51. |",sel_interval_s9_f,"|"   END IF

   LET ins_interval_f_f = ".999"
   SQL INSERT INTO lyc_0694(col_interval_f_f) VALUES($ins_interval_f_f) END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "53. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_f_f = NULL
   SQL SELECT col_interval_f_f INTO $sel_interval_f_f FROM lyc_0694 WHERE col_interval_f_f = $ins_interval_f_f END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "54. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_f_f       IS NULL   THEN DISPLAY "55. NULL"   ELSE DISPLAY "55. |",sel_interval_f_f,"|"   END IF

END MAIN
