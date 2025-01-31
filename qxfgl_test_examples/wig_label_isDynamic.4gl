DEFINE arr_labelStr ARRAY[3,2] OF STRING
DEFINE arr_labelChoice ARRAY[3] OF SMALLINT

MAIN
	CALL ui_init()
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT

	OPEN WINDOW wLabel WITH FORM "form/wig_label_isDynamic"
	CALL ui.Interface.setText("Label isDynamic")
		
	CALL init_data()

	MENU
		ON ACTION "actDispLb1"	
			DISPLAY arr_labelStr[1,toggle_Choice(1)] TO lb1
		ON ACTION "actDispGreenLb1"
			DISPLAY arr_labelStr[1,toggle_Choice(1)] TO lb1 ATTRIBUTE(GREEN)
		ON ACTION "actDispRedLb1"
			DISPLAY arr_labelStr[1,toggle_Choice(1)] TO lb1 ATTRIBUTE(RED)

		ON ACTION "actDispLb2"	
			DISPLAY arr_labelStr[2,toggle_Choice(2)] TO lb2
			MESSAGE "Label Lb2 with isDynamic=false can not be changed"
		ON ACTION "actDispGreenLb2"
			DISPLAY arr_labelStr[2,toggle_Choice(2)] TO lb2 ATTRIBUTE(GREEN)
			MESSAGE "Label Lb2 with isDynamic=false can not be changed"
		ON ACTION "actDispRedLb2"
			DISPLAY arr_labelStr[2,toggle_Choice(2)] TO lb2 ATTRIBUTE(RED)
			MESSAGE "Label Lb2 with isDynamic=false can not be changed"

		ON ACTION "actDispLb3"	
			DISPLAY arr_labelStr[3,toggle_Choice(3)] TO lb3
		ON ACTION "actDispGreenLb3"
			DISPLAY arr_labelStr[3,toggle_Choice(3)] TO lb3 ATTRIBUTE(GREEN)
		ON ACTION "actDispRedLb3"
			DISPLAY arr_labelStr[3,toggle_Choice(3)] TO lb3 ATTRIBUTE(RED)

		ON ACTION "CLEAR FORM"
			CLEAR FORM

		ON ACTION "CANCEL"
			EXIT MENU			

    ON ACTION "HELP"
    	CALL onlineHelp("Label",NULL)
	    				 	
	END MENU


END MAIN


FUNCTION init_data()
	LET arr_labelStr[1,1] = "Label Lb1 with isDynamic=true"
	LET arr_labelStr[1,2] = "This is also Label Lb1 with isDynamic=true"
	LET arr_labelStr[2,1] = "Label Lb2 with isDynamic=false"
	LET arr_labelStr[2,2] = "This is also Label Lb2 with isDynamic=false"
	LET arr_labelStr[3,1] = "www.querix.com"
	LET arr_labelStr[3,2] = "https://querix.com/go/lycia/index.htm"
	
	LET arr_labelChoice[1] = 1
	LET arr_labelChoice[2] = 1
	LET arr_labelChoice[3] = 1
	
END FUNCTION

FUNCTION toggle_Choice(i)
	DEFINE i SMALLINT
	
	IF arr_labelChoice[i] = 1 THEN
		LET arr_labelChoice[i] = 2
	ELSE
		LET arr_labelChoice[i] = 1
	END IF	

	RETURN arr_labelChoice[i]
END FUNCTION	