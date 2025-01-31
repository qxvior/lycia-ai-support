DEFINE colAttributeArr ARRAY[2,5] OF CHAR(12)

MAIN
	DEFINE i SMALLINT
  DEFINE
    inp_char CHAR

	FOR i = 1 TO 5
		LET colAttributeArr[1,i] = i
		LET colAttributeArr[2,i] = i
	END FOR		
	OPEN WINDOW w WITH FORM "4007/4007_gui_demo_issue"
  CALL set_count(5)
  DISPLAY ARRAY colAttributeArr[1] TO t01_sc11.* ATTRIBUTE (BLACK, CURRENT ROW DISPLAY = "BLUE") WITHOUT SCROLL;
  WHILE TRUE
    PROMPT "" FOR CHAR inp_char
      ON KEY (F621)
		      CALL set_count(5)
		      DISPLAY ARRAY colAttributeArr[1] TO t01_sc11.* ATTRIBUTE (BLACK, CURRENT ROW DISPLAY = "BLUE") WITHOUT SCROLL;
      ON KEY (F622) 
			  CALL set_count(5)
		      DISPLAY ARRAY colAttributeArr[1] TO t02_sc11.* ATTRIBUTE (BLUE, CURRENT ROW DISPLAY = "BLUE") WITHOUT SCROLL;
    END PROMPT
  END WHILE
END MAIN