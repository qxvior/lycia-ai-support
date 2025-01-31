##################################################################################
# Module Scope
##################################################################################
DEFINE recTest 
	RECORD
		f1 CHAR,
		f2 VARCHAR(30),
		f3 STRING,
		f4 INT,
		f5 FLOAT,
		f6 DECIMAL (8,2),
		f7 MONEY(8,2),
		f8 DATETIME HOUR TO SECOND,
		f9 DATE,
		f10 INTERVAL YEAR TO MONTH
	END RECORD

##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	define msg STRING
	
	CALL ui_init()

	CALL init_data()

	OPTIONS INPUT WRAP	
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
		
	DEFER INTERRUPT
	
	OPEN WINDOW wTextField WITH FORM "form/wig_textField_datatype" 
	
	
	MENU

		ON ACTION "DISPLAY"
			DISPLAY BY NAME recTest.*
			
		ON ACTION "INPUT"
			INPUT BY NAME recTest.* WITHOUT DEFAULTS	
			END INPUT
			
    ON ACTION "CANCEL"
    	EXIT MENU
	  	
    ON ACTION "HELP"
    	CALL onlineHelp("TextField",NULL)		
    
	END MENU

END MAIN


FUNCTION init_data()
	LET recTest.f1 = "Y"	-- CHAR default = 1
	LET recTest.f2 = "Hubert Hölzl" --VARCHAR(30)
	LET recTest.f3 = "I'll tell you a story about my life. This string is long enough!"	--STRING
	LET recTest.f4 = 123	--INTEGER/INT
	LET recTest.f5 = 1234567890.12  -- FLOAT/DOUBLE PRECISION
	LET recTest.f6 = -123456.12  -- DECIMAL/DEC/NUMERIC
	LET recTest.f7 = 123456.12  -- MONEY
	LET recTest.f8 = "23:45:00"	--DATETIME HOUR TO SECOND
	LET recTest.f9 = DATE("24/12/2019")
	LET recTest.f10 = "04-02"  -- INTERVAL YEAR TO MONTH
		
END FUNCTION

