##########################################################################################################################################
# Author: Bondar A.G.
##########################################################################################################################################

DATABASE stores

MAIN
   DEFINE
      ins_text_m,   sel_text_m,
      ins_text_f,   sel_text_f   LIKE lyc_1104.col_text,
      file_for_ins_text,
      file_for_sel_text_1        STRING

   LOCATE ins_text_m IN MEMORY
   LOCATE sel_text_m IN MEMORY
   LOCATE ins_text_f IN FILE "1104_file_for_ins_text.txt"
   LOCATE sel_text_f IN FILE "1104_file_for_sel_text.txt"

   WHENEVER ANY ERROR CONTINUE

   DELETE FROM lyc_1104
   LET ins_text_m = NULL
   INSERT INTO lyc_1104(col_text) VALUES(ins_text_m)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_text_m = "Use the IN MEMORY option to allocate storage in memory for TEXT and BYTE values."
   SELECT col_text INTO sel_text_m FROM lyc_1104 WHERE col_text IS NULL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_text_m       IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_text_m,"|"   END IF

   DELETE FROM lyc_1104
   LET ins_text_m = "Use the IN MEMORY option to allocate storage in memory for TEXT and BYTE values."
   INSERT INTO lyc_1104(col_text) VALUES(ins_text_m)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_text_m = NULL
   SELECT col_text INTO sel_text_m FROM lyc_1104
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_text_m       IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_text_m,"|"   END IF

   DELETE FROM lyc_1104
   INSERT INTO lyc_1104(col_text) VALUES(ins_text_f)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_text_f = NULL
   SELECT col_text INTO sel_text_f FROM lyc_1104
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   CALL read_file_into_string("1104_file_for_ins_text.txt")RETURNING file_for_ins_text
   CALL read_file_into_string("1104_file_for_sel_text.txt")RETURNING file_for_sel_text_1 

   IF file_for_ins_text = file_for_sel_text_1   THEN DISPLAY "9.  PASSED"   ELSE DISPLAY "9.  FAILED"   END IF   

   DISPLAY "10. ins_text_m  ",ins_text_m.gettypefullname(),  ",         sel_text_m  ", sel_text_m.gettypefullname()
   DISPLAY "11. ins_text_f  ",ins_text_f.gettypefullname(),  ",         sel_text_f  ", sel_text_f.gettypefullname()   

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

