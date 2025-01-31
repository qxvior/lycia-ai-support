
##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	DEFINE fComboBox1,fComboBox2, fComboBox3 STRING

	CALL ui_init()
			
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	OPEN WINDOW myWin WITH FORM "form/wig_comboBox_autonext"
	CALL ui.Interface.setText("ComboBox")

	
	LET fComboBox1 = "value_1"
	LET fComboBox2 = "value_2"
	LET fComboBox2 = "value_3"	
	
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
			INPUT BY NAME fComboBox1, fComboBox2, fComboBox3 WITHOUT DEFAULTS ATTRIBUTE(UNBUFFERED)
				ON CHANGE fComboBox1,fComboBox2,fComboBox3
					DISPLAY fComboBox1 TO fComboBox1Value
					DISPLAY fComboBox2 TO fComboBox2Value
					DISPLAY fComboBox3 TO fComboBox3Value	
					CALL ui.interface.refresh()				
					
						
				AFTER INPUT 
					DISPLAY fComboBox1 TO fComboBox1Value
					DISPLAY fComboBox2 TO fComboBox2Value
					DISPLAY fComboBox3 TO fComboBox3Value
					CALL ui.interface.refresh()	
									
			END INPUT


	    ON ACTION "HELP"
	    	CALL onlineHelp("Combobox",NULL)
	    	
		ON ACTION "CANCEL"
			EXIT MENU							

	END MENU
	
END MAIN	

