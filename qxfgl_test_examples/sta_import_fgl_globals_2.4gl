GLOBALS
	define glob_2 STRING
END GLOBALS

FUNCTION glob_2()
	LET glob_2 = "sta_import_fgl_globals.4gl"
	CALL fgl_winmessage("sta_import_fgl_globals_2.4gl\nHello","sta_import_fgl_globals_2.4gl\nHello","info")
	RETURN glob_2
END FUNCTION