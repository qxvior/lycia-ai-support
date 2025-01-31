IMPORT FGL java_lib_5563

IMPORT JAVA java.lang.Object
IMPORT JAVA java.lang.String

GLOBALS
	DEFINE s java.lang.String
	DEFINE i INT
END GLOBALS

MAIN
	LET s = java.lang.String.create("in main")
	LET i = 5
	DISPLAY s
	DISPLAY i
	CALL modify_s_and_i()
	DISPLAY s
	DISPLAY i
END MAIN