################################################################################
# Module Scope Variables
################################################################################

################################################################################
# MAIN
#
#
################################################################################ 
MAIN
	DEFINE l_err_msg STRING	
	DEFINE l_num_cust SMALLINT
	DEFINE l_error BOOLEAN
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT
	
	CALL ui_init()
	CALL hideNavigation()
	
	OPEN WINDOW mywin WITH FORM "form/sta_try_catch"
	CALL ui.Interface.setText("TryCatch")

	MENU
		BEFORE MENU
			CALL dialog.setActionHidden("CANCEL",TRUE)
		ON ACTION "ACCEPT"
			EXIT MENU
	END MENU
	
	LET l_err_msg = "caught during SQL statement execution:", sqlca.sqlcode

	TRY
		SELECT COUNT(*) INTO l_num_cust FROM customers WHERE ord_date <= max_date 
	CATCH
		CALL fgl_winmessage("ERROR",l_err_msg,"error")
		LET l_error = TRUE
	END TRY

	IF l_error THEN
		CALL fgl_winmessage("No DB - NO Work","Try & Catch can be used in many cases to replace your GOTO Label statemetns.\nWorking without DB makes no fun!\nExit Program","INFO")
		EXIT PROGRAM
	ELSE
		SELECT COUNT(*) INTO l_num_cust FROM customers WHERE ord_date <= max_date
		DISPLAY l_num_cust 			
	END IF

END MAIN
################################################################################
# END MAIN
################################################################################