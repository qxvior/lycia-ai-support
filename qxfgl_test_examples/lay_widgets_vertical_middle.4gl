##################################################################################
# Module Variables
##################################################################################
DEFINE recData RECORD
		f1 STRING,    --textField
		f2 SMALLINT,  --FunctionField
		f3 SMALLINT,  --ComboBox
		f4 DATE,
		f5 INT,
		f6 SMALLINT, -- CheckBox  -1,0,1
		f7 SMALLINT, -- 1,2,3,4,5
		f8 BYTE,  --blob
		f9 STRING,
		f10 STRING,
		f11 SMALLINT,
		f12 SMALLINT,
		f13 BOOLEAN,
		f14 SMALLINT, 	
		f15 STRING, 	
		f16 SMALLINT,
		f17 DATETIME HOUR TO MINUTE,

		f1b STRING,    --textField
		f2b SMALLINT,  --FunctionField
		f3b SMALLINT,  --ComboBox
		f4b DATE,
		f5b INT,
		f6b SMALLINT, -- CheckBox  -1,0,1
		f7b SMALLINT, -- 1,2,3,4,5
		f8b BYTE,  --blob
		f9b STRING,
		f10b STRING,
		f11b SMALLINT,
		f12b SMALLINT,
		f13b BOOLEAN,
		f14b SMALLINT, 	
		f15b STRING, 	
		f16b SMALLINT,
		f17b DATETIME HOUR TO MINUTE

	END RECORD

	
DEFINE formList SMALLINT
DEFINE formFile STRING
DEFINE arrFormPath DYNAMIC ARRAY OF STRING

DEFINE mdDialogWindow BOOLEAN
DEFINE glDataInitialised BOOLEAN



##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	CALL ui_init()
	
	DEFER INTERRUPT

	OPTIONS INPUT WRAP	
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit

	LET  mdDialogWindow = TRUE	
		
	LET formFile = "form/lay_widgets_vertical_middle"	
	LET glDataInitialised = FALSE
	LET mdDialogWindow = FALSE
	
	WHILE TRUE

		CALL fgl_window_open("wLayWidgets", 1, 1, formFile, mdDialogWindow)
		CALL ui.Interface.setText("Layout Vertical")
	
		DISPLAY BY NAME recData.*
		
		MENU
			BEFORE MENU
				IF mdDialogWindow = TRUE THEN
					HIDE OPTION "Dialog Window"
				ELSE
					HIDE OPTION "Full Screen"
				END IF	
				
				IF glDataInitialised = TRUE THEN  --no need to show this toolbar button if the data were already initialised and shown on the screen
					CALL fgl_dialog_setkeylabel("Display","")
				END IF			
				
							
			ON ACTION "Full Screen"
				LET  mdDialogWindow = FALSE			
					HIDE OPTION "Full Screen"
					SHOW OPTION "Dialog Window"
				EXIT MENU
				
			ON ACTION "Dialog Window"
				LET  mdDialogWindow = TRUE			
					SHOW OPTION "Full Screen"
					HIDE OPTION "Dialog Window"
				EXIT MENU

			ON ACTION "Edit"
				CALL initData()
				LET glDataInitialised = TRUE
				DISPLAY "Hofbräuhaus,Platzl 9,Munich,80331,Bavaria,Germany" TO f19			
				DISPLAY "Hofbräuhaus,Platzl 9,Munich,80331,Bavaria,Germany" TO f19b			
				
				CALL editRecord()
				CALL fgl_dialog_setkeylabel("Display","")

			ON ACTION "Display"
				CALL initData()
				DISPLAY BY NAME recData.*		
				DISPLAY "Hofbräuhaus,Platzl 9,Munich,80331,Bavaria,Germany" TO f19
				DISPLAY "Hofbräuhaus,Platzl 9,Munich,80331,Bavaria,Germany" TO f19b			
				
				LET glDataInitialised = TRUE
				CALL fgl_dialog_setkeylabel("Display","")
				

				
			ON ACTION "Exit"
				EXIT WHILE
				
		END MENU

				CALL fgl_window_close("wLayWidgets")			

	END WHILE 

END MAIN


##################################################################################
# FUNCTION editRecord()
#
#
##################################################################################
FUNCTION editRecord()
	INPUT BY NAME recData.* WITHOUT DEFAULTS
		ON ACTION "act_Button"
			CALL fgl_winmessage("Form Button","You clicked the form button","info")

		ON ACTION "act_funcFieldButton"
			CALL fgl_winmessage("FunctionField Button","You clicked the form functionField button","info")


		ON ACTION "CANCEL"
				LET int_flag = FALSE
				EXIT INPUT

		ON ACTION "ACCEPT"
				EXIT INPUT
	
	END INPUT
	
END FUNCTION


##################################################################################
# FUNCTION initData()
#
#
##################################################################################
FUNCTION initData()
	LET recData.f1 = "Good Morning" --text field
	LET recData.f2 = 1  --functionField
	LET recData.f3 = 1  --comboList
	LET recData.f4 = "12/12/2017"
	LET recData.f5 = 5
	LET recData.f6 = 1  --CheckBox 
	LET recData.f7 = 1	
	LOCATE recData.f8 IN FILE "image/gd_animal_cheetah.jpg"	
	LET recData.f9 = "START!\nThis is my \n multi line\nString textAreaField\nThis is fun\nWhat else can we do for you?\nEND"
	LET recDATA.f10 = "www.querix.com"
	LET recData.f11 = 2
	LET recData.f12 = 50	
	LET recData.f13 = 0
	LET recData.f14 = 50		
	LET recData.f15 = "{CONTEXT}/public/querix/image/demo/svg/svg_example_01.svg"
	LET recData.f16 = 50
	LET recData.f17 = "13:00"	


	LET recData.f1b = "Good Morning" --text field
	LET recData.f2b = 1  --functionField
	LET recData.f3b = 1  --comboList
	LET recData.f4b = "12/12/2017"
	LET recData.f5b = 5
	LET recData.f6b = 1  --CheckBox 
	LET recData.f7b = 1	
	LOCATE recData.f8b IN FILE "image/gd_animal_cheetah.jpg"	
	LET recData.f9b = "START!\nThis is my \n multi line\nString textAreaField\nThis is fun\nWhat else can we do for you?\nEND"
	LET recDATA.f10b = "www.querix.com"
	LET recData.f11b = 2
	LET recData.f12b = 50	
	LET recData.f13b = 0
	LET recData.f14b = 50		
	LET recData.f15b = "{CONTEXT}/public/querix/image/demo/svg/svg_example_01.svg"
	LET recData.f16b = 50
	LET recData.f17b = "13:00"		
END FUNCTION