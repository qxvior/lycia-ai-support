#########################################################################################################################################
# Testing the assign operations for the DECIMAL(p) data type with float-point (checking rounding).
# Author: Bondar A.G.
#########################################################################################################################################

MAIN
   DEFINE
      v_dec_4  DECIMAL(4)

   WHENEVER ANY ERROR CONTINUE

   LET v_dec_4  = 123440.0
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "1.  NULL"   ELSE DISPLAY "1.  |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 123450.0
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "2.  NULL"   ELSE DISPLAY "2.  |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 12344.0
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 12345.0
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "4.  NULL"   ELSE DISPLAY "4.  |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 1234.4
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "5.  NULL"   ELSE DISPLAY "5.  |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 1234.5
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 123.44
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "7.  NULL"   ELSE DISPLAY "7.  |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 123.45
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "8.  NULL"   ELSE DISPLAY "8.  |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 12.344
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "9.  NULL"   ELSE DISPLAY "9.  |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 12.345
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "10. NULL"   ELSE DISPLAY "10. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 1.2344
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "11. NULL"   ELSE DISPLAY "11. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 1.2345
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 0.12344
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "13. NULL"   ELSE DISPLAY "13. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 0.12345
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "14. NULL"   ELSE DISPLAY "14. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 0.012344
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "15. NULL"   ELSE DISPLAY "15. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 0.012345
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "16. NULL"   ELSE DISPLAY "16. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 0.0012344
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "17. NULL"   ELSE DISPLAY "17. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 0.0012345
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "18. NULL"   ELSE DISPLAY "18. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 0.00012344
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "19. NULL"   ELSE DISPLAY "19. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 0.00012345
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "20. NULL"   ELSE DISPLAY "20. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 0.000012344
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "21. NULL"   ELSE DISPLAY "21. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 0.000012345
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "22. NULL"   ELSE DISPLAY "22. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 0.0000012344
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "23. NULL"   ELSE DISPLAY "23. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   LET v_dec_4  = 0.0000012345
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_dec_4 IS NULL    THEN DISPLAY "24. NULL"   ELSE DISPLAY "24. |",v_dec_4 USING "------------&.&&&&&&&&&&&&","|"   END IF
   
END MAIN

