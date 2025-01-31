#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################

MAIN
   DEFINE
      v_float_pow      FLOAT,       -- INTEGER,  --> If the exponent is INTEGR, then the result is correct
      v_flt1,
      v_flt2,
      v_res_flt        FLOAT,
      v_smallfloat_pow SMALLFLOAT,  -- INTEGER,  --> If the exponent is INTEGR, then the result is correct
      v_smallflt1,
      v_smallflt2,
      v_res_smallflt   SMALLFLOAT

   WHENEVER ANY ERROR CONTINUE

   # Exponent of FLOAT data type
   LET v_flt1  =  999999999999999.0e+0
   LET v_float_pow = 0.99  
   LET v_res_flt =  v_flt1 ** v_float_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_flt IS NULL          THEN DISPLAY "1.  NULL" ELSE DISPLAY "1.  |",v_res_flt USING "--------------------------------&.#################################","|" END IF
   LET v_flt1  =  999999999999999.0e+0
   LET v_float_pow = 1.99  
   LET v_res_flt =  v_flt1 ** v_float_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_flt IS NULL          THEN DISPLAY "2.  NULL" ELSE DISPLAY "2.  |",v_res_flt USING "--------------------------------&.#################################","|" END IF
   LET v_flt1  =  31622776
   LET v_float_pow = 2.99  
   LET v_res_flt =  v_flt1 ** v_float_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_flt IS NULL          THEN DISPLAY "3.  NULL" ELSE DISPLAY "3.  |",v_res_flt USING "--------------------------------&.#################################","|" END IF
   LET v_flt1  =  99999
   LET v_float_pow = 3.99  
   LET v_res_flt =  v_flt1 ** v_float_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_flt IS NULL          THEN DISPLAY "4.  NULL" ELSE DISPLAY "4.  |",v_res_flt USING "--------------------------------&.#################################","|" END IF

   LET v_flt1  =  9999999.99999999e+0
   LET v_float_pow = 2.99  
   LET v_res_flt =  v_flt1 ** v_float_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_flt IS NULL          THEN DISPLAY "5.  NULL" ELSE DISPLAY "5.  |",v_res_flt USING "--------------------------------&.#################################","|" END IF
   LET v_flt1  =  9999.99999999e+0
   LET v_float_pow = 3.99  
   LET v_res_flt =  v_flt1 ** v_float_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_flt IS NULL          THEN DISPLAY "6.  NULL" ELSE DISPLAY "6.  |",v_res_flt USING "--------------------------------&.#################################","|" END IF
   LET v_flt1  =  10.0e+0
   LET v_float_pow = -4.99  
   LET v_res_flt =  v_flt1 ** v_float_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_flt IS NULL          THEN DISPLAY "7.  NULL" ELSE DISPLAY "7.  |",v_res_flt USING "--------------------------------&.#################################","|" END IF
   LET v_flt1  =  5.0e+0
   LET v_float_pow = -5.99  
   LET v_res_flt =  v_flt1 ** v_float_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_flt IS NULL          THEN DISPLAY "8.  NULL" ELSE DISPLAY "8.  |",v_res_flt USING "--------------------------------&.#################################","|" END IF

   LET v_flt1  =  0.0000009e+0
   LET v_float_pow = 2.99  
   LET v_res_flt =  v_flt1 ** v_float_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_flt IS NULL          THEN DISPLAY "9.  NULL" ELSE DISPLAY "9.  |",v_res_flt USING "--------------------------------&.#################################","|" END IF
   LET v_flt1  =  0.00009e+0  
   LET v_float_pow = 3.99  
   LET v_res_flt =  v_flt1 ** v_float_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_flt IS NULL          THEN DISPLAY "10. NULL" ELSE DISPLAY "10. |",v_res_flt USING "--------------------------------&.#################################","|" END IF
   LET v_flt1  =  0.009e+0
   LET v_float_pow = 4.99  
   LET v_res_flt =  v_flt1 ** v_float_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_flt IS NULL          THEN DISPLAY "11. NULL" ELSE DISPLAY "11. |",v_res_flt USING "--------------------------------&.#################################","|" END IF
   LET v_flt1  =  0.09e+0
   LET v_float_pow = 5.99  
   LET v_res_flt =  v_flt1 ** v_float_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_flt IS NULL          THEN DISPLAY "12. NULL" ELSE DISPLAY "12. |",v_res_flt USING "--------------------------------&.#################################","|" END IF

   # Exponent of SMALLFLOAT data type
   LET v_smallflt1  =  9999999.0e+0
   LET v_smallfloat_pow = 0.99  
   LET v_res_smallflt =  v_smallflt1 ** v_smallfloat_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_smallflt IS NULL          THEN DISPLAY "13. NULL" ELSE DISPLAY "13. |",v_res_smallflt USING "--------------------------------&.#################################","|" END IF
   LET v_smallflt1  =  9999999.0e+0
   LET v_smallfloat_pow = 1.99  
   LET v_res_smallflt =  v_smallflt1 ** v_smallfloat_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_smallflt IS NULL          THEN DISPLAY "14. NULL" ELSE DISPLAY "14. |",v_res_smallflt USING "--------------------------------&.#################################","|" END IF
   LET v_smallflt1  =  3162
   LET v_smallfloat_pow = 2.99  
   LET v_res_smallflt =  v_smallflt1 ** v_smallfloat_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_smallflt IS NULL          THEN DISPLAY "15. NULL" ELSE DISPLAY "15. |",v_res_smallflt USING "--------------------------------&.#################################","|" END IF
   LET v_smallflt1  =  215
   LET v_smallfloat_pow = 3.99  
   LET v_res_smallflt =  v_smallflt1 ** v_smallfloat_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_smallflt IS NULL          THEN DISPLAY "16. NULL" ELSE DISPLAY "16. |",v_res_smallflt USING "--------------------------------&.#################################","|" END IF

   LET v_smallflt1  =  9999.999e+0
   LET v_smallfloat_pow = 2.99  
   LET v_res_smallflt =  v_smallflt1 ** v_smallfloat_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_smallflt IS NULL          THEN DISPLAY "17. NULL" ELSE DISPLAY "17. |",v_res_smallflt USING "--------------------------------&.#################################","|" END IF
   LET v_smallflt1  =  999.9999e+0
   LET v_smallfloat_pow = 3.99  
   LET v_res_smallflt =  v_smallflt1 ** v_smallfloat_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_smallflt IS NULL          THEN DISPLAY "18. NULL" ELSE DISPLAY "18. |",v_res_smallflt USING "--------------------------------&.#################################","|" END IF
   LET v_smallflt1  =  10.0e+0
   LET v_smallfloat_pow = -4.99  
   LET v_res_smallflt =  v_smallflt1 ** v_smallfloat_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_smallflt IS NULL          THEN DISPLAY "19. NULL" ELSE DISPLAY "19. |",v_res_smallflt USING "--------------------------------&.#################################","|" END IF
   LET v_smallflt1  =  5.0e+0
   LET v_smallfloat_pow = -5.99  
   LET v_res_smallflt =  v_smallflt1 ** v_smallfloat_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_smallflt IS NULL          THEN DISPLAY "20. NULL" ELSE DISPLAY "20. |",v_res_smallflt USING "--------------------------------&.#################################","|" END IF

   LET v_smallflt1  =  0.0000009e+0
   LET v_smallfloat_pow = 2.99  
   LET v_res_smallflt =  v_smallflt1 ** v_smallfloat_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_smallflt IS NULL          THEN DISPLAY "21. NULL" ELSE DISPLAY "21. |",v_res_smallflt USING "--------------------------------&.#################################","|" END IF
   LET v_smallflt1  =  0.00009e+0  
   LET v_smallfloat_pow = 3.99  
   LET v_res_smallflt =  v_smallflt1 ** v_smallfloat_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_smallflt IS NULL          THEN DISPLAY "22. NULL" ELSE DISPLAY "22. |",v_res_smallflt USING "--------------------------------&.#################################","|" END IF
   LET v_smallflt1  =  0.009e+0
   LET v_smallfloat_pow = 4.99
   LET v_res_smallflt =  v_smallflt1 ** v_smallfloat_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_smallflt IS NULL          THEN DISPLAY "23. NULL" ELSE DISPLAY "23. |",v_res_smallflt USING "--------------------------------&.#################################","|" END IF
   LET v_smallflt1  =  0.09e+0
   LET v_smallfloat_pow = 5.99  
   LET v_res_smallflt =  v_smallflt1 ** v_smallfloat_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_smallflt IS NULL          THEN DISPLAY "24. NULL" ELSE DISPLAY "24. |",v_res_smallflt USING "--------------------------------&.#################################","|" END IF

END MAIN
