MAIN
 DEFINE username, password VARCHAR(250)
	OPEN WINDOW login_w WITH FORM "8641/8641_browser_autofill" ATTRIBUTES (BORDER)
	INPUT BY NAME username, password
	END INPUT
	DISPLAY username,"|",password
	CALL fgl_getkey()
END MAIN