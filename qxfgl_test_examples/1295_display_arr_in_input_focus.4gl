MAIN
	DEFINE e_pwort CHAR(32)
	DEFINE a_array ARRAY[1000] OF RECORD 
                    feld1 INTEGER
					END RECORD
	LET a_array[1].feld1 = 1000

	OPEN WINDOW fspw AT 14,14 WITH FORM "1295/1295_display_arr_in_input_focus"
		INPUT BY NAME e_pwort
			ON KEY(INTERRUPT)
				EXIT PROGRAM
			AFTER INPUT 
				CALL SET_COUNT(1000)    
				DISPLAY ARRAY a_array TO s_array.*
					ON KEY ("F9")
						DISPLAY "F9"
					ON KEY(INTERRUPT)
						EXIT DISPLAY
				END DISPLAY
        END INPUT
END MAIN
