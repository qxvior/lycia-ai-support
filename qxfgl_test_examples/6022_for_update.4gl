DATABASE stores
MAIN
	SELECT fname, lname FROM customer WHERE customer_num = 101 FOR UPDATE OF fname, lname
    DISPLAY "ok"	
END MAIN