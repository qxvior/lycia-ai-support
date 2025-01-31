MAIN
	MENU
		BEFORE MENU
			  CALL fgl_setproperty('gui', 'window.winshellexec.verb', 'print') #makes winshellexec print immediately 
		ON ACTION "print_xls"
			CALL print_doc("C:/ProgramData/Querix/Lycia/progs/gd_document1.xls")
		ON ACTION "print_doc"
			CALL print_doc("C:/ProgramData/Querix/Lycia/progs/gd_document1.doc")
		ON ACTION "print_pdf"
			CALL print_doc("C:/ProgramData/Querix/Lycia/progs/gd_document1.pdf")
		ON ACTION "print_html"
			CALL print_doc("C:/ProgramData/Querix/Lycia/progs/gd_html4.html")
		ON ACTION "exit"
			EXIT MENU
	END MENU
END MAIN

FUNCTION print_doc(p_document)
	DEFINE p_document STRING
	  CALL winshellexec(p_document) 
END FUNCTION