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

      ins_interval_f_f,   sel_interval_f_f   INTERVAL FRACTION TO FRACTION,
      
      stmt CHAR(1024)

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
   LET stmt = "INSERT INTO lyc_0694(col_interval_mi_mi) VALUES(""",ins_interval_mi_mi,""")"
   PREPARE p_stmt_25 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "56. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_25
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "57. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_mi_mi = NULL
   LET stmt = "SELECT col_interval_mi_mi FROM lyc_0694 WHERE col_interval_mi_mi = """,ins_interval_mi_mi,""""
   PREPARE p_stmt_26 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "58. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_26 INTO sel_interval_mi_mi
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "59. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_mi_mi       IS NULL   THEN DISPLAY "60. NULL"   ELSE DISPLAY "60. |",sel_interval_mi_mi,"|"   END IF   

   LET ins_interval_mi9_s = "123456789:59" 
   LET stmt = "INSERT INTO lyc_0694(col_interval_mi9_s) VALUES(""",ins_interval_mi9_s,""")"
   PREPARE p_stmt_27 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "61. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_27
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "62. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_mi9_s = NULL
   LET stmt = "SELECT col_interval_mi9_s FROM lyc_0694 WHERE col_interval_mi9_s = """,ins_interval_mi9_s,""""
   PREPARE p_stmt_28 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "63. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_28 INTO sel_interval_mi9_s
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "64. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_mi9_s       IS NULL   THEN DISPLAY "65. NULL"   ELSE DISPLAY "65. |",sel_interval_mi9_s,"|"   END IF   

   LET ins_interval_mi_f = "99:59.999" 
   LET stmt = "INSERT INTO lyc_0694(col_interval_mi_f) VALUES(""",ins_interval_mi_f,""")"
   PREPARE p_stmt_29 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "66. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_29
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "67. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_mi_f = NULL
   LET stmt = "SELECT col_interval_mi_f FROM lyc_0694 WHERE col_interval_mi_f = """,ins_interval_mi_f,""""
   PREPARE p_stmt_30 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "68. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_30 INTO sel_interval_mi_f
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "69. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_mi_f       IS NULL   THEN DISPLAY "70. NULL"   ELSE DISPLAY "70. |",sel_interval_mi_f,"|"   END IF   
   
   LET ins_interval_s_s = "99" 
   LET stmt = "INSERT INTO lyc_0694(col_interval_s_s) VALUES(""",ins_interval_s_s,""")"
   PREPARE p_stmt_31 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "71. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_31
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "72. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_s_s = NULL
   LET stmt = "SELECT col_interval_s_s FROM lyc_0694 WHERE col_interval_s_s = """,ins_interval_s_s,""""
   PREPARE p_stmt_32 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "73. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_32 INTO sel_interval_s_s
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "74. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_s_s       IS NULL   THEN DISPLAY "75. NULL"   ELSE DISPLAY "75. |",sel_interval_s_s,"|"   END IF   

   LET ins_interval_s9_f = "123456789.999" 
   LET stmt = "INSERT INTO lyc_0694(col_interval_s9_f) VALUES(""",ins_interval_s9_f,""")"
   PREPARE p_stmt_33 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "76. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_33
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "77. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_s9_f = NULL
   LET stmt = "SELECT col_interval_s9_f FROM lyc_0694 WHERE col_interval_s9_f = """,ins_interval_s9_f,""""
   PREPARE p_stmt_34 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "78. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_34 INTO sel_interval_s9_f
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "79. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_s9_f       IS NULL   THEN DISPLAY "80. NULL"   ELSE DISPLAY "80. |",sel_interval_s9_f,"|"   END IF

   LET ins_interval_f_f = ".999" 
   LET stmt = "INSERT INTO lyc_0694(col_interval_f_f) VALUES(""",ins_interval_f_f,""")"
   PREPARE p_stmt_35 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "81. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_35
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "82. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_interval_f_f = NULL
   LET stmt = "SELECT col_interval_f_f FROM lyc_0694 WHERE col_interval_f_f = """,ins_interval_f_f,""""
   PREPARE p_stmt_36 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "83. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_36 INTO sel_interval_f_f
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "84. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_interval_f_f       IS NULL   THEN DISPLAY "85. NULL"   ELSE DISPLAY "85. |",sel_interval_f_f,"|"   END IF

END MAIN
