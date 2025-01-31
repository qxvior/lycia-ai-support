# Project: lyc1000
# Filename: 7181_current_window_issue_parent.4gl
# Created By: alch
# Creation Date: Nov 18, 2021

MAIN
DEFINE form1_open INT
DEFINE form2_open INT
DEFINE form3_open INT
CALL fgl_putenv("QX_COMPAT=Informix4GL")
MENU
	COMMAND "RUN"
		RUN "7181_current_window_issue_child"
	COMMAND "form1"
		IF form1_open = TRUE THEN
			CURRENT WINDOW IS form1_page
		ELSE
			OPEN WINDOW form1_page AT 1,1 WITH 14 ROWS, 78 COLUMNS
			OPEN FORM form1_form FROM "7181/7181_form1"
			DISPLAY FORM form1_form
			DISPLAY "1" AT 1,1
			LET form1_open = TRUE
		END IF
	COMMAND "form2"
		IF form2_open = TRUE THEN
			CURRENT WINDOW IS form2_page
		ELSE
			OPEN WINDOW form2_page AT 1,1 WITH 14 ROWS, 78 COLUMNS
			OPEN FORM form2_form FROM "7181/7181_form2"
			DISPLAY FORM form2_form
			DISPLAY "2" AT 1,1
			LET form2_open = TRUE
		END IF
	COMMAND "form3"
		IF form3_open = TRUE THEN
			CURRENT WINDOW IS form3_page
		ELSE
			OPEN WINDOW form3_page AT 1,1 WITH 14 ROWS, 78 COLUMNS
			OPEN FORM form3_form FROM "7181/7181_form3"
			DISPLAY FORM form3_form
			DISPLAY "3" AT 1,1
			LET form3_open = TRUE
		END IF
	COMMAND "close"
		EXIT MENU
END MENU
END MAIN