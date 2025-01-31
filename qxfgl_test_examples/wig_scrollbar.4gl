# Created By: allu
# Creation Date: Aug 23, 2013

GLOBALS

	DEFINE testRec 
		OF RECORD
			scrollbar_v1,scrollbar_h1,scrollbar_v2,scrollbar_h2 INT
		END RECORD
{		
	DEFINE testRec2 
		OF RECORD
			tf_h1, tf_h2, tf_v1, tf_v2	 INT
		END RECORD		
	}

END GLOBALS


##################################################################################
# MAIN
#
#
##################################################################################
MAIN

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT

	CALL ui_init()	

	OPEN WINDOW w_fd2_widget_scrollbar_01 WITH FORM "form/wig_scrollbar" 
	CALL ui.Interface.setText("ScrollBar")
	CALL updateDisplay()
	
	
	MENU
		ON ACTION "Enable"
			
			DIALOG ATTRIBUTE(UNBUFFERED)
				INPUT BY NAME testRec.scrollbar_v1 WITHOUT DEFAULTS
					ON CHANGE scrollbar_v1
						DISPLAY testRec.scrollbar_v1 TO tf_v1		
					#ON ACTION ("actUpdateV1") 
					#	DISPLAY testRec.scrollbar_v1 TO tf_v1
					#	CALL updateDisplay()
				END INPUT
		
				INPUT BY NAME testRec.scrollbar_v2 WITHOUT DEFAULTS
					ON CHANGE scrollbar_v2
						DISPLAY testRec.scrollbar_v2 TO tf_v2		
					#ON ACTION ("actUpdateV2")
					#	DISPLAY testRec.scrollbar_v2 TO tf_v2
					#	CALL updateDisplay()
				END INPUT
				 		
				INPUT BY NAME testRec.scrollbar_h1 WITHOUT DEFAULTS 		
					ON CHANGE scrollbar_h1
						DISPLAY testRec.scrollbar_h1 TO tf_h1		
					#ON ACTION ("actUpdateH1") 
					#	DISPLAY testRec.scrollbar_h1 TO tf_h1
					#	CALL updateDisplay()
				END INPUT
				
				INPUT BY NAME testRec.scrollbar_h2 WITHOUT DEFAULTS		
					ON CHANGE scrollbar_h2				
						DISPLAY testRec.scrollbar_h2 TO tf_h2
					#ON ACTION ("actUpdateH2") 
					#	DISPLAY testRec.scrollbar_h2 TO tf_h2
					#	CALL updateDisplay()
				END INPUT
		
				ON ACTION "HELP"
		  		CALL onlineHelp("Scrollbar",NULL)
		  		
				ON ACTION "CANCEL"
					EXIT DIALOG
								
			END DIALOG 			
	
		ON ACTION "CANCEL"
			EXIT MENU
	END MENU
	
	
END MAIN


##################################################################################
# initData()
#
#
##################################################################################
FUNCTION initData()

	--t01_
	LET testRec.scrollbar_h1 = 500
	LET testRec.scrollbar_h2 = 50
	LET testRec.scrollbar_v1 = 20	
	LET testRec.scrollbar_v2 = 20	
END FUNCTION

FUNCTION updateDisplay()
	DISPLAY testRec.scrollbar_v1 TO tf_v1
	DISPLAY testRec.scrollbar_v2 TO tf_v2		
	DISPLAY testRec.scrollbar_h1 TO tf_h1
	DISPLAY testRec.scrollbar_h2 TO tf_h2
END FUNCTION