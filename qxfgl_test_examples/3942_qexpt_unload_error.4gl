DATABASE qexpt_db_test

MAIN
   DEFINE
      v_language_code NCHAR(3),
      v_national_text NVARCHAR(80)

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_3942
   WHENEVER ERROR STOP

   CREATE TABLE lyc_3942 (
     language_code NCHAR(3),
     language_text NVARCHAR(80),
     yes_flag NCHAR(1),
     no_flag NCHAR(1),
     national_text NVARCHAR(80)
   )
 
   DECLARE curs CURSOR FOR
      SELECT language_code, national_text FROM lyc_3942 ORDER BY language_code

   LOAD FROM "3942/3942_qexpt_unload_error.unl" INSERT INTO lyc_3942
   DISPLAY "SQLCA.SQLCODE = ",SQLCA.SQLCODE

   FOREACH curs INTO v_language_code,v_national_text
      DISPLAY v_language_code,"    ",v_national_text
   END FOREACH

END MAIN
