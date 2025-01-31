
##################################################################################
# Module scope variables
##################################################################################
DEFINE arrRecTable DYNAMIC ARRAY OF RECORD
		f1 STRING
	END RECORD


DEFINE rec RECORD
		tf1,tf2,tf3,tf4,tf5,tf6 STRING
	END RECORD

DEFINE rec1 RECORD
		tf11,tf12,tf13,tf14,tf15,tf16 STRING
	END RECORD

DEFINE rec2 RECORD
		tf21,tf22,tf23,tf24,tf25,tf26 STRING
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

	CALL ui.Interface.setText("Layout Gp+Tb+2Gb")
			
	CALL initData()
	
	MENU
		ON ACTION "Full Screen"
			OPEN WINDOW wLayoutTest WITH FORM "form/lay_gridPanel_table_groupBox_01"

			CALL demoInput()
			
			CLOSE WINDOW wLayoutTest
						
		ON ACTION "Dialog Window"
			OPEN WINDOW wLayoutTest WITH FORM "form/lay_gridPanel_table_groupBox_01" ATTRIBUTE(BORDER, STYLE="CENTER")

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
				
				INPUT BY NAME rec1.* WITHOUT DEFAULTS
				END INPUT
				
				INPUT BY NAME rec2.* WITHOUT DEFAULTS
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

	LET rec1.tf11 = "Hubert"
	LET rec1.tf12 = "Victor"
	LET rec1.tf13 = "Alexey"
	LET rec1.tf14 = "Raoul"
	LET rec1.tf15 = "Joseph"
	LET rec1.tf16 = "Vitaliy"
	
	LET rec2.tf21 = "Hubert"
	LET rec2.tf22 = "Victor"
	LET rec2.tf23 = "Alexey"
	LET rec2.tf24 = "Raoul"
	LET rec2.tf25 = "Joseph"
	LET rec2.tf26 = "Vitaliy"	
	
END FUNCTION		
		