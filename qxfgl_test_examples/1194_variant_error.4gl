#########################################################################################################################################
# Authtor Bondar A.G.
#########################################################################################################################################
MAIN
   DEFINE
      v_char           CHAR(80),
      v_varchar        VARCHAR(80),
      v_nchar          NCHAR(80),
      v_nvarchar       NVARCHAR(80),
      v_lvarchar       LVARCHAR(80),
      v_integer        INTEGER,
      v_smallint       SMALLINT,
      v_bigint         BIGINT,
      v_decimal        DECIMAL(16,2),
      v_money          MONEY(16,2),
      v_float          FLOAT,
      v_smallfloat     SMALLFLOAT,
      v_boolean        BOOLEAN,
      v_date           DATE,
      v_datetime_y_f5  DATETIME YEAR TO FRACTION(5),
      v_interval_y_mon INTERVAL YEAR TO MONTH,
      v_interval_d_f5  INTERVAL DAY TO FRACTION(5),
      v_variant        VARIANT
      
     WHENEVER ANY ERROR CONTINUE
     
   IF v_variant IS NULL   THEN DISPLAY "1. NULL"   ELSE DISPLAY "1. |",v_variant,"|"   END IF
   LET v_char =  "CHAR(80)" LET v_variant = v_char
   IF v_variant IS NULL   THEN DISPLAY "2. NULL"   ELSE DISPLAY "2. |",v_variant,"|"   END IF
   LET v_varchar =  "VARCHAR(80)" LET v_variant = v_varchar
   IF v_variant IS NULL   THEN DISPLAY "3. NULL"   ELSE DISPLAY "3. |",v_variant,"|"   END IF
   LET v_nchar =  "NCHAR(80)" LET v_variant = v_nchar
   IF v_variant IS NULL   THEN DISPLAY "4. NULL"   ELSE DISPLAY "4. |",v_variant,"|"   END IF
   LET v_nvarchar =  "NVARCHAR(80)" LET v_variant = v_nvarchar
   IF v_variant IS NULL   THEN DISPLAY "5. NULL"   ELSE DISPLAY "5. |",v_variant,"|"   END IF
   LET v_lvarchar =  "LVARCHAR(80)" LET v_variant = v_lvarchar
   IF v_variant IS NULL   THEN DISPLAY "6. NULL"   ELSE DISPLAY "6. |",v_variant,"|"   END IF
   LET v_integer = 2147483647 LET v_variant = v_integer
   IF v_variant IS NULL   THEN DISPLAY "7. NULL"   ELSE DISPLAY "7. |",v_variant,"|"   END IF
   LET v_smallint = 32767 LET v_variant = v_smallint
   IF v_variant IS NULL   THEN DISPLAY "8. NULL"   ELSE DISPLAY "8. |",v_variant,"|"   END IF
   LET v_bigint = 9223372036854775807 LET v_variant = v_bigint
   IF v_variant IS NULL   THEN DISPLAY "9. NULL"   ELSE DISPLAY "9. |",v_variant,"|"   END IF
   LET v_decimal = 12345678901234.12 LET v_variant = v_decimal
   IF v_variant IS NULL   THEN DISPLAY "10. NULL"   ELSE DISPLAY "10. |",v_variant,"|"   END IF
   LET v_money = 12345678901234.12 LET v_variant = v_money 
   IF v_variant IS NULL   THEN DISPLAY "11. NULL"   ELSE DISPLAY "11. |",v_variant,"|"   END IF
   LET v_float = 12345678 LET v_variant = v_float   
   IF v_variant IS NULL   THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",v_variant,"|"   END IF
   LET v_smallfloat = 1234 LET v_variant = v_smallfloat   
   IF v_variant IS NULL   THEN DISPLAY "13. NULL"   ELSE DISPLAY "13. |",v_variant,"|"   END IF
   LET v_boolean = 1 LET v_variant = v_boolean   
   IF v_variant IS NULL   THEN DISPLAY "14. NULL"   ELSE DISPLAY "14. |",v_variant,"|"   END IF
   LET v_date = "12/31/9999" LET v_variant = v_date   
   IF v_variant IS NULL   THEN DISPLAY "15. NULL"   ELSE DISPLAY "15. |",v_variant,"|"   END IF
   LET v_datetime_y_f5 = "9999-12-31 23:59:59.99999" LET v_variant = v_datetime_y_f5 
   IF v_variant IS NULL   THEN DISPLAY "16. NULL"   ELSE DISPLAY "16. |",v_variant,"|"   END IF
   LET v_interval_y_mon = "99-99" LET v_variant = v_interval_y_mon  
   IF v_variant IS NULL   THEN DISPLAY "17. NULL"   ELSE DISPLAY "17. |",v_variant,"|"   END IF
   LET v_interval_d_f5 = "99 23:59:59.99999" LET v_variant = v_interval_d_f5
   IF v_variant IS NULL   THEN DISPLAY "18. NULL"   ELSE DISPLAY "18. |",v_variant,"|"   END IF

END MAIN