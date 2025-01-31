#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DEFINE
   i INTEGER
MAIN
   DEFINE
      v_bigint_1,
      v_bigint_2    BIGINT,
      v_int8_1,
      v_int8_2      INT8,      
      v_bigserial_1,
      v_bigserial_2 BIGSERIAL,
      v_serial8_1,
      v_serial8_2   SERIAL8,
      v_integer_1,
      v_integer_2   INTEGER,
      v_serial_1,
      v_serial_2    SERIAL,
      v_smallint_1,
      v_smallint_2  SMALLINT,
      v_tinyint_1,
      v_tinyint_2   TINYINT,
      v_res_variant VARIANT

   WHENEVER ANY ERROR CALL disp_status

   # BIGINT +- BIGSERIAL
   LET i=1  LET v_bigint_1    =  9223372036854775807
   LET i=1  LET v_bigserial_2 =  9223372036854775807
   LET i=3  LET v_res_variant = v_bigint_1 + v_bigserial_2
   LET i=4  IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF

   LET i=5  LET v_res_variant = v_bigint_1 - v_bigserial_2
   LET i=6  IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF

   # BIGINT +- SERIAL8
   LET i=7  LET v_bigint_1    =  9223372036854775807
   LET i=8  LET v_serial8_2   =  9223372036854775807
   LET i=9  LET v_res_variant = v_bigint_1 + v_serial8_2
   LET i=10 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF

   LET i=11 LET v_res_variant = v_bigint_1 - v_serial8_2
   LET i=12 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF

   # BIGSERIAL +- INTEGER
   LET i=13 LET v_bigserial_1 =  9223372036854775807
   LET i=14 LET v_integer_2   =  2147483647
   LET i=15 LET v_res_variant = v_bigserial_1 + v_integer_2
   LET i=16 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF
   
   LET i=17 LET v_res_variant = v_bigserial_1 - v_integer_2
   LET i=18 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF   

   # BIGSERIAL +- SERIAL
   LET i=19 LET v_bigserial_1 =  9223372036854775807
   LET i=20 LET v_serial_2    =  2147483647
   LET i=21 LET v_res_variant = v_bigserial_1 + v_serial_2
   LET i=22 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF
   
   LET i=23 LET v_res_variant = v_bigserial_1 - v_serial_2
   LET i=24 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF

   # BIGSERIAL +- SMALLINT
   LET i=25 LET v_bigserial_1 =  9223372036854775807
   LET i=26 LET v_smallint_2  =  32767
   LET i=27 LET v_res_variant = v_bigserial_1 + v_smallint_2
   LET i=28 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF

   LET i=29 LET v_res_variant = v_bigserial_1 - v_smallint_2
   LET i=30 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF

   # BIGSERIAL +- TINYINT
   LET i=31 LET v_bigserial_1 =  9223372036854775807
   LET i=32 LET v_tinyint_2   =  127
   LET i=33 LET v_res_variant = v_bigserial_1 + v_tinyint_2
   LET i=34 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF
   
   LET i=35 LET v_res_variant = v_bigserial_1 - v_tinyint_2
   LET i=36 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF   
   
   # SERIAL8 +- INTEGER
   LET i=37 LET v_serial8_1   =  9223372036854775807
   LET i=38 LET v_integer_2   =  2147483647
   LET i=39 LET v_res_variant = v_serial8_1 + v_integer_2
   LET i=40 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF
   
   LET i=41 LET v_res_variant = v_serial8_1 - v_integer_2
   LET i=42 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF      
   
   # SERIAL8 +- SERIAL
   LET i=43 LET v_serial8_1   =  9223372036854775807
   LET i=44 LET v_serial_2    =  2147483647
   LET i=45 LET v_res_variant = v_serial8_1 + v_serial_2
   LET i=46 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF
   
   LET i=47 LET v_res_variant = v_serial8_1 - v_serial_2
   LET i=48 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF         

   # SERIAL8 +- SMALLINT
   LET i=49 LET v_serial8_1   =  9223372036854775807
   LET i=50 LET v_smallint_2  =  32767
   LET i=51 LET v_res_variant = v_serial8_1 + v_smallint_2
   LET i=52 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF
   
   LET i=53 LET v_res_variant = v_serial8_1 - v_smallint_2
   LET i=54 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF   

   # SERIAL8 +- TINYINT
   LET i=55 LET v_serial8_1   =  9223372036854775807
   LET i=56 LET v_tinyint_2  =  127
   LET i=57 LET v_res_variant = v_serial8_1 + v_tinyint_2
   LET i=58 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF
   
   LET i=59 LET v_res_variant = v_serial8_1 - v_tinyint_2
   LET i=60 IF v_res_variant IS NULL THEN DISPLAY i USING "##&.","NULL    ",v_res_variant.gettypefullname() ELSE DISPLAY i USING "##&.","|",v_res_variant,"|    ",v_res_variant.gettypefullname() END IF   

END MAIN

FUNCTION disp_status()
   DISPLAY i USING "##&.",status
END FUNCTION
