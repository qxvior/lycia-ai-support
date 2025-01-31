
MAIN

MENU
# W/o alignments
	ON ACTION "Default FS"
		OPEN WINDOW win_FullScreen WITH FORM "4884/4884_table_gridLength"
		CALL fgl_getkey()
		CLOSE WINDOW win_FullScreen
		
	ON ACTION "Default Dialog"
		OPEN WINDOW win_Dialog WITH FORM "4884/4884_table_gridLength" ATTRIBUTE(BORDER)
		CALL fgl_getkey()
		CLOSE WINDOW win_Dialog

# Alignment of table - Left/Top
	ON ACTION "Let/Top FS"
		OPEN WINDOW win_FullScreen WITH FORM "4884/4884_table_gridLength_left_top"
		CALL fgl_getkey()
		CLOSE WINDOW win_FullScreen
		
	ON ACTION "Left/Top Dialog"
		OPEN WINDOW win_Dialog WITH FORM "4884/4884_table_gridLength_left_top" ATTRIBUTE(BORDER)
		CALL fgl_getkey()
		CLOSE WINDOW win_Dialog

# Alignment of table - Left/Top and size - 800*600
	ON ACTION "Let/Top/Size FS"
		OPEN WINDOW win_FullScreen WITH FORM "4884/4884_table_gridLength_left_top_size"
		CALL fgl_getkey()
		CLOSE WINDOW win_FullScreen
		
	ON ACTION "Left/Top/Size Dialog"
		OPEN WINDOW win_Dialog WITH FORM "4884/4884_table_gridLength_left_top_size" ATTRIBUTE(BORDER)
		CALL fgl_getkey()
		CLOSE WINDOW win_Dialog

# # Alignment of table - Stretch/Stretch
	ON ACTION "Stretch FS"
		OPEN WINDOW win_FullScreen WITH FORM "4884/4884_table_gridLength_stretch"
		CALL fgl_getkey()
		CLOSE WINDOW win_FullScreen
		
	ON ACTION "Stretch Dialog"
		OPEN WINDOW win_Dialog WITH FORM "4884/4884_table_gridLength_stretch" ATTRIBUTE(BORDER)
		CALL fgl_getkey()
		CLOSE WINDOW win_Dialog

# Alignment of table - Stretch/Stretch and size - 800*600
	ON ACTION "Stretch/Size FS"
		OPEN WINDOW win_FullScreen WITH FORM "4884/4884_table_gridLength_stretch_size"
		CALL fgl_getkey()
		CLOSE WINDOW win_FullScreen
		
	ON ACTION "Stretch/Size Dialog"
		OPEN WINDOW win_Dialog WITH FORM "4884/4884_table_gridLength_stretch_size" ATTRIBUTE(BORDER)
		CALL fgl_getkey()
		CLOSE WINDOW win_Dialog


	ON ACTION "Exit"
		EXIT MENU
END MENU
		
END MAIN