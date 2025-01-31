


#Module Scope Variables
DEFINE md_arr_recAddress DYNAMIC ARRAY OF
	RECORD
		addr1, addr2,postcode,city STRING
	END RECORD


##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	DEFINE fComboBox1 SMALLINT

	CALL ui_init()
	CALL initData()			
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	OPEN WINDOW myWin WITH FORM "form/wig_comboBox_event_onValueChanged"
	CALL ui.Interface.setText("Combo OnValueChanged")

	
	LET fComboBox1 = 0
	#LET fComboBox1Value = fComboBox1

	
	DISPLAY BY NAME fComboBox1
	DISPLAY fComboBox1 TO fComboBox1Value
	
	MENU
		ON ACTION "Display Choice"
			DISPLAY BY NAME fComboBox1
			DISPLAY fComboBox1 TO fComboBox1Value
			CALL ui.interface.refresh()
			
		ON ACTION "INPUT"
			INPUT BY NAME fComboBox1 WITHOUT DEFAULTS ATTRIBUTE(UNBUFFERED)
				ON CHANGE "fComboBox1"
					DISPLAY fComboBox1 TO fComboBox1Value
					DISPLAY BY NAME md_arr_recAddress[fComboBox1].* 					
					CALL ui.interface.refresh()				
					
				ON ACTION "addrressPreview"
					DISPLAY BY NAME md_arr_recAddress[fComboBox1].* 
								
						
				AFTER INPUT 
					DISPLAY fComboBox1 TO fComboBox1Value
					CALL ui.interface.refresh()	
									
			END INPUT

    ON ACTION "HELP"
    	CALL onlineHelp("Combobox",NULL)
	    	
		ON ACTION "CANCEL"
			EXIT MENU							

	END MENU
	
END MAIN	



FUNCTION initData()
	DEFINE i INT
	
	LET i = 1
	LET md_arr_recAddress[i].addr1 = "Green House"
	LET md_arr_recAddress[i].addr2 = "Queens Drive 12"
	LET md_arr_recAddress[i].postcode = "Q43 PO3"
	LET md_arr_recAddress[i].city = "Southampton"
	
	LET i = i+1
	LET md_arr_recAddress[i].addr1 = "Red House"
	LET md_arr_recAddress[i].addr2 = "Kings Lane 54"
	LET md_arr_recAddress[i].postcode = "X33 UI3"
	LET md_arr_recAddress[i].city = "London"

	
	LET i = i+1
	LET md_arr_recAddress[i].addr1 = "Blue House"
	LET md_arr_recAddress[i].addr2 = "Price Drive 1"
	LET md_arr_recAddress[i].postcode = "PD2 O11"
	LET md_arr_recAddress[i].city = "Manchester"





END FUNCTION