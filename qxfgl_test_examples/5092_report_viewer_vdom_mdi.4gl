MAIN
CALL fgl_putenv("QX_MENU_WINDOW=1")
CALL ui.Interface.setType("container")
CALL ui.Interface.setName("window1")
CALL ui.Application.GetCurrent().setMenuType("Tree")

	MENU "m"
		ON ACTION CANCEL
			EXIT MENU
		ON ACTION my_act
	  START REPORT report_simple_01
	    OUTPUT TO REPORT report_simple_01()
	  FINISH REPORT report_simple_01
	END MENU
END MAIN


REPORT report_simple_01()  

  FORMAT 
    FIRST PAGE HEADER
       PRINT "111 asdjgyewgc bdfgsdhjga sd uvdsjsdvvd  sdv jsdv gvgvsdvsdv jsdvsdv jsdjdssdjvasdjgyewgc bdfgsdhjga sd uvdsjsdvvd  sdv jsdv gvgvsdvsdv jsdvsdv jsdjdssdjvasdjgyewgc bdfgsdhjga sd uvdsjsdvvd  sdv jsdv gvgvsdvsdv jsdvsdv jsdjdssdjvasdjgyewgc bdfgsdhjga sd uvdsjsdvvd  sdv jsdv gvgvsdvsdv jsdvsdv jsdjdssdjvasdjgyewgc bdfgsdhjga sd uvdsjsdvvd  sdv jsdv gvgvsdvsdv jsdvsdv jsdjdssdjvasdjgyewgc bdfgsdhjga sd uvdsjsdvvd  sdv jsdv gvgvsdvsdv jsdvsdv jsdjdssdjvasdjgyewgc bdfgsdhjga sd uvdsjsdvvd  sdv jsdv gvgvsdvsdv jsdvsdv jsdjdssdjvasdjgyewgc bdfgsdhjga sd uvdsjsdvvd  sdv jsdv gvgvsdvsdv jsdvsdv jsdjdssdjv"
END REPORT
   