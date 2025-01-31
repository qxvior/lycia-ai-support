MAIN
 DEFINE dyn_arr DYNAMIC ARRAY OF INT
 DEFINE var_arr DYNAMIC ARRAY OF VARIANT
	
	LET dyn_arr[1] = "1"
	LET var_arr[1] = dyn_arr
	DISPLAY var_arr[1] 

	LET var_arr[1][1] = 2 
	DISPLAY var_arr[1]

	LET dyn_arr = var_arr[1] #fails
	DISPLAY dyn_arr
END MAIN