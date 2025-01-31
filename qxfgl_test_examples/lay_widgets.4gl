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
		f17 DATETIME HOUR TO SECOND #MINUTE
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
	LET arrFormPath[1] = "form/lay_widgets_rc_left_top_size_0_0_widgets_left_top_noSize"
	LET arrFormPath[2] = "form/lay_widgets_rc_left_top_size_0_0_widgets_left_top_withSize"
	LET arrFormPath[3] = "form/lay_widgets_rc_stretch_stretch_widgets_left_top_noSize"
	LET arrFormPath[4] = "form/lay_widgets_rc_stretch_stretch_widgets_left_top_withSize"
	LET arrFormPath[5] = "form/lay_widgets_rc_stretch_stretch_widgets_stretch"
	LET arrFormPath[6] = "form/lay_widgets_fcls_length_01qch"
	LET arrFormPath[7] = "form/lay_widgets_fcls_length_05qch"
	LET arrFormPath[8] = "form/lay_widgets_fcls_length_10qch"
	LET arrFormPath[9] = "form/lay_widgets_fcls_length_15qch"
	LET arrFormPath[10] = "form/lay_widgets_fcls_length_20qch"
	LET arrFormPath[11] = "form/lay_widgets_fcls_length_25qch"
	LET arrFormPath[12] = "form/lay_widgets_fcls_length_30qch"
	LET arrFormPath[13] = "form/lay_widgets_fcls_length_35qch"
	LET arrFormPath[14] = "form/lay_widgets_fcls_length_40qch"
	LET arrFormPath[15] = "form/lay_widgets_fcls_length_50qch"
	LET arrFormPath[16] = "form/lay_widgets_fcls_length_60qch"
	LET arrFormPath[17] = "form/lay_widgets_horizontal_fcls_length_05qch"	
	LET arrFormPath[18] = "form/lay_widgets_horizontal_fcls_length_10qch"	
		
	LET formFile = arrFormPath[1]	
	LET glDataInitialised = FALSE
	LET mdDialogWindow = FALSE
	
	WHILE TRUE

		CALL fgl_window_open("wLayWidgets", 1, 1, formFile, mdDialogWindow)
		CALL ui.Interface.setText("Layout Widgets")
	
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
				CALL editRecord()
				CALL fgl_dialog_setkeylabel("Display","")

			ON ACTION "Display"
				CALL initData()
				DISPLAY BY NAME recData.*		
				DISPLAY "Hofbräuhaus,Platzl 9,Munich,80331,Bavaria,Germany" TO f19
				LET glDataInitialised = TRUE
				CALL fgl_dialog_setkeylabel("Display","")
				
			ON ACTION "Form"
				OPEN WINDOW wMenuList WITH FORM "form/lay_widgets_choose_form" ATTRIBUTE(BORDER, STYLE="CENTER")
				LET formList = 1	#init to initial/first form in the list

				INPUT BY NAME formList WITHOUT DEFAULTS			
				CLOSE WINDOW wMenuList 			


				IF int_flag = FALSE THEN
					LET formFile = arrFormPath[formList]
					EXIT MENU
					
				ELSE
					LET int_flag = TRUE
				END IF					
				
				
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
	LET recData.f7 = 3	
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
	
END FUNCTION