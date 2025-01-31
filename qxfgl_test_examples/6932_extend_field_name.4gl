# Project: lyc1000
# Filename: 6932_extend_field_name.4gl
# Created By: alch
# Creation Date: Oct 5, 2021

MAIN
DEFINE l_screen RECORD 
	id INTEGER,
	extend STRING
END RECORD
OPEN WINDOW w WITH FORM "6932/6932_extend_field_name" ATTRIBUTE(BORDER)
INPUT BY NAME l_screen.*
	AFTER FIELD id
		NEXT FIELD extend
	ON ACTION "buff"
		DISPLAY GET_FLDBUF(extend)
END INPUT

END MAIN