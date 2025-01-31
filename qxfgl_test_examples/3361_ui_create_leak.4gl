DEFINE i,j INT
DEFINE tf ui.Textfield
MAIN
CALL fgl_getkey()
	FOR j=1 TO 20000
		LET tf = ui.textfield.create("f"||j)
	END FOR
CALL fgl_getkey()
END MAIN