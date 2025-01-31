DEFINE cbRec RECORD 
	sf1,sf2,sf3,sf4,sf5,sf6,sf7,sf8 CHAR,
	nf1,nf2,nf3,nf4,nf5,nf6,nf7,nf8 SMALLINT,
	bf1,bf2,bf3,bf4,bf5,bf6,bf7,bf8 SMALLINT	
	END RECORD
	
	
################################################################################
# MAIN
#
#
################################################################################	
MAIN
	CALL ui_init()
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
				
	OPEN WINDOW mywin WITH FORM "form/wig_checkbox_unchecked_is_nullLiteral"
	CALL ui.Interface.setText("C.Box NullLiteral")
	
#	CALL initData()

	DISPLAY cbRec.sf1 TO CheckBoxValueSF1
	DISPLAY cbRec.sf2 TO CheckBoxValueSF2
	DISPLAY cbRec.sf3 TO CheckBoxValueSF3
	DISPLAY cbRec.sf4 TO CheckBoxValueSF4
	DISPLAY cbRec.sf5 TO CheckBoxValueSF5
	DISPLAY cbRec.sf6 TO CheckBoxValueSF6
	DISPLAY cbRec.sf7 TO CheckBoxValueSF7
	DISPLAY cbRec.sf8 TO CheckBoxValueSF8
	DISPLAY cbRec.nf1 TO CheckBoxValueNF1
	DISPLAY cbRec.nf2 TO CheckBoxValueNF2
	DISPLAY cbRec.nf3 TO CheckBoxValueNF3
	DISPLAY cbRec.nf4 TO CheckBoxValueNF4
	DISPLAY cbRec.nf5 TO CheckBoxValueNF5
	DISPLAY cbRec.nf6 TO CheckBoxValueNF6
	DISPLAY cbRec.nf7 TO CheckBoxValueNF7
	DISPLAY cbRec.nf8 TO CheckBoxValueNF8
	DISPLAY cbRec.bf1 TO CheckBoxValueBF1	
	DISPLAY cbRec.bf2 TO CheckBoxValueBF2	
	DISPLAY cbRec.bf3 TO CheckBoxValueBF3	
	DISPLAY cbRec.bf4 TO CheckBoxValueBF4	
	DISPLAY cbRec.bf5 TO CheckBoxValueBF5	
	DISPLAY cbRec.bf6 TO CheckBoxValueBF6	
	DISPLAY cbRec.bf7 TO CheckBoxValueBF7	
	DISPLAY cbRec.bf8 TO CheckBoxValueBF8	
			
	MENU
		ON ACTION "DISPLAY"
			DISPLAY BY NAME cbRec.*

		ON ACTION "EDIT"
			INPUT BY NAME cbRec.* WITHOUT DEFAULTS ATTRIBUTE(UNBUFFERED)
				BEFORE INPUT
					#CALL dialog.setActionHidden("ACCEPT",TRUE)
					#CALL dialog.setActionHidden("CANCEL",TRUE)
					
				ON ACTION "CANCEL"
					EXIT INPUT

				ON ACTION "INIT Null"
					CALL initData_null()
				ON ACTION "INIT Unchecked"
					CALL initData_unchecked()
				ON ACTION "INIT Checked"
					CALL initData_checked()
		
				ON CHANGE sf1
					DISPLAY cbRec.sf1 TO CheckBoxValueSF1			
				ON CHANGE sf2
					DISPLAY cbRec.sf2 TO CheckBoxValueSF2			
				ON CHANGE sf3
					DISPLAY cbRec.sf3 TO CheckBoxValueSF3			
				ON CHANGE sf4
					DISPLAY cbRec.sf4 TO CheckBoxValueSF4			
				ON CHANGE sf5
					DISPLAY cbRec.sf4 TO CheckBoxValueSF5			
				ON CHANGE sf6
					DISPLAY cbRec.sf4 TO CheckBoxValueSF6			
				ON CHANGE sf7
					DISPLAY cbRec.sf4 TO CheckBoxValueSF7			
				ON CHANGE sf8
					DISPLAY cbRec.sf4 TO CheckBoxValueSF8			
				ON CHANGE nf1
					DISPLAY cbRec.nf1 TO CheckBoxValueNF1			
				ON CHANGE nf2
					DISPLAY cbRec.nf2 TO CheckBoxValueNF2			
				ON CHANGE nf3
					DISPLAY cbRec.nf3 TO CheckBoxValueNF3			
				ON CHANGE nf4
					DISPLAY cbRec.nf4 TO CheckBoxValueNF4			
				ON CHANGE nf5
					DISPLAY cbRec.nf5 TO CheckBoxValueNF5			
				ON CHANGE nf6
					DISPLAY cbRec.nf6 TO CheckBoxValueNF6			
				ON CHANGE nf7
					DISPLAY cbRec.nf7 TO CheckBoxValueNF7			
				ON CHANGE nf8
					DISPLAY cbRec.nf8 TO CheckBoxValueNF8			
				ON CHANGE bf1
					DISPLAY cbRec.bf1 TO CheckBoxValueBF1			
				ON CHANGE bf2
					DISPLAY cbRec.bf2 TO CheckBoxValueBF2			
				ON CHANGE bf3
					DISPLAY cbRec.bf3 TO CheckBoxValueBF3			
				ON CHANGE bf4
					DISPLAY cbRec.bf4 TO CheckBoxValueBF4			
				ON CHANGE bf5
					DISPLAY cbRec.bf5 TO CheckBoxValueBF5			
				ON CHANGE bf6
					DISPLAY cbRec.bf6 TO CheckBoxValueBF6			
				ON CHANGE bf7
					DISPLAY cbRec.bf7 TO CheckBoxValueBF7			
				ON CHANGE bf8
					DISPLAY cbRec.bf8 TO CheckBoxValueBF8			
					
	    ON ACTION "HELP"
	    	CALL onlineHelp("Checkbox",NULL)			
			END INPUT
			-------

		#init variables prior AND during input
		ON ACTION "INIT Null"
			CALL initData_null()
		ON ACTION "INIT Unchecked"
			CALL initData_unchecked()
		ON ACTION "INIT Checked"
			CALL initData_checked()
					
		ON ACTION "EXIT"
			EXIT MENU
	END MENU


END MAIN	


################################################################################
# FUNCTION initData()
#
#
################################################################################	
FUNCTION initData_checked()
	LET cbRec.sf1 = "Y"
	LET cbRec.sf2 = "Y"
	LET cbRec.sf3 = "Y"
	LET cbRec.sf4 = "Y"
	LET cbRec.sf5 = "Y"
	LET cbRec.sf6 = "Y"
	LET cbRec.sf7 = "Y"
	LET cbRec.sf8 = "Y"
	LET cbRec.nf1 = 1	
	LET cbRec.nf2 = 1	
	LET cbRec.nf3 = 1	
	LET cbRec.nf4 = 1	
	LET cbRec.nf5 = 1	
	LET cbRec.nf6 = 1	
	LET cbRec.nf7 = 1	
	LET cbRec.nf8 = 1	
	LET cbRec.bf1 = TRUE	
	LET cbRec.bf2 = TRUE	
	LET cbRec.bf3 = TRUE	
	LET cbRec.bf4 = TRUE	
	LET cbRec.bf5 = TRUE	
	LET cbRec.bf6 = TRUE	
	LET cbRec.bf7 = TRUE	
	LET cbRec.bf8 = TRUE	
	DISPLAY BY NAME cbRec.*
END FUNCTION



FUNCTION initData_unchecked()
	LET cbRec.sf1 = "N"
	LET cbRec.sf2 = "N"
	LET cbRec.sf3 = "N"
	LET cbRec.sf4 = "N"
	LET cbRec.sf5 = "N"
	LET cbRec.sf6 = "N"
	LET cbRec.sf7 = "N"
	LET cbRec.sf8 = "N"
	LET cbRec.nf1 = 0	
	LET cbRec.nf2 = 0	
	LET cbRec.nf3 = 0	
	LET cbRec.nf4 = 0	
	LET cbRec.nf5 = 0	
	LET cbRec.nf6 = 0	
	LET cbRec.nf7 = 0	
	LET cbRec.nf8 = 0	
	LET cbRec.bf1 = FALSE	
	LET cbRec.bf2 = FALSE	
	LET cbRec.bf3 = FALSE	
	LET cbRec.bf4 = FALSE	
	LET cbRec.bf5 = FALSE	
	LET cbRec.bf6 = FALSE	
	LET cbRec.bf7 = FALSE	
	LET cbRec.bf8 = FALSE	
	DISPLAY BY NAME cbRec.*
END FUNCTION


FUNCTION initData_null()
	LET cbRec.sf1 = NULL
	LET cbRec.sf2 = NULL
	LET cbRec.sf3 = NULL
	LET cbRec.sf4 = NULL
	LET cbRec.sf5 = NULL
	LET cbRec.sf6 = NULL
	LET cbRec.sf7 = NULL
	LET cbRec.sf8 = NULL
	LET cbRec.nf1 = NULL	
	LET cbRec.nf2 = NULL	
	LET cbRec.nf3 = NULL	
	LET cbRec.nf4 = NULL	
	LET cbRec.nf5 = NULL	
	LET cbRec.nf6 = NULL	
	LET cbRec.nf7 = NULL	
	LET cbRec.nf8 = NULL	
	LET cbRec.bf1 = NULL	
	LET cbRec.bf2 = NULL	
	LET cbRec.bf3 = NULL	
	LET cbRec.bf4 = NULL	
	LET cbRec.bf5 = NULL	
	LET cbRec.bf6 = NULL	
	LET cbRec.bf7 = NULL	
	LET cbRec.bf8 = NULL	
	DISPLAY BY NAME cbRec.*
END FUNCTION
