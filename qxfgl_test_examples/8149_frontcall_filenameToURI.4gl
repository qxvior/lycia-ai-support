MAIN
    DEFINE uri STRING
    DISPLAY "Existent files:"
    DISPLAY ui.Interface.filenameToURI("ttt.webp") --existent
	DISPLAY ""
	DISPLAY "Missed files:"
    DISPLAY ui.Interface.filenameToURI("missed.png") --missed
	DISPLAY ""
	DISPLAY "Pass string as is files:"
    DISPLAY ui.Interface.filenameToURI("http://asis.txt") 
    DISPLAY ui.Interface.filenameToURI("https://asis.txt")
	DISPLAY ui.Interface.filenameToURI("file://asis.webp")
	DISPLAY ui.Interface.filenameToURI("qx://application/asis.web")
	DISPLAY ui.Interface.filenameToURI("qx://embedded/asis.ttt")

END MAIN