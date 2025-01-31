IMPORT JAVA java.lang.Object
IMPORT JAVA java.lang.String

GLOBALS
	DEFINE s java.lang.String
	DEFINE i INT
END GLOBALS

FUNCTION modify_s_and_i()
	LET s = java.lang.String.create("in function")
	LET i = 13
END FUNCTION