#####################################################################################
# GLOBALS
#####################################################################################
GLOBALS "webAPI_AddressLookup_globals.4gl"
PUBLIC DEFINE dt_arr_UTIL_ADDRESS_RETRIEVE_OUTPUT TYPE AS DYNAMIC ARRAY OF UTIL_ADDRESS_RETRIEVE_OUTPUT

MAIN
	DEFINE p_address_id STRING 
	DEFINE p_license_key STRING
	DEFINE l_ret_arr_rec_loqate_addr DYNAMIC ARRAY OF dt_rec_loqate_addr
  DEFINE l_web_response web.Response 
  DEFINE l_web_session web.Session
  DEFINE l_web_response_JSONArray_body util.JSONArray

  CALL web.Request.get("https://api.addressy.com/Capture/Interactive/Retrieve/v1.1/json.ws")
                  .param("Key", p_license_key) #"FP38-DY64-DZ48-EG69"
									.param("id",p_address_id) #.param("Container","GB%7CRM%7CENG%7C7hh-so16")
                  .perform(l_web_session) RETURNING l_web_response

  IF l_web_response.GetHTTPCode() = 200 THEN
    LET l_web_response_JSONArray_body = util.JSONArray.parse(l_web_response.getBody())
    CALL l_web_response_JSONArray_body.toFGL(l_ret_arr_rec_loqate_addr)
  ELSE
  	CALL fgl_winmessage("Error","Service returned ERROR","ERROR")
  END IF

	DISPLAY l_web_response_JSONArray_body
	#DISPLAY l_ret_arr_rec_loqate_addr.*

END MAIN  