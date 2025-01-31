################################################################################
# Module Scope Variables
################################################################################
define myRec RECORD
		f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12 STRING,
		f13 INTEGER, 
		f14 DATE, 
		f15 Datetime Hour to Second
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

	DEFER INTERRUPT

	OPEN WINDOW mywin with form "form/css_redirection_error_message"
	CALL ui.Interface.setText("ERROR/MESSAGE")	


	INPUT BY NAME myRec.* without defaults
		BEFORE INPUT
			CALL dialog.setActionHidden("ACCEPT",TRUE)
			#CALL dialog.setActionHidden("CANCEL",TRUE)

		ON ACTION "MESSAGE"
			MESSAGE "Sample MESSAGE"
		ON ACTION "ERROR"
			ERROR "Sample ERROR"
						
		AFTER FIELD "f1"
			ERROR "AFTER FIELD ERROR f1"
		AFTER FIELD f2
			ERROR "AFTER FIELD ERROR f2"
		BEFORE FIELD "f4"
			ERROR "BEFORE FIELD ERROR f4"
		BEFORE FIELD f5
			ERROR "BEFORE FIELD ERROR f5"
		AFTER FIELD "f7"
			MESSAGE "AFTER FIELD MESSAGE f7"
		AFTER FIELD f8
			MESSAGE "AFTER FIELD MESSAGE f8"
		BEFORE FIELD "f10"
			MESSAGE "BEFORE FIELD MESSAGE f10"
		BEFORE FIELD f11
			MESSAGE "BEFORE FIELD MESSAGE f11"

		ON ACTION "CANCEL"
			Exit INPUT

	END INPUT
	
END MAIN			