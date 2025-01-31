DEFINE modu_lib_hello STRING
FUNCTION lib_hello()
	LET modu_lib_hello = "Hello lib_sta_import_fgl"
	DISPLAY modu_lib_hello
	CALL fgl_winmessage("lib_sta_import.4gl","modu_lib_hello","INFO")
END FUNCTION