# Project: table
# Filename: table_38_sorted_asc.4gl
# Created By: egza
# Creation Date: Jun 13, 2016

DEFINE tab1 ARRAY[7] OF RECORD
							f1 INT,
							f2 INT
						END RECORD
DEFINE d ui.Dialog

DEFINE i INT

MAIN

	OPEN WINDOW w1 WITH FORM "table_38_sorted_asc" ATTRIBUTE (BORDER)

	LET tab1[1].f1 = 6
	LET tab1[1].f2 = 3

	LET tab1[2].f1 = 5
	LET tab1[2].f2 = 7

	LET tab1[3].f1 = 7
	LET tab1[3].f2 = 2

	LET tab1[4].f1 = 4
	LET tab1[4].f2 = 1

	LET tab1[5].f1 = 5
	LET tab1[5].f2 = 4
	
	LET tab1[6].f1 = 1
	LET tab1[6].f2 = 6
	
	LET tab1[7].f1 = 3
	LET tab1[7].f2 = 5

	CALL SET_COUNT(7)
	INPUT ARRAY tab1 from tab1.* ATTRIBUTES (WITHOUT DEFAULTS)

END MAIN