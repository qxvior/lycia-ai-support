###############################################################################
# MAIN
#
#
###############################################################################
MAIN
	DEFINE progressBarValue,progressBarStepValue SMALLINT
	DEFINE loopCount, loopSize, modResult INT
	
	OPEN WINDOW wProgressBar WITH FORM "form/wig_progressbar_loop"

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT

	CALL ui_init()	
		
	LET progressBarValue = 0
	DISPLAY progressBarValue TO progressBar
	
	#Let's assume, we have to do a job on large set of data.. something like select count returns 154300 rows
	LET loopSize = 154300
	DISPLAY 0 TO progressBar	--Initializse progressBar
	CALL ui.interface.refresh()
	
	MENU
		BEFORE MENU
			CALL dialog.setActionHidden("ACCEPT",TRUE) --hide the OK/accept button
		ON ACTION "EDIT"
			IF loopSize > 0 THEN  --otherwise, there would be NO jobs to do...
				LET progressBarStepValue = loopSize / 100
				
				FOR loopCount = 1 TO loopSize
					LET modResult = loopCount MOD progressBarStepValue
					IF modResult = 0 THEN
						LET progressBarValue = progressBarValue +1
						
						DISPLAY progressBarValue TO progressBar
						DISPLAY BY NAME progressBarValue
						DISPLAY BY NAME loopCount
						CALL ui.interface.refresh()
						
					END IF
				END FOR
			END IF
		
		ON ACTION "HELP"
  		CALL onlineHelp("Progressbar",NULL)
  		
		ON ACTION "CANCEL"
			EXIT MENU
			
	END MENU
	
END MAIN	
				