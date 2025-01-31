#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DEFINE
  i INTEGER
MAIN
  DEFINE
     v_res_dec  DECIMAL(32)
  WHENEVER ANY ERROR CALL disp_status
  # positive exponent
  LET v_res_dec = NULL
  LET i=1  LET v_res_dec = 1.00 ** 0.9E+32
  LET i=2  IF v_res_dec IS NULL THEN DISPLAY i USING "##&.","NULL" ELSE DISPLAY i USING "##&.","|",v_res_dec CLIPPED,"|" END IF
  LET v_res_dec = NULL
  LET i=3  LET v_res_dec = 1.00 ** 0.9E+33
  LET i=4  IF v_res_dec IS NULL THEN DISPLAY i USING "##&.","NULL" ELSE DISPLAY i USING "##&.","|",v_res_dec CLIPPED,"|" END IF
  LET v_res_dec = NULL
  LET i=5  LET v_res_dec = 1.00 ** 0.9E+125
  LET i=6  IF v_res_dec IS NULL THEN DISPLAY i USING "##&.","NULL" ELSE DISPLAY i USING "##&.","|",v_res_dec CLIPPED,"|" END IF
  LET v_res_dec = NULL
  LET i=7  LET v_res_dec = 2.00 ** 0.9E+125
  LET i=8  IF v_res_dec IS NULL THEN DISPLAY i USING "##&.","NULL" ELSE DISPLAY i USING "##&.","|",v_res_dec CLIPPED,"|" END IF
  # negative exponent
  LET v_res_dec = NULL
  LET i=9  LET v_res_dec = 1.00 ** -0.9E+125
  LET i=10 IF v_res_dec IS NULL THEN DISPLAY i USING "##&.","NULL" ELSE DISPLAY i USING "##&.","|",v_res_dec CLIPPED,"|" END IF
  LET v_res_dec = NULL
  LET i=11 LET v_res_dec = 2.00 ** -4
  LET i=12 IF v_res_dec IS NULL THEN DISPLAY i USING "##&.","NULL" ELSE DISPLAY i USING "##&.","|",v_res_dec CLIPPED,"|" END IF
  LET v_res_dec = NULL
  LET i=13 LET v_res_dec = 2.00 ** -0.9E+125
  LET i=14 IF v_res_dec IS NULL THEN DISPLAY i USING "##&.","NULL" ELSE DISPLAY i USING "##&.","|",v_res_dec CLIPPED,"|" END IF
END MAIN

FUNCTION disp_status()
  DISPLAY i USING "##&.",status
END FUNCTION
