#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores_CS
MAIN
	DEFINE
		l_lyc_7334_6 LIKE lyc_7334_6.col_char

	DEFINE
		l_lyc_7334__6 LIKE lyc_7334_6.COL_CHAR

	DEFINE
		l_lyc_7334___6 LIKE LYC_7334_6.col_char

	DEFINE
		l_lyc_7334____6 LIKE LYC_7334_6.COL_CHAR

	WHENEVER ERROR CONTINUE
	
	LET l_lyc_7334_6 = "a"
	DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE
	DISPLAY "2.  l_lyc_7334_6    = ",l_lyc_7334_6

	LET l_lyc_7334__6 = "b"
	DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE
	DISPLAY "4.  l_lyc_7334__6   = ",l_lyc_7334__6

	LET l_lyc_7334___6 = "c"
	DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE
	DISPLAY "6.  l_lyc_7334___6  = ",l_lyc_7334___6

	LET l_lyc_7334____6 = "d"
	DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE
	DISPLAY "8.  l_lyc_7334____6 = ",l_lyc_7334____6

END MAIN
