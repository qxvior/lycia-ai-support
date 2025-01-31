MAIN

DEFINE tfont ui.Font
DEFINE element ui.ToolbarButton 
MENU
	ON ACTION "Get_Font"
		LET element = ui.ToolbarButton.Forname("Get_Font")
		IF element.getFont() is NULL THEN 
			DISPLAY "element.getFont() is NULL"
		ELSE
			DISPLAY "element.getFont()",element.getFont()
		END IF
		let tfont = element.getFont()
		DISPLAY tfont
	ON ACTION "set_font"
		LET tfont.family= ["Vani","Vijaya"]
		LET tfont.bold  =TRUE
		LET tfont.italic = TRUE
		LET tfont.underline = TRUE 
		LET tfont.fontsize = 50
		CALL element.setFont(tfont)
	ON ACTION "null"
		INITIALIZE tfont TO NULL
	ON ACTION "exit"
		EXIT MENU
END MENU
END MAIN