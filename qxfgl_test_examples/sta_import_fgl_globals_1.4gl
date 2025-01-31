GLOBALS
	define glob_1 STRING
END GLOBALS

FUNCTION glob_1()
	LET glob_1 = "sta_import_fgl_globals.4gl"
	CALL fgl_winmessage("sta_import_fgl_globals_1.4gl\nHello","sta_import_fgl_globals_1.4gl\nHello","info")
	RETURN glob_1
END FUNCTION