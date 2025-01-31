#valid Loqate keys for different demo apps
#ZZ99-JB69-EP69-WR53
#TZ78-EF47-BN68-RT67

MAIN
  DEFINE p_rec_param OF util_address_search_input
  DEFINE l_arr_rec_addr OF util_address_search_output
  DEFINE ret_l_arr_rec_addr OF util_address_retrieve_output
  
  LET p_rec_param.key ="TZ78-EF47-BN68-RT67"
  LET p_rec_param.text="M308BR"
  LET p_rec_param.ismiddleware=1
  LET p_rec_param.limit=1
  CALL util_address_search(p_rec_param.*) RETURNING l_arr_rec_addr
  #DISPLAY l_arr_rec_addr[1]
  #service should return row containing requested postal code "M308BR"
  IF l_arr_rec_addr[1].text MATCHES "*M*3*0*8*B*R*" THEN DISPLAY "PASSED" ELSE DISPLAY "FAILED" END IF

  CALL util_address_retrieve("TZ78-EF47-BN68-RT67", "GB|RM|A|14648586") RETURNING ret_l_arr_rec_addr.*
  #DISPLAY ret_l_arr_rec_addr
  #service should return row containing requested postal code "M308BR"
  IF ret_l_arr_rec_addr.postalcode MATCHES "*M*3*0*8*B*R*" THEN DISPLAY "PASSED" ELSE DISPLAY "FAILED" END IF
END MAIN

