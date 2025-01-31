
##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	DEFINE fComboBox1,fComboBox2, fComboBox3 SMALLINT

	CALL ui_init()
			
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	OPEN WINDOW myWin WITH FORM "form/wig_comboBox"
	CALL ui.Interface.setText("ComboBox")

	
	LET fComboBox1 = 0
	LET fComboBox2 = 0
	#LET fComboBox1Value = fComboBox1
	#LET fComboBox2Value = fComboBox2
	
	DISPLAY BY NAME fComboBox1, fComboBox2 
	DISPLAY fComboBox1 TO fComboBox1Value
	DISPLAY fComboBox2 TO fComboBox2Value	
	
	MENU
		ON ACTION "Display Choice"
			DISPLAY BY NAME fComboBox1, fComboBox2 
			DISPLAY fComboBox1 TO fComboBox1Value
			DISPLAY fComboBox2 TO fComboBox2Value	
			CALL ui.interface.refresh()
			
		ON ACTION "INPUT"
			INPUT BY NAME fComboBox1, fComboBox2 WITHOUT DEFAULTS ATTRIBUTE(UNBUFFERED)
				ON CHANGE fComboBox1,fComboBox2
					DISPLAY fComboBox1 TO fComboBox1Value
					DISPLAY fComboBox2 TO fComboBox2Value					
					CALL ui.interface.refresh()				
					
						
				AFTER INPUT 
					DISPLAY fComboBox1 TO fComboBox1Value
					DISPLAY fComboBox2 TO fComboBox2Value
					CALL ui.interface.refresh()	
									
			END INPUT

		ON ACTION "Swap Choices"
			LET fComboBox3 = fComboBox1
			LET fComboBox1 = fComboBox2
			LET fComboBox2 = fComboBox3
			
			DISPLAY BY NAME fComboBox1, fComboBox2 
			DISPLAY fComboBox1 TO fComboBox1Value
			DISPLAY fComboBox2 TO fComboBox2Value						

			CALL ui.interface.refresh()
		
	
		ON ACTION "Add 1"
			IF fComboBox1 < 2 THEN
				LET fComboBox1 = fComboBox1 + 1
			ELSE
				LET fComboBox1 = 0
			END IF
			IF fComboBox2 < 2 THEN
				LET fComboBox2 = fComboBox2 + 1
			ELSE
				LET fComboBox2 = 0
			END IF

			DISPLAY BY NAME fComboBox1, fComboBox2 
			DISPLAY fComboBox1 TO fComboBox1Value
			DISPLAY fComboBox2 TO fComboBox2Value				

			CALL ui.interface.refresh()

	    ON ACTION "HELP"
	    	CALL onlineHelp("Combobox",NULL)
	    	
		ON ACTION "CANCEL"
			EXIT MENU							

	END MENU
	
END MAIN	

