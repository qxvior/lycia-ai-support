MAIN
  DEFINE  i INT
  LET i=7
  DISPLAY "START" at 5,5
  MENU
  	ON TIMER i #5 works fine 
  		DISPLAY "7sec passed" at 5,5
  	ON ACTION EXIT
  		EXIT MENU 
  END MENU
END MAIN