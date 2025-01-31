#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
MAIN
	DEFINE
		v_char CHAR(80)

	LET v_char = ""
--------------------------------------------------------------------------	
	IF v_char MATCHES "['']"
	THEN DISPLAY "1. MATCHES IS TRUE"
	ELSE DISPLAY "1. MATCHES IS FALSE"
	END IF
	IF v_char NOT MATCHES "['']"
	THEN DISPLAY "2. NOT MATCHES IS TRUE"
	ELSE DISPLAY "2. NOT MATCHES IS FALSE"
	END IF

	LET v_char = " "
--------------------------------------------------------------------------
	IF v_char MATCHES "['']"
	THEN DISPLAY "3. MATCHES IS TRUE"
	ELSE DISPLAY "3. MATCHES IS FALSE"
	END IF
	IF v_char NOT MATCHES "['']"
	THEN DISPLAY "4. NOT MATCHES IS TRUE"
	ELSE DISPLAY "4. NOT MATCHES IS FALSE"
	END IF

	IF v_char MATCHES "[' ']"
	THEN DISPLAY "5. MATCHES IS TRUE"
	ELSE DISPLAY "5. MATCHES IS FALSE"
	END IF
	IF v_char NOT MATCHES "[' ']"
	THEN DISPLAY "6. NOT MATCHES IS TRUE"
	ELSE DISPLAY "6. NOT MATCHES IS FALSE"
	END IF

	IF v_char MATCHES "['                                        ']"
	THEN DISPLAY "7. MATCHES IS TRUE"
	ELSE DISPLAY "7. MATCHES IS FALSE"
	END IF
	IF v_char NOT MATCHES "['                                        ']"
	THEN DISPLAY "8. NOT MATCHES IS TRUE"
	ELSE DISPLAY "8. NOT MATCHES IS FALSE"
	END IF

	LET v_char = "                                        "
--------------------------------------------------------------------------
	IF v_char MATCHES "['                    ']"
	THEN DISPLAY "9. MATCHES IS TRUE"
	ELSE DISPLAY "9. MATCHES IS FALSE"
	END IF
	IF v_char NOT MATCHES "['                    ']"
	THEN DISPLAY "10.NOT MATCHES IS TRUE"
	ELSE DISPLAY "10.NOT MATCHES IS FALSE"
	END IF

	IF v_char MATCHES "['                                                                                ']"
	THEN DISPLAY "11.MATCHES IS TRUE"
	ELSE DISPLAY "11.MATCHES IS FALSE"
	END IF
	IF v_char NOT MATCHES "['                                                                                ']"
	THEN DISPLAY "12.NOT MATCHES IS TRUE"
	ELSE DISPLAY "12.NOT MATCHES IS FALSE"
	END IF

END MAIN
