#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      err_code  INTEGER,
      v_integer INTEGER,
      v_decimal DECIMAL(8,2),
      v_char    CHAR(20),
      v_date    DATE

   WHENEVER ERROR CONTINUE
	DROP TABLE lyc_7489
	CREATE TABLE lyc_7489
	(col_integer INTEGER,
  	 col_decimal DECIMAL(16,2),
 	 col_char CHAR(80),
 	 col_date DATE
 	)

   DECLARE cur_insert CURSOR FOR
      INSERT INTO lyc_7489 VALUES(v_integer,v_decimal,v_char,v_date)

   DECLARE cur_sel CURSOR FOR
      SELECT * FROM lyc_7489 ORDER BY 1

   # INSERT CURSOR
   DELETE FROM lyc_7489
   BEGIN WORK
   LET v_integer = 0
   LET v_decimal = 0
   LET v_date    = "12/31/2022"
   LET err_code = 0
   OPEN cur_insert
   WHILE v_integer < 10
      LET v_integer = v_integer + 1
      LET v_decimal = v_decimal + 1.01
      LET v_char    = "row number ",v_integer USING "<<<<&"
      LET v_date    = v_date + 1 UNITS DAY
      IF status <> 0
      THEN LET err_code = status
           EXIT WHILE
      END IF

      PUT cur_insert

   END WHILE

   IF err_code = 0 THEN
        FLUSH cur_insert
        IF status = 0
        THEN COMMIT WORK
        ELSE ROLLBACK WORK
        END IF
   ELSE DISPLAY "status = ",err_code
        ROLLBACK WORK
   END IF
   CLOSE cur_insert

   FOREACH cur_sel INTO v_integer,v_decimal,v_char,v_date
      DISPLAY v_integer,v_decimal," ",v_char,v_date
   END FOREACH

END MAIN
