##################################################################################
# Module Scope Variables
#
#
##################################################################################	
DEFINE arrRecTable DYNAMIC ARRAY OF RECORD
		f1 STRING
	END RECORD


DEFINE rec RECORD
		tf1,tf2,tf3,tf4,tf5,tf6 STRING
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

 # CALL fgl_settitle("Layout GridPanel + Table")
	CALL ui.Interface.setText("Layout Gp+Tb")
			
	CALL initData()
	
	MENU
		ON ACTION "Full Screen"
			OPEN WINDOW wLayoutTest WITH FORM "form/lay_gridPanel-table_01"

			CALL demoInput()
			
			CLOSE WINDOW wLayoutTest
						
		ON ACTION "Dialog Window"
			OPEN WINDOW wLayoutTest WITH FORM "form/lay_gridPanel-table_01" ATTRIBUTE(BORDER, STYLE="CENTER")

			CALL demoInput()

			CLOSE WINDOW wLayoutTest
			
		ON ACTION "Exit"
			EXIT MENU
			
	END MENU

END MAIN


##################################################################################
# FUNCTION demoInput()
#
#
##################################################################################	
FUNCTION demoInput()
			DIALOG
			
				DISPLAY ARRAY arrRecTable TO myTable.*	
				END DISPLAY

				INPUT BY NAME rec.* WITHOUT DEFAULTS
				END INPUT

				ON ACTION "Exit"
					EXIT DIALOG
					
			END DIALOG
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

	LET rec.tf1 = "Hubert"
	LET rec.tf2 = "Victor"
	LET rec.tf3 = "Alexey"
	LET rec.tf4 = "Raoul"
	LET rec.tf5 = "Joseph"
	LET rec.tf6 = "Vitaliy"

END FUNCTION		
		