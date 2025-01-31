#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################

MAIN
   DEFINE
      v_tinyint_1,
      v_tinyint_2,
      v_res_tinyint TINYINT

   WHENEVER ANY ERROR CONTINUE

   # & Bit-and
   LET v_tinyint_1  = NULL
   LET v_tinyint_2  = 21
   LET v_res_tinyint =  v_tinyint_1 & v_tinyint_2
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_tinyint IS NULL THEN DISPLAY "1.  NULL" ELSE DISPLAY "1.  |",v_res_tinyint,"|" END IF            

   # | Bit-or
   LET v_tinyint_1  = NULL
   LET v_tinyint_2  = 21
   LET v_res_tinyint =  v_tinyint_1 | v_tinyint_2
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_tinyint IS NULL THEN DISPLAY "2.  NULL" ELSE DISPLAY "2.  |",v_res_tinyint,"|" END IF

   # ^ Exclusive-or
   LET v_tinyint_1  = NULL
   LET v_tinyint_2  = 21
   LET v_res_tinyint =  v_tinyint_1 ^ v_tinyint_2
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_tinyint IS NULL THEN DISPLAY "3.  NULL" ELSE DISPLAY "3.  |",v_res_tinyint,"|" END IF

   # ~ Bitwise complement
   LET v_tinyint_1  = NULL
   LET v_res_tinyint =  ~v_tinyint_1
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_tinyint IS NULL THEN DISPLAY "4.  NULL" ELSE DISPLAY "4.  |",v_res_tinyint,"|" END IF

END MAIN
