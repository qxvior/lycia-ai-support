define myRec RECORD 
		fListBox INT,
		fCombo INT,
		fRadioButtonListV INT,
		fRadioButtonListH INT
--		,fRadioButtonSingle INT
	END RECORD
	DEFINE fReport STRING	
	
	
MAIN
	OPTIONS FIELD ORDER UNCONSTRAINED
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	OPTIONS INPUT WRAP
	
	CALL ui.Interface.setText("List Widgets")
	CALL ui_init()	
	CALL initData()

	OPEN WINDOW mywin WITH FORM "form/wig_all-list-data-widgets" 
	

	CALL displayVarValues()
	DISPLAY BY NAME myRec.*	

	
	
	MENU
		ON ACTION "Edit"
		
			DIALOG ATTRIBUTE(UNBUFFERED)
			
			INPUT BY NAME myRec.* WITHOUT DEFAULTS
				ON CHANGE fCombo
					LET fReport = fReport, "\n", "myrec.fCombo=", myrec.fCombo
					DISPLAY fReport TO fReport
				ON CHANGE fListBox
					LET fReport = fReport, "\n",  "myrec.fListBox=", myrec.fListBox
					DISPLAY fReport TO fReport
				ON CHANGE fRadioButtonListV
					LET fReport = fReport, "\n",  "myrec.fRadioButtonListV=", myrec.fRadioButtonListV
					DISPLAY fReport TO fReport
				ON CHANGE fRadioButtonListH
					LET fReport = fReport, "\n",  "myrec.fRadioButtonListH=", myrec.fRadioButtonListH
					DISPLAY fReport TO fReport
--				ON CHANGE fRadioButtonSingle
--					LET fReport = fReport, "\n",  "myrec.fRadioButtonSingle=", myrec.fRadioButtonSingle
--					DISPLAY fReport 	 TO fReport			
				
			END INPUT
			
			INPUT BY NAME fReport WITHOUT DEFAULTS
			END INPUT

			ON ACTION "Display Values"
				CALL displayVarValues()	
			
			ON ACTION "CANCEL" --"Exit Input"
				EXIT DIALOG
					
			END DIALOG


		ON ACTION "Display Values"
			CALL displayVarValues()		
		
		ON ACTION "Exit"
			EXIT MENU
	END MENU		
				
	
END MAIN

FUNCTION initData()
LET myrec.fCombo = 2
LET myrec.fListBox = 2
LET myrec.fRadioButtonListV = 2
LET myrec.fRadioButtonListH = 2
--LET myrec.fRadioButtonSingle = 2

	
END FUNCTION


FUNCTION displayVarValues()

	LET fReport = fReport, "\n", "myrec.fCombo=", myrec.fCombo
	DISPLAY fReport TO fReport
	LET fReport = fReport, "\n",  "myrec.fListBox=", myrec.fListBox
	DISPLAY fReport TO fReport
	LET fReport = fReport, "\n",  "myrec.fRadioButtonListV=", myrec.fRadioButtonListV
	DISPLAY fReport TO fReport
	LET fReport = fReport, "\n",  "myrec.fRadioButtonListH=", myrec.fRadioButtonListH
	DISPLAY fReport TO fReport
	--LET fReport = fReport, "\n",  "myrec.fRadioButtonSingle=", myrec.fRadioButtonSingle
	--DISPLAY BY NAME fReport			

END FUNCTION

