##############################################################################################
# Part of the fm_edit_text_field2 demo application
# Main function
##############################################################################################

##############################################################################################
# Module Variables
##############################################################################################
DEFINE t_test_rec TYPE AS 
    RECORD
      f1 CHAR,  --Character strings, of size up to 32,767 bytes in length - default is 1 if not specified
      f2 CHAR(10),
      f3 CHARACTER(100), -- This keyword is a synonym for CHAR
      f4 VARCHAR,  --Character strings of varying length, for size =< 255 bytes - default = 1
      f5 VARCHAR(10,5),  --Character strings of varying length, for size =< 255 bytes
      f6 VARCHAR(255),  --Character strings of varying length, for size =< 255 bytes min 5 max 10
      f7 NCHAR, -- default size 1 - Character strings, of size up to 32,767 bytes in length
      f8 NCHAR(10),  -- Character strings, of size up to 32,767 bytes in length
      f9 NVARCHAR,	-- default size - Character strings of varying leng
      f10 NVARCHAR(250), -- Character strings of varying length, for size
      f11 TEXT,  --  Character strings of up to 2'31' bytes
      f11b TEXT,  --  Character strings of up to 2'31' bytes
      f12 SMALLINT, --  Whole numbers, from -32,767 to +32,767
      f13 INTEGER,  --  Whole numbers, from -2,147,483,647 to +2,147,483,647
      f14 INT, -- This keyword is a synonym for INTEGER
      f15 SMALLFLOAT,  -- Floating-point numbers, of up to 16-digit precision
      f16 REAL,  -- This keyword is a synonym for SMALLFLOAT - 
      f17 FLOAT,  -- Floating-point numbers, of up to 32-digit precision
      f18 DOUBLE PRECISION,  --synonym for Float
      f19 DECIMAL(30,15),  --Floating-point numbers, of a specified precision
      f20 DEC(8,2),  -- Fixed-point numbers, of a specified scale and precision, This keyword is a synonym for DECIMAL
      f21 NUMERIC(6),  --This keyword is a synonym for DECIMAL  (totoal length - precission defaults to 2)
      f22 NUMERIC,  -- Default precision is 16 (if not specified)
      f23 MONEY(8,2),  --  Currency amounts, with definable scale and precision
      f24 DATE,  --Points in time, specified as calendar dates
      f25 DATETIME YEAR TO DAY,  --Points in time, specified as calendar dates and time-of-day
      f26 INTERVAL YEAR TO MONTH,  --Spans of time in years and months, or in smaller time units

      f27 BYTE,  --Any kind of binary data, of length up to 231 bytes
      f27a BYTE,  --Any kind of binary data, of length up to 231 bytes
      f27b BYTE,  --Any kind of binary data, of length up to 231 bytes

      f28 BYTE,  --Any kind of binary data, of length up to 231 bytes
      f28a BYTE,  --Any kind of binary data, of length up to 231 bytes
      f28b BYTE,  --Any kind of binary data, of length up to 231 bytes

      f29 BYTE,  --Any kind of binary data, of length up to 231 bytes
      f29a BYTE,  --Any kind of binary data, of length up to 231 bytes
      f29b BYTE,  --Any kind of binary data, of length up to 231 bytes


      info CHAR(4096)  --Character strings, of size up to 32,767 bytes in length - default is 1 if not specified
    END RECORD


  DEFINE test_rec OF t_test_rec 
  


##################################################################################
# MAIN
#
#
##################################################################################
MAIN
  DEFINE a char(100)
  DEFINE where_text CHAR(1000)
  DEFER INTERRUPT
	CALL ui_init()
  #Reduce the default screen window size in gui
  IF fgl_fglgui() THEN
    CALL fgl_putenv("LINES=24")
    CALL fgl_putenv("COLUMNS=80")

  ELSE
    CALL fgl_putenv("LINES=24")
    CALL fgl_putenv("COLUMNS=80")

  END IF

  OPTIONS 
    FORM LINE 1,
    HELP KEY F1,
    #HELP FILE "msg/fm_field.erm",
    ACCEPT KEY RETURN,
    PROMPT LINE FIRST,
    MESSAGE LINE FIRST,
    COMMENT LINE FIRST

  CALL init_test_rec()

	OPEN WINDOW w_per WITH FORM "per/per_datatypes"
	CALL ui.Interface.setText("PER DataTypes")	
  MENU "per menu"

		COMMAND "DISPLAY"
			DISPLAY BY NAME test_rec.*
			
  	COMMAND "INPUT"
			INPUT BY NAME test_rec.* 
				WITHOUT DEFAULTS HELP 100

		COMMAND "CLEAR FORM"
			CLEAR FORM	
					  
  	COMMAND "CANCEL" "Exit Menu"
  		EXIT MENU
  END MENU

END MAIN
##################################################################################
# END MAIN
#
#
##################################################################################


##################################################################################
# FUNCTION init_test_rec()  
#
#
##################################################################################
FUNCTION init_test_rec()
  #LOCATE test_rec.f11 in memory
    
	LOCATE test_rec.f11 IN FILE "txt/letter.txt"
	LOCATE test_rec.f11b IN FILE "txt/letter.txt"
	
	LOCATE test_rec.f27 IN FILE "image/gd_passport_pic.jpg"
	LOCATE test_rec.f27a IN FILE "image/gd_passport_pic.jpg"
	LOCATE test_rec.f27b IN FILE "image/gd_passport_pic.jpg"

	LOCATE test_rec.f28 IN FILE "document/coversheet.pdf"
	LOCATE test_rec.f28a IN FILE "document/coversheet.pdf"
	LOCATE test_rec.f28b IN FILE "document/coversheet.pdf"


	LOCATE test_rec.f29 IN FILE "txt/letter.txt"
	LOCATE test_rec.f29a IN FILE "txt/letter.txt"
	LOCATE test_rec.f29b IN FILE "txt/letter.txt"

  LET test_rec.f1 =  "A" -- CHAR default = 1
  LET test_rec.f2 =  "10ABCDEFG1"  -- CHAR(10)
  LET test_rec.f3 =  "100_ABC_1_ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJ" --CHAR(100)
  LET test_rec.f4 =  "A" -- VARCHAR - default size = 1
  LET test_rec.f5 =  "VARCHAR_2A"  -- VARCHAR(10,5)
  LET test_rec.f6 =  "VARCHAR_1A123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" --VARCHAR(255)
  LET test_rec.f7 =  "A"  -- NCHAR - default size = 1
  LET test_rec.f8 =  "NChar(10)A"  --NCHAR(10)
  LET test_rec.f9 =  "A"
  LET test_rec.f10 = "NVARCHAR2A123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
  #LET test_rec.f11 = "A-Is this an extra long text block \n With some stuff\nin what format do I have to assign TEXT to a TEXT variable"  --TEXT
  LET test_rec.f12 = 32767  -- -32,767  SMALLINT
  LET test_rec.f13 = 214748364  --INTEGER/INT
  LET test_rec.f14 = -214748364  --INTEGER/INT
  LET test_rec.f15 = 1234567.00  --SMALLFLOAT/REAL
  LET test_rec.f16 = -1234567.00  --SMALLFLOAT/REAL
  LET test_rec.f17 = 1234567890.12  -- FLOAT/DOUBLE PRECISION
  LET test_rec.f18 = -1234567890.12  -- FLOAT/DOUBLE PRECISION
  LET test_rec.f19 = 1234567890.123  -- DECIMAL/DEC/NUMERIC
  LET test_rec.f20 = -123456.12  -- DECIMAL/DEC/NUMERIC
  LET test_rec.f21 = 1234.12  -- DECIMAL/DEC/NUMERIC
  LET test_rec.f22 = -12345678.12  -- DECIMAL/DEC/NUMERIC
  LET test_rec.f23 = 123456.12  -- money
  LET test_rec.f24 = "10/10/10"  -- DATE
  LET test_rec.f25 = "2010-10-10"  -- DATETIME YEAR TO DAY
  LET test_rec.f26 = "04-02"  -- INTERVAL YEAR TO MONTH
  --	LET test_rec.f27 = "BYTE_1____123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"

  LET test_rec.info =                        "VARCHAR_1A12345678901234567890123456789012345678901234567890123456789012345678901234567890\n1234567890123456789012345678901234567890123456789012345678901234567890123456789\n012345678901234567890123456789012345678901234567890123456789012345678901234567890\n\n" --VARCHAR(255)
  LET test_rec.info = test_rec.info CLIPPED, test_rec.info CLIPPED  # "VARCHAR_1A12345678901234567890123456789012345678901234567890123456789012345678901234567890\n1234567890123456789012345678901234567890123456789012345678901234567890123456789\n012345678901234567890123456789012345678901234567890123456789012345678901234567890\n\n" --VARCHAR(255)
#  LET test_rec.info = test_rec.info CLIPPED, "VARCHAR_1A12345678901234567890123456789012345678901234567890123456789012345678901234567890\n1234567890123456789012345678901234567890123456789012345678901234567890123456789\n012345678901234567890123456789012345678901234567890123456789012345678901234567890\n\n" --VARCHAR(255)
  LET test_rec.info = test_rec.info CLIPPED, test_rec.info CLIPPED  
  LET test_rec.info = test_rec.info CLIPPED, test_rec.info CLIPPED    
END FUNCTION
##################################################################################
# END FUNCTION init_test_rec()  
##################################################################################