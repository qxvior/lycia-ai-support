DEFINE br ui.Browser
DEFINE classes DYNAMIC ARRAY OF STRING

MAIN
  OPEN WINDOW w1 WITH FORM '9653/9653_browser_reloading' 
  
  LET br = ui.Browser.forName("br1") 
 
  MENU
    ON ACTION "website"
      CALL br.SetClassNames(["trusted"])
      DISPLAY "https://querix.com" TO br1
    ON ACTION "pdf"    
      CALL br.SetClassNames(["pdf"])	  
	  DISPLAY "qx://application/9653/LyciaIIJavaInterface.pdf" TO br1
    ON ACTION exit_menu
      EXIT MENU
  END MENU  
END MAIN
