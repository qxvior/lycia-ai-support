MAIN
  OPEN WINDOW w WITH FORM "yyy" ATTRIBUTE(BORDER)
  CALL ui.Interface.saveScreenshot("screeshot.bmp")
  IF fgl_test("e","screeshot.bmp") THEN
  	DISPLAY "PASS"
  ELSE 
    DISPLAY "FAIL"
  END IF
END MAIN