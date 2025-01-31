IMPORT util
MAIN
	DISPLAY "1:",util.Date.parse("311222", "DD/MM/YYYY")
	DISPLAY "2:",util.Date.parse("31/12/22", "DD/MM/YYYY")
	DISPLAY "3:",util.Date.parse("31-12-22", "DD/MM/YYYY")
	DISPLAY "4:",util.Date.parse("2022-12-31", "DD/MM/YYYY")
	DISPLAY "5:",util.Date.parse("311222", "DDMMYY")
	DISPLAY "6:",util.Date.parse("311222", "ddmmyy")
	DISPLAY "7:",util.Date.parse("311222", "dd/mm/yyyy")
	DISPLAY "8:",util.Date.parse("311222", "dd/MM/yyyy")
	DISPLAY "9:",util.Date.parse("311222", "dd/MM/yYYy")
END MAIN
