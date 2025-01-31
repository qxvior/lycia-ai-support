# Project: lyc1000
# Filename: 4688_locale_catalogue_properties_001.4gl
# Created By: alch
# Creation Date: Dec 05, 2019
# Modified By: alch
# Modification Date: Dec 05, 2019

MAIN
	DEFINE l_eid STRING
	DEFINE str STRING
	DEFINE bl6, bt7, cv10, f13, f12, f11, lb14, f15, pb16, f17, f18, f19, f20, f21, f22, br8, f9 STRING
	
	CALL ui.Interface.setType("container")
	CALL ui.Application.GetCurrent().setMenuType("Tree")
	CALL ui.Application.GetCurrent().SetClassNames(["tabbed_container"]) 
	
	WHILE TRUE
		OPEN WINDOW w1 WITH FORM "4688/4688_locale_catalogue_properties_001" --ATTRIBUTE(BORDER)
		DISPLAY "Start" TO f1
		MENU 
			ON ACTION "str001"
				DISPLAY %"str001" TO f1
			ON ACTION "str002"
				LET l_eid = "str002"
				DISPLAY LSTR(l_eid) TO f1--%"string002" TO f1
			ON ACTION "rec001.el001"
				DISPLAY %"rec001.el001" TO f1
			ON ACTION "rec001.el002"
				LET l_eid = "rec001.el002"
				DISPLAY LSTR(l_eid) TO f1
			ON ACTION "non-exist id"
				DISPLAY %"no_id" TO f1
				
			ON ACTION "fgl_settitle()"
			CALL fgl_settitle("fgl_settitle")
			ON ACTION "window.setText()"
			CALL  ui.Window.GetCurrent().setText("window.setText")
			
			
			ON ACTION "prep_string"
				LET str = %"str001"," ", %"rec001.el003"
				DISPLAY str TO f1
			
			ON ACTION "placeholder"
				DISPLAY SFMT("Order #%1 has been %2.", "arg1", "arg2")
			
			ON ACTION "get locale"
				DISPLAY fgl_getenv("QX_UI_LOCALE")
			ON ACTION "set ru_RU"
				CALL set_locale("ru_RU")
				EXIT MENU
			ON ACTION "set en_US"
				CALL set_locale("en_US")
				EXIT MENU
			ON ACTION "set de_DE"
				CALL set_locale("de_DE")
				EXIT MENU
			ON ACTION "set fr_FR"
				CALL set_locale("fr_FR")
				EXIT MENU
			ON ACTION "set en_GB"
				CALL set_locale("en_GB")
				EXIT MENU
			ON ACTION "Input"
				INPUT BY NAME bl6, bt7, cv10, f13, f12, f11, lb14, f15, pb16, f17, f18, f19, f20, f21, f22, br8, f9 WITHOUT DEFAULTS
					AFTER FIELD f9 
						NEXT FIELD bl6
					ON ACTION "labeltest"
						DISPLAY "test" 
					ON ACTION "exit"
						EXIT INPUT
				END INPUT
			ON ACTION "Exit"
				EXIT WHILE
		END MENU
		CLOSE WINDOW w1
	END WHILE
END MAIN

FUNCTION set_locale(string_locale)
	DEFINE string_locale STRING
	
	DISPLAY "old QX_UI_LOCALE: ",fgl_getenv("QX_UI_LOCALE")
	CALL fgl_set_ui_locale(string_locale)
	DISPLAY "new QX_UI_LOCALE: ",fgl_getenv("QX_UI_LOCALE")
END FUNCTION
