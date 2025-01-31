##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	DEFINE fTextArea1, fTextArea2, fTextArea3 STRING

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT

	CALL ui_init()	

	OPEN WINDOW myWin WITH FORM "form/wig_textArea"
	CALL ui.Interface.setText("TextArea 1")
	
	LET fTextArea1 = "01-This is my first example text\nLet's have a look at it!-01"
	LET fTextArea2 = "02-This is my second example text\nLet's have a look at it!-02"

	MENU
		ON ACTION "DISPLAY"
			DISPLAY BY NAME fTextArea1, fTextArea2

		ON ACTION "INPUT"
			INPUT BY NAME fTextArea1, fTextArea2 WITHOUT DEFAULTS
			END INPUT

		ON ACTION "Swap Values"
			LET fTextArea3 = fTextArea1
			LET fTextArea1 = fTextArea2
			LET fTextArea2 = fTextArea3
			DISPLAY BY NAME fTextArea1, fTextArea2			

		ON ACTION "Increment"
			LET fTextArea1 = fTextArea1 CLIPPED, "\nAnd another line of text was appended to this text"
			LET fTextArea2 = fTextArea2 CLIPPED, "\nAnd another line of text was appended to this text"
			
			DISPLAY BY NAME fTextArea1, fTextArea2			

		ON ACTION "HELP"
  		CALL onlineHelp("Textarea",NULL)
  		
		ON ACTION "CANCEL"
			EXIT MENU							

	END MENU

END MAIN	