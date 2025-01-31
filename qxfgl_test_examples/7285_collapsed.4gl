MAIN
DEFINE f1,f2,f3 char(5)
DEFINE i INT
	LET i=2
	OPEN WINDOW w WITH FORM "7285/7285_collapsed" ATTRIBUTE(BORDER)
	CALL ui.AbstractUiElement.ForName("f2").SetCollapsed(TRUE)
	CALL ui.AbstractUiElement.ForName("f3").SetCollapsed(TRUE)

	INPUT BY NAME f1,f2,f3 
		ON ACTION "accept"
			IF i mod 2 =0  THEN
				CALL ui.AbstractUiElement.ForName("f2").SetCollapsed(FALSE)
				CALL ui.AbstractUiElement.ForName("f3").SetCollapsed(FALSE)
			ELSE
				CALL ui.AbstractUiElement.ForName("f2").SetCollapsed(TRUE)
				CALL ui.AbstractUiElement.ForName("f3").SetCollapsed(TRUE)
			END IF
			LET i = i+1
	END INPUT
END MAIN