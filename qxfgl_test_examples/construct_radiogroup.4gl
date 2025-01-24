MAIN
	DEFINE
		v_const VARCHAR(255),
		exit_fl BOOLEAN

	LET exit_fl = TRUE
	OPEN WINDOW w1 WITH FORM "construct_radiogroup" ATTRIBUTE(BORDER)
	WHILE exit_fl
		CONSTRUCT v_const ON company FROM formonly.company
			ON KEY (ACCEPT)
				ACCEPT CONSTRUCT
			ON ACTION "goto_input"
				LET exit_fl = FALSE
				ACCEPT CONSTRUCT
		END CONSTRUCT
	
		DISPLAY v_const TO tf1
	END WHILE

	INPUT v_const FROM company
END MAIN