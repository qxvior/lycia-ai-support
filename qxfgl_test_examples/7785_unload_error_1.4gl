#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
	DEFINE
      file_for_unload,
      file_for_reference STRING

	WHENEVER ERROR CONTINUE
	DROP TABLE lyc_7785_unload_error_1
	CREATE TABLE lyc_7785_unload_error_1
	(col_char_1 CHAR(80),
 	 col_char_2 CHAR(80)
	)

	INSERT INTO lyc_7785_unload_error_1 VALUES("abc","")
	INSERT INTO lyc_7785_unload_error_1 VALUES("abc",null)
	INSERT INTO lyc_7785_unload_error_1 VALUES("abc","def")
	INSERT INTO lyc_7785_unload_error_1 VALUES("","def")
	INSERT INTO lyc_7785_unload_error_1 VALUES(null,"def")
	INSERT INTO lyc_7785_unload_error_1 VALUES("abc\|","\|\|")
	INSERT INTO lyc_7785_unload_error_1 VALUES("\|abc\|","\|def\|")
	INSERT INTO lyc_7785_unload_error_1 VALUES("\|\|\|","\|\|\|")
	INSERT INTO lyc_7785_unload_error_1 VALUES(null,"\|d\|e\|f")
	INSERT INTO lyc_7785_unload_error_1 VALUES("\|","def")
	INSERT INTO lyc_7785_unload_error_1 VALUES(" "," ")
	INSERT INTO lyc_7785_unload_error_1 VALUES(""," ")
	INSERT INTO lyc_7785_unload_error_1 VALUES(" ","")
	INSERT INTO lyc_7785_unload_error_1 VALUES("","")
	INSERT INTO lyc_7785_unload_error_1 VALUES(null,null)

	UNLOAD TO "7785/7785_unload_error_1.unl" SELECT * FROM lyc_7785_unload_error_1
	IF SQLCA.SQLCODE <> 0 THEN DISPLAY "SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	CALL display_read_file("7785/7785_unload_error_1.unl")

	DROP TABLE lyc_7785_unload_error_1
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
