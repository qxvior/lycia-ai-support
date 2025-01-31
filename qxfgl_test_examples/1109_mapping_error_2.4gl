##########################################################################################################################################
# Author: Bondar A.G.
##########################################################################################################################################

DATABASE stores

MAIN
   DEFINE
      ins_byte_m,   sel_byte_m,
      ins_byte_f,   sel_byte_f   LIKE lyc_1109.col_byte,
      file_for_ins_byte,
      file_for_sel_byte_2        STRING

   LOCATE ins_byte_m IN MEMORY
   LOCATE sel_byte_m IN MEMORY
   LOCATE ins_byte_f IN FILE "1109_file_for_ins_byte.bin"
   LOCATE sel_byte_f IN FILE "1109_file_for_sel_byte.bin"

   WHENEVER ANY ERROR CONTINUE

   DELETE FROM lyc_1109
   LET ins_byte_m = NULL
   INSERT INTO lyc_1109(col_byte) VALUES(ins_byte_m)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_byte_m = NULL
   SELECT col_byte INTO sel_byte_m FROM lyc_1109 WHERE col_byte IS NULL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_byte_m       IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_byte_m,"|"   END IF

   DELETE FROM lyc_1109
   INSERT INTO lyc_1109(col_byte) VALUES(ins_byte_f)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_byte_f = NULL
   SELECT col_byte INTO sel_byte_f FROM lyc_1109
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   CALL read_file_into_string("1109_file_for_ins_byte.bin")RETURNING file_for_ins_byte
   CALL read_file_into_string("1109_file_for_sel_byte.bin")RETURNING file_for_sel_byte_2 

   IF file_for_ins_byte = file_for_sel_byte_2   THEN DISPLAY "6.  PASSED"   ELSE DISPLAY "6.  FAILED"   END IF   

   DISPLAY "7.  ins_byte_m  ",ins_byte_m.gettypefullname(),  ",         sel_byte_m  ", sel_byte_m.gettypefullname() 
   DISPLAY "8.  ins_byte_f  ",ins_byte_f.gettypefullname(),  ",         sel_byte_f  ", sel_byte_f.gettypefullname()

END MAIN
#########################################################################################################################################
# The function returns the contents of the file 'file_name' as a string.
#########################################################################################################################################
FUNCTION read_file_into_string(file_name)
   DEFINE 
      file_name  STRING,
      infile     BASE.CHANNEL,
      ret_string STRING

   LET infile = BASE.CHANNEL.CREATE()
   CALL infile.OpenFile(file_name,"r")

   WHILE TRUE 
      LET ret_string = ret_string,infile.ReadLine()
      IF infile.IsEof()
      THEN EXIT WHILE
      END IF
   END WHILE
   CALL infile.Close()

   RETURN ret_string

END FUNCTION
#########################################################################################################################################
# The function displays the contents of the file 'file_name' to the console.
#########################################################################################################################################
FUNCTION display_read_file(file_name)
   DEFINE
      file_name  STRING,
      infile     BASE.CHANNEL

   LET infile = BASE.CHANNEL.CREATE()
   CALL infile.OpenFile(file_name,"r")

   WHILE TRUE
      DISPLAY infile.ReadLine()
      IF infile.IsEof()
      THEN EXIT WHILE
      END IF
   END WHILE
   CALL infile.Close()

END FUNCTION

