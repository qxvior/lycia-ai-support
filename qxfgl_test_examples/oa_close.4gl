##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	DEFINE f1,f2,f3 STRING
	DEFINE lbInfoNow STRING

	CALL ui_init()
		
	DEFER INTERRUPT
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	OPEN WINDOW myWin WITH FORM "form/oa_close"
	
	LET lbInfoNow = "MENU Action block"
	MENU
		BEFORE MENU
			CALL fgl_dialog_setKeyLabel("CLOSE","Close Window","{CONTEXT}/public/querix/icon/png/32/close_window.png",1,0,"Close the window")
			CALL fgl_dialog_setKeyLabel("Next","Next (Exit Menu)","{CONTEXT}/public/querix/icon/png/32/button_circle_blue_right.png",1,0,"Next Step")

			DISPLAY BY NAME lbInfoNow
			DISPLAY BY NAME int_flag
			DISPLAY BY NAME quit_flag			

		#ON ACTION "test"
		#	call fgl_winmessage("test","test","info")

		ON ACTION "Next"
			EXIT MENU
	END MENU
	

	LET lbInfoNow = "INPUT 1"	
	INPUT BY NAME f1,f2,f3
		BEFORE INPUT
			CALL fgl_dialog_setKeyLabel("CLOSE","Close Window","{CONTEXT}/public/querix/icon/png/32/close_window.png",1,0,"Close the window")
			DISPLAY BY NAME int_flag
			DISPLAY BY NAME quit_flag					
			DISPLAY BY NAME lbInfoNow			
		ON ACTION "CLOSE"
			CALL fgl_winmessage("User choice: CLOSE","User selected CLOSE","info")
			#LET int_flag = TRUE  --has to be done manualy by a close event handler
			DISPLAY BY NAME int_flag
			DISPLAY BY NAME quit_flag					
			EXIT INPUT

		ON ACTION "Reset Flags"
			CALL resetFlags()
					
		AFTER INPUT
			CALL fgl_winmessage("After input","After input","info")
			DISPLAY BY NAME int_flag
			DISPLAY BY NAME quit_flag					
			
	END INPUT

			DISPLAY BY NAME int_flag
			DISPLAY BY NAME quit_flag		
			
	IF int_flag = TRUE THEN
		LET int_flag = FALSE
		OPEN WINDOW myWin WITH FORM "form/oa_close"
			DISPLAY BY NAME int_flag
			DISPLAY BY NAME quit_flag				
	ELSE
		--Program was already closed
	END IF

	LET lbInfoNow = "INPUT 2"	
		

	INPUT BY NAME f1,f2,f3
		BEFORE INPUT
			CALL fgl_dialog_setKeyLabel("CLOSE","Close Window","{CONTEXT}/public/querix/icon/png/32/close_window.png",1,0,"Close the window")
			DISPLAY BY NAME lbInfoNow		
			DISPLAY BY NAME int_flag
			DISPLAY BY NAME quit_flag								

		ON ACTION "Reset Flags"
			CALL resetFlags()
					

	END INPUT
		
	DISPLAY BY NAME int_flag
	DISPLAY BY NAME quit_flag
	
	CALL fgl_winmessage("Nearly End of Demo","Nearly End of Demo","Info")	

	LET lbInfoNow = "INPUT 3"	
	
	INPUT BY NAME f1,f2,f3
		BEFORE INPUT
			CALL fgl_dialog_setKeyLabel("CLOSE","Close Window","{CONTEXT}/public/querix/icon/png/32/close_window.png",1,0,"Close the window")
			DISPLAY BY NAME lbInfoNow		
			DISPLAY BY NAME int_flag
			DISPLAY BY NAME quit_flag								

		ON ACTION "Reset Flags"
			CALL resetFlags()
					

	END INPUT				


	OPEN WINDOW myWinBorder WITH FORM "form/oa_close" ATTRIBUTE(BORDER)
	LET lbInfoNow = "INPUT 4 - Dialog Window - try the X Close button in the titlebar"	
	
	INPUT BY NAME f1,f2,f3
		BEFORE INPUT
			CALL fgl_dialog_setKeyLabel("CLOSE","Close Window","{CONTEXT}/public/querix/icon/png/32/close_window.png",1,0,"Close the window")
			DISPLAY BY NAME lbInfoNow		
			DISPLAY BY NAME int_flag
			DISPLAY BY NAME quit_flag								

		ON ACTION "Reset Flags"
			CALL resetFlags()
					

	END INPUT			


	#OPEN WINDOW myWinBorder WITH FORM "form/oa_close" ATTRIBUTE(BORDER)
	LET lbInfoNow = "INPUT 5 - Dialog Window - try the X Close button in the titlebar"	
	
	INPUT BY NAME f1,f2,f3
		BEFORE INPUT
			CALL fgl_dialog_setKeyLabel("CLOSE","Close Window","{CONTEXT}/public/querix/icon/png/32/close_window.png",1,0,"Close the window")
			DISPLAY BY NAME lbInfoNow		
			DISPLAY BY NAME int_flag
			DISPLAY BY NAME quit_flag			

		ON ACTION "CLOSE"
			CALL fgl_winmessage("User choice: CLOSE","User selected CLOSE","info")
			#LET int_flag = TRUE  --has to be done manualy by a close event handler
			DISPLAY BY NAME int_flag
			DISPLAY BY NAME quit_flag					
			EXIT INPUT

		ON ACTION "Reset Flags"
			CALL resetFlags()
					
											
	END INPUT		
	
	CALL fgl_winmessage("End of Demo","End of Demo","Info")	
END MAIN	


##################################################################################
# FUNCTION resetFlags()
#
#
##################################################################################
FUNCTION resetFlags()
	LET int_flag = FALSE
	LET quit_flag = FALSE
	DISPLAY BY NAME int_flag
	DISPLAY BY NAME quit_flag					
	CALL ui.interface.refresh()
END FUNCTION
	
	