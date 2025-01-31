################################################################################
# Module Scope Variables
################################################################################
DEFINE modu_initial_arr_size SMALLINT
DEFINE modu_full_data DYNAMIC ARRAY OF 
	RECORD
		f1,f2,f3 STRING,
		f4 INT,
		f5 DATE
	END RECORD


################################################################################
# MAIN
#
#
################################################################################ 
MAIN
	DEFINE i INT
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	DEFER INTERRUPT
	
	CALL ui_init()
	CALL initData()							#init master array with data  (also creates an array duplicate/casting just for demo purpose)
	CALL hideNavigation()
	
	OPEN WINDOW mywin WITH FORM "form/cnt_table"
	CALL ui.Interface.setText("Table")
	
	MENU 
		ON ACTION "DISPLAY"
			DISPLAY ARRAY modu_full_data TO sc1.*
			END DISPLAY

		ON ACTION "INPUT"
			INPUT ARRAY modu_full_data  WITHOUT DEFAULTS  FROM sc1.*
			END INPUT

		ON ACTION "CANCEL"
			EXIT MENU

    ON ACTION "HELP"
  		CALL onlineHelp(NULL,"TableAll")	
  					
	END MENU


END MAIN
################################################################################
# END MAIN
################################################################################ 


################################################################################
# FUNCTION initData()
#
#
################################################################################
FUNCTION initData()
	DEFINE i int

	LET modu_initial_arr_size = 300

	FOR i = 1 TO modu_initial_arr_size
		LET modu_full_data[i].f1 = "Original Data - row ", trim(i), " - f1"
		LET modu_full_data[i].f2 = "Original Data - row ", trim(i), " - f2"
		LET modu_full_data[i].f3 = "Original Data - row ", trim(i), " - f3"		
		LET modu_full_data[i].f4 = fgl_random(1,1000000) USING "&&&&&&&"
		LET modu_full_data[i].f5 = fgl_random(38000,45000) #nasty random date generation

	END FOR

END FUNCTION
################################################################################
# END FUNCTION initData()
################################################################################