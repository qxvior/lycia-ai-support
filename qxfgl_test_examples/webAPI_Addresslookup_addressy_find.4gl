#####################################################################################
# GLOBALS
#####################################################################################
GLOBALS "webAPI_AddressLookup_globals.4gl"

#####################################################################################
# MAIN
#
#
#####################################################################################
MAIN
  DEFINE rs web.Response  
  DEFINE ses web.Session
  DEFINE body util.JSONArray
  DEFINE key STRING
	DEFINE addr DYNAMIC ARRAY OF RECORD
	  id STRING,
	  type STRING,
	  text STRING,
	  highlight STRING,
	  description STRING
	END RECORD

	##################################################
	# Key*	String		The key to use to authenticate to the LOQATE service
	# ManagedByMe*	String "RM"	true/false Flag that tells if the new account is to be managed by RM (true) or by a new contact (false)
	##################################################
  PROMPT "Enter license key:" FOR key
  CALL web.Request.get("https://api.addressy.com/Capture/Interactive/Find/v1.10/json.ws")
                  .param("Key", key)
                  .param("Text", "M308BR|22")
                  .perform(ses) RETURNING rs

	DISPLAY "HTTPCode: ", rs.GetHTTPCode()
  DISPLAY "Response: ", rs.getBody()
  
  IF rs.GetHTTPCode() = 200 THEN
    LET body = util.JSONArray.parse(rs.getBody())
    CALL body.toFGL(addr)
  END IF
  
  DISPLAY "ADDRESS:" 
	DISPLAY addr

END MAIN
#####################################################################################
# END MAIN
#####################################################################################