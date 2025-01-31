MAIN
   DEFINE
      v_datetime_y_f  DATETIME YEAR TO FRACTION   

   WHENEVER ANY ERROR CONTINUE

   LET v_datetime_y_f = "9999-12-31 23:59:59.998"
--   LET v_datetime_y_f = v_datetime_y_f + 0.001 UNITS FRACTION  --> no compilation errors !!!

   LET v_datetime_y_f = DATETIME(9999-12-31 23:59:59.998)YEAR TO FRACTION + 0.001 UNITS FRACTION

   IF v_datetime_y_f IS NULL THEN DISPLAY "NULL" ELSE DISPLAY v_datetime_y_f END IF

END MAIN