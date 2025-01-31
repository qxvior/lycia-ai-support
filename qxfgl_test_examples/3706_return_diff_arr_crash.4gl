MAIN
	DEFINE myMainArr DYNAMIC ARRAY OF RECORD
			inv_text nchar(20),			
			vouch_code integer
		END RECORD
	CALL get_arr() RETURNING myMainArr
	DISPLAY myMainArr[1].*
	DISPLAY "END OF TEST CASE - will NEVER show.. SILENT BANG/Exception happens prior"
END MAIN

FUNCTION get_arr()
	DEFINE i SMALLINT
	DEFINE myArr DYNAMIC ARRAY OF 	RECORD
			cmpy_code char(2), --extra field non existent in return array
			inv_text nchar(20),			
			vouch_code integer
		END RECORD	
		
	LET myArr[1].inv_text = "Angela12"
	LET myArr[1].vouch_code = "1234"
	DISPLAY myArr[1].*
	DISPLAY "END OF FUNCTION get_arr()"
	RETURN myArr 
END FUNCTION	

	