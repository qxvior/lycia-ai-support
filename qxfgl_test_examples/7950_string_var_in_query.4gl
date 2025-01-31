DATABASE stores
MAIN
	DEFINE v_where INT
	DEFINE v_out STRING
	LET v_where = 101
	SELECT fname INTO v_out FROM customer WHERE customer_num = v_where
	DISPLAY "|", v_out, "|"
	SELECT fname INTO v_out FROM customer WHERE customer_num = 101
	DISPLAY "|", v_out, "|"
END MAIN