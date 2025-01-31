##################################################################################
# Module Scope Variables
#
#
##################################################################################
DEFINE arrRecTable DYNAMIC ARRAY OF RECORD
		f1 STRING
	END RECORD


##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	DEFER INTERRUPT

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit

	CALL ui_init()
	
	CALL initData()


	CALL ui.Interface.setText("Layout Tb")
	
	MENU
		ON ACTION "Full Screen"
			OPEN WINDOW wLayoutTest WITH FORM "form/lay_table_01"
			DISPLAY ARRAY arrRecTable TO myTable.*	
			END DISPLAY

			CLOSE WINDOW wLayoutTest
						
		ON ACTION "Dialog Window"
			OPEN WINDOW wLayoutTest WITH FORM "form/lay_table_01" ATTRIBUTE(BORDER, STYLE="CENTER")
			DISPLAY ARRAY arrRecTable TO myTable.*			
			END DISPLAY

			CLOSE WINDOW wLayoutTest
			
		ON ACTION "Exit"
			EXIT MENU
			
	END MENU

END MAIN


##################################################################################
# FUNCTION openWindowFullScreen()	
#
#
##################################################################################
FUNCTION openWindowFullScreen()		

	OPEN WINDOW wLayoutTest WITH FORM "form/lay_table_01"

END FUNCTION


##################################################################################
# FUNCTION initData()
#
#
##################################################################################
FUNCTION initData()
	DEFINE i SMALLINT
	DEFINE strNum STRING
	
	FOR i = 1 TO 200
		LET strNum = i USING "&&&&"
		LET arrRecTable[i].f1 = trim(strNum), " - Test Data Test abcdefghijklmnopqrstuvwxyz Special: üÜäÄöÖß€"
	END FOR
END FUNCTION	
		