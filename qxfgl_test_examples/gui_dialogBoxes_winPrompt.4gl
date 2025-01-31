################################################################################
# Module Scope Variables
################################################################################
DEFINE recWinPrompt OF RECORD
	f1_pos_col,f1_pos_row SMALLINT,	f1_message,f1_text STRING,	f1_input_length,f1_data_type SMALLINT,	#f1_return STRING,
	f2_pos_col,f2_pos_row SMALLINT,	f2_message,f2_text STRING,	f2_input_length,f2_data_type SMALLINT,	#f2_return STRING,
	f3_pos_col,f3_pos_row SMALLINT,	f3_message,f3_text STRING,	f3_input_length,f3_data_type SMALLINT,	#f3_return STRING,
	f4_pos_col,f4_pos_row SMALLINT,	f4_message,f4_text STRING,	f4_input_length,f4_data_type SMALLINT,	#f4_return STRING,
	f5_pos_col,f5_pos_row SMALLINT,	f5_message,f5_text STRING,	f5_input_length,f5_data_type SMALLINT--,	#f5_return STRING
	END RECORD

DEFINE arrRecReturn ARRAY[5] OF RECORD
	char_return STRING	,
	smallint_return SMALLINT	,
	int_return INTEGER,
	date_return DATE
END RECORD
	
################################################################################
# MAIN
#
#
################################################################################	
MAIN
	CALL ui_init()

	CALL ui.Interface.setText("fgl_winbutton()")	

	CALL initData()

	OPEN WINDOW wGui_dialogBoxes_winPrompt WITH FORM "form/gui_dialogBoxes_winPrompt"

	CALL populateComboBoxes()
	
	INPUT BY NAME recWinPrompt.* WITHOUT DEFAULTS ATTRIBUTE(UNBUFFERED)
		BEFORE INPUT
			CALL dialog.setActionHidden("CANCEL",TRUE)
			CALL dialog.setActionHidden("ACCEPT",TRUE)
			
		ON ACTION "actButton1"
			#we need this CASE due testing the different dataTypes
			CASE recWinPrompt.f1_data_type
				WHEN "0" 		
					LET arrRecReturn[1].char_return = fgl_winprompt(recWinPrompt.f1_pos_col,recWinPrompt.f1_pos_row,recWinPrompt.f1_message,recWinPrompt.f1_text,recWinPrompt.f1_input_length,recWinPrompt.f1_data_type)
					DISPLAY arrRecReturn[1].char_return TO f1_return
				WHEN "1"		
					LET arrRecReturn[1].smallint_return = fgl_winprompt(recWinPrompt.f1_pos_col,recWinPrompt.f1_pos_row,recWinPrompt.f1_message,recWinPrompt.f1_text,recWinPrompt.f1_input_length,recWinPrompt.f1_data_type)
					DISPLAY arrRecReturn[1].smallint_return TO f1_return
				WHEN "2"		
					LET arrRecReturn[1].int_return = fgl_winprompt(recWinPrompt.f1_pos_col,recWinPrompt.f1_pos_row,recWinPrompt.f1_message,recWinPrompt.f1_text,recWinPrompt.f1_input_length,recWinPrompt.f1_data_type)
					DISPLAY arrRecReturn[1].int_return TO f1_return
				WHEN "7"		
					LET arrRecReturn[1].date_return = fgl_winprompt(recWinPrompt.f1_pos_col,recWinPrompt.f1_pos_row,recWinPrompt.f1_message,recWinPrompt.f1_text,recWinPrompt.f1_input_length,recWinPrompt.f1_data_type)
					DISPLAY arrRecReturn[1].date_return TO f1_return
				WHEN "255"	
					LET arrRecReturn[1].char_return = fgl_winprompt(recWinPrompt.f1_pos_col,recWinPrompt.f1_pos_row,recWinPrompt.f1_message,recWinPrompt.f1_text,recWinPrompt.f1_input_length,recWinPrompt.f1_data_type)
					DISPLAY arrRecReturn[1].char_return TO f1_return
			END CASE


		ON ACTION "actButton2"
			#we need this CASE due testing the different dataTypes
			CASE recWinPrompt.f2_data_type
				WHEN "0" 		
					LET arrRecReturn[2].char_return = fgl_winprompt(recWinPrompt.f2_pos_col,recWinPrompt.f2_pos_row,recWinPrompt.f2_message,recWinPrompt.f2_text,recWinPrompt.f2_input_length,recWinPrompt.f2_data_type)
					DISPLAY arrRecReturn[2].char_return TO f2_return
				WHEN "1"		
					LET arrRecReturn[2].smallint_return = fgl_winprompt(recWinPrompt.f2_pos_col,recWinPrompt.f2_pos_row,recWinPrompt.f2_message,recWinPrompt.f2_text,recWinPrompt.f2_input_length,recWinPrompt.f2_data_type)
					DISPLAY arrRecReturn[2].smallint_return TO f2_return
				WHEN "2"		
					LET arrRecReturn[2].int_return = fgl_winprompt(recWinPrompt.f2_pos_col,recWinPrompt.f2_pos_row,recWinPrompt.f2_message,recWinPrompt.f2_text,recWinPrompt.f2_input_length,recWinPrompt.f2_data_type)
					DISPLAY arrRecReturn[2].int_return TO f2_return
				WHEN "7"		
					LET arrRecReturn[2].date_return = fgl_winprompt(recWinPrompt.f2_pos_col,recWinPrompt.f2_pos_row,recWinPrompt.f2_message,recWinPrompt.f2_text,recWinPrompt.f2_input_length,recWinPrompt.f2_data_type)
					DISPLAY arrRecReturn[2].date_return TO f2_return
				WHEN "255"	
					LET arrRecReturn[2].char_return = fgl_winprompt(recWinPrompt.f2_pos_col,recWinPrompt.f2_pos_row,recWinPrompt.f2_message,recWinPrompt.f2_text,recWinPrompt.f2_input_length,recWinPrompt.f2_data_type)
					DISPLAY arrRecReturn[2].char_return TO f2_return
			END CASE


		ON ACTION "actButton3"

			#we need this CASE due testing the different dataTypes
			CASE recWinPrompt.f3_data_type
				WHEN "0" 		
					LET arrRecReturn[3].char_return = fgl_winprompt(recWinPrompt.f3_pos_col,recWinPrompt.f3_pos_row,recWinPrompt.f3_message,recWinPrompt.f3_text,recWinPrompt.f3_input_length,recWinPrompt.f3_data_type)
					DISPLAY arrRecReturn[3].char_return TO f3_return
				WHEN "1"		
					LET arrRecReturn[3].smallint_return = fgl_winprompt(recWinPrompt.f3_pos_col,recWinPrompt.f3_pos_row,recWinPrompt.f3_message,recWinPrompt.f3_text,recWinPrompt.f3_input_length,recWinPrompt.f3_data_type)
					DISPLAY arrRecReturn[3].smallint_return TO f3_return
				WHEN "2"		
					LET arrRecReturn[3].int_return = fgl_winprompt(recWinPrompt.f3_pos_col,recWinPrompt.f3_pos_row,recWinPrompt.f3_message,recWinPrompt.f3_text,recWinPrompt.f3_input_length,recWinPrompt.f3_data_type)
					DISPLAY arrRecReturn[3].int_return TO f3_return
				WHEN "7"		
					LET arrRecReturn[3].date_return = fgl_winprompt(recWinPrompt.f3_pos_col,recWinPrompt.f3_pos_row,recWinPrompt.f3_message,recWinPrompt.f3_text,recWinPrompt.f3_input_length,recWinPrompt.f3_data_type)
					DISPLAY arrRecReturn[3].date_return TO f3_return
				WHEN "255"	
					LET arrRecReturn[3].char_return = fgl_winprompt(recWinPrompt.f3_pos_col,recWinPrompt.f3_pos_row,recWinPrompt.f3_message,recWinPrompt.f3_text,recWinPrompt.f3_input_length,recWinPrompt.f3_data_type)
					DISPLAY arrRecReturn[3].char_return TO f3_return
			END CASE


		ON ACTION "actButton4"

			#we need this CASE due testing the different dataTypes
			CASE recWinPrompt.f4_data_type
				WHEN "0" 		
					LET arrRecReturn[4].char_return = fgl_winprompt(recWinPrompt.f4_pos_col,recWinPrompt.f4_pos_row,recWinPrompt.f4_message,recWinPrompt.f4_text,recWinPrompt.f4_input_length,recWinPrompt.f4_data_type)
					DISPLAY arrRecReturn[4].char_return TO f4_return
				WHEN "1"		
					LET arrRecReturn[4].smallint_return = fgl_winprompt(recWinPrompt.f4_pos_col,recWinPrompt.f4_pos_row,recWinPrompt.f4_message,recWinPrompt.f4_text,recWinPrompt.f4_input_length,recWinPrompt.f4_data_type)
					DISPLAY arrRecReturn[4].smallint_return TO f4_return
				WHEN "2"		
					LET arrRecReturn[4].int_return = fgl_winprompt(recWinPrompt.f4_pos_col,recWinPrompt.f4_pos_row,recWinPrompt.f4_message,recWinPrompt.f4_text,recWinPrompt.f4_input_length,recWinPrompt.f4_data_type)
					DISPLAY arrRecReturn[4].int_return TO f4_return
				WHEN "7"		
					LET arrRecReturn[4].date_return = fgl_winprompt(recWinPrompt.f4_pos_col,recWinPrompt.f4_pos_row,recWinPrompt.f4_message,recWinPrompt.f4_text,recWinPrompt.f4_input_length,recWinPrompt.f4_data_type)
					DISPLAY arrRecReturn[4].date_return TO f4_return
				WHEN "255"	
					LET arrRecReturn[4].char_return = fgl_winprompt(recWinPrompt.f4_pos_col,recWinPrompt.f4_pos_row,recWinPrompt.f4_message,recWinPrompt.f4_text,recWinPrompt.f4_input_length,recWinPrompt.f4_data_type)
					DISPLAY arrRecReturn[4].char_return TO f4_return
			END CASE

		ON ACTION "actButton5"
			#we need this CASE due testing the different dataTypes
			CASE recWinPrompt.f5_data_type
				WHEN "0" 		
					LET arrRecReturn[5].char_return = fgl_winprompt(recWinPrompt.f5_pos_col,recWinPrompt.f5_pos_row,recWinPrompt.f5_message,recWinPrompt.f5_text,recWinPrompt.f5_input_length,recWinPrompt.f5_data_type)
					DISPLAY arrRecReturn[5].char_return TO f5_return
				WHEN "1"		
					LET arrRecReturn[5].smallint_return = fgl_winprompt(recWinPrompt.f5_pos_col,recWinPrompt.f5_pos_row,recWinPrompt.f5_message,recWinPrompt.f5_text,recWinPrompt.f5_input_length,recWinPrompt.f5_data_type)
					DISPLAY arrRecReturn[5].smallint_return TO f5_return
				WHEN "2"		
					LET arrRecReturn[5].int_return = fgl_winprompt(recWinPrompt.f5_pos_col,recWinPrompt.f5_pos_row,recWinPrompt.f5_message,recWinPrompt.f5_text,recWinPrompt.f5_input_length,recWinPrompt.f5_data_type)
					DISPLAY arrRecReturn[5].int_return TO f5_return
				WHEN "7"		
					LET arrRecReturn[5].date_return = fgl_winprompt(recWinPrompt.f5_pos_col,recWinPrompt.f5_pos_row,recWinPrompt.f5_message,recWinPrompt.f5_text,recWinPrompt.f5_input_length,recWinPrompt.f5_data_type)
					DISPLAY arrRecReturn[5].date_return TO f5_return
				WHEN "255"	
					LET arrRecReturn[5].char_return = fgl_winprompt(recWinPrompt.f5_pos_col,recWinPrompt.f5_pos_row,recWinPrompt.f5_message,recWinPrompt.f5_text,recWinPrompt.f5_input_length,recWinPrompt.f5_data_type)
					DISPLAY arrRecReturn[5].char_return TO f5_return
			END CASE

		ON ACTION "Exit"
			EXIT INPUT
			
    ON ACTION "HELP"
  		CALL onlineHelp("fgl_winprompt",NULL)				
	END INPUT
END MAIN	

	
################################################################################
# FUNCTION initData()
#
#
################################################################################
FUNCTION initData()
	LET recWinPrompt.f1_pos_col = 1
	LET recWinPrompt.f1_pos_row = 1
	LET recWinPrompt.f1_message = "Enter a STRING value"
	LET recWinPrompt.f1_text = "My default String"
	LET	recWinPrompt.f1_input_length = 20
	LET recWinPrompt.f1_data_type = 0
	#LET	recWinPrompt.f1_return = "Return will be shown here"

	LET recWinPrompt.f2_pos_col = 1
	LET recWinPrompt.f2_pos_row = 1
	LET recWinPrompt.f2_message = "Enter a SMALLINT value"
	LET recWinPrompt.f2_text = "111"
	LET	recWinPrompt.f2_input_length = 5
	LET recWinPrompt.f2_data_type = 1
#	LET	recWinPrompt.f2_return = "Return will be shown here"

	LET recWinPrompt.f3_pos_col = 1
	LET recWinPrompt.f3_pos_row = 1
	LET recWinPrompt.f3_message = "Enter a INTEGER value"
	LET recWinPrompt.f3_text = "999999990"
	LET	recWinPrompt.f3_input_length = 10
	LET recWinPrompt.f3_data_type = 2
	#LET	recWinPrompt.f3_return = "Return will be shown here"

	LET recWinPrompt.f4_pos_col = 1
	LET recWinPrompt.f4_pos_row = 1
	LET recWinPrompt.f4_message = "Enter a DATE value"
	LET recWinPrompt.f4_text = "12/12/2012"
	LET	recWinPrompt.f4_input_length = 10
	LET recWinPrompt.f4_data_type = 7
	#LET	recWinPrompt.f4_return = "Return will be shown here"

	LET recWinPrompt.f5_pos_col = 1
	LET recWinPrompt.f5_pos_row = 1
	LET recWinPrompt.f5_message = "Enter a INVISIBLE value"
	LET recWinPrompt.f5_text = "My default INVISIBLE"
	LET	recWinPrompt.f5_input_length = 15
	LET recWinPrompt.f5_data_type = 255
#	LET	recWinPrompt.f5_return = "Return will be shown here"

END FUNCTION
	
	
################################################################################
# FUNCTION populateComboBoxes()
#
#
################################################################################	
FUNCTION populateComboBoxes()
	CALL ui.ComboBox.ForName("f1_data_type").addItem(0,"0=CHAR")
	CALL ui.ComboBox.ForName("f1_data_type").addItem(1,"1=SMALLINT")
	CALL ui.ComboBox.ForName("f1_data_type").addItem(2,"2=INTEGER")
	CALL ui.ComboBox.ForName("f1_data_type").addItem(7,"7=DATE")
	CALL ui.ComboBox.ForName("f1_data_type").addItem(255,"255=INVISIBLE")
	
	CALL ui.ComboBox.ForName("f2_data_type").addItem(0,"0=CHAR")
	CALL ui.ComboBox.ForName("f2_data_type").addItem(1,"1=SMALLINT")
	CALL ui.ComboBox.ForName("f2_data_type").addItem(2,"2=INTEGER")
	CALL ui.ComboBox.ForName("f2_data_type").addItem(7,"7=DATE")
	CALL ui.ComboBox.ForName("f2_data_type").addItem(255,"255=INVISIBLE")

	CALL ui.ComboBox.ForName("f3_data_type").addItem(0,"0=CHAR")
	CALL ui.ComboBox.ForName("f3_data_type").addItem(1,"1=SMALLINT")
	CALL ui.ComboBox.ForName("f3_data_type").addItem(2,"2=INTEGER")
	CALL ui.ComboBox.ForName("f3_data_type").addItem(7,"7=DATE")
	CALL ui.ComboBox.ForName("f3_data_type").addItem(255,"255=INVISIBLE")

	CALL ui.ComboBox.ForName("f4_data_type").addItem(0,"0=CHAR")
	CALL ui.ComboBox.ForName("f4_data_type").addItem(1,"1=SMALLINT")
	CALL ui.ComboBox.ForName("f4_data_type").addItem(2,"2=INTEGER")
	CALL ui.ComboBox.ForName("f4_data_type").addItem(7,"7=DATE")
	CALL ui.ComboBox.ForName("f4_data_type").addItem(255,"255=INVISIBLE")

	CALL ui.ComboBox.ForName("f5_data_type").addItem(0,"0=CHAR")
	CALL ui.ComboBox.ForName("f5_data_type").addItem(1,"1=SMALLINT")
	CALL ui.ComboBox.ForName("f5_data_type").addItem(2,"2=INTEGER")
	CALL ui.ComboBox.ForName("f5_data_type").addItem(7,"7=DATE")
	CALL ui.ComboBox.ForName("f5_data_type").addItem(255,"255=INVISIBLE")

END FUNCTION	