#####################################################################################
# GLOBAL SCOPE VARIABLES and custom DataTypes
#####################################################################################
GLOBALS "../4gl/_lib_web_api_address_lookup_globals.4gl"

#####################################################################################
# MODULE SCOPE VARIABLES and custom DataTypes
#####################################################################################
DEFINE modu_rec_wapi_loqate_param OF dt_rec_wapi_loqate_param
DEFINE modu_rec_addressy_param OF dt_rec_wapi_loqate_param
#####################################################################################
# FUNCTION webAPI_address_get(p_rec_wapi_loqate_param)
#
# RETURN l_rec_cust_addr.*
#####################################################################################
FUNCTION webAPI_address_get(p_rec_wapi_loqate_param)
	DEFINE p_rec_wapi_loqate_param OF dt_rec_wapi_loqate_param								#API call parameters inc. post code search string and loqate license key
	DEFINE l_rec_search OF dt_rec_search 							#search string segments (user doesn't need to enter pipe symbols)

	DEFINE l_arr_rec_short_addr OF dt_arr_rec_short_addr					#List of ALL postCodes/Addresses Return
	DEFINE l_arr_rec_short_addr_filtered OF dt_arr_rec_short_addr	#List of postCodes/Addresses Return AFTER filter is applied

	DEFINE l_ret_rec_loqate_addr OF dt_rec_loqate_addr  								#Final field based Address	

	DEFINE l_idx SMALLINT #array index
	DEFINE l_filter_type CHAR													#find returns an rec-array with addresses and postCodes - filter allows the user to control the find result/list
	DEFINE l_retrieve_address_id STRING								#Address Identifier  found/returned by FIND -> web.Request.get("https://api.addressy.com/Capture/Interactive/Find/v1.1/json.ws")
	DEFINE l_schedule_find BOOLEAN										#trigger FIND/RESULT API call only if true
	DEFINE l_ret_found_status BOOLEAN 										#IF address web api returned address or not / found address or not ...

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT

	#INIT ??why again ???			
#	CALL wapi_address_init(p_rec_wapi_loqate_param.*) RETURNING p_rec_wapi_loqate_param.*					#Initialise WEB-API parameters	
	
	IF p_rec_wapi_loqate_param.text IS NOT NULL THEN																#Search string can be parsed from calling function
		LET l_rec_search.text1 = p_rec_wapi_loqate_param.text
		CALL form_search_text(l_rec_search.*) RETURNING p_rec_wapi_loqate_param.text
		LET l_schedule_find = TRUE
	END IF
	
	LET l_filter_type = "N" 																							#None / no filter by default

	OPEN WINDOW w_addressManager WITH FORM "form/_lib_web_api_address_lookup" ATTRIBUTE(BORDER, STYLE="CENTER") 

	DIALOG ATTRIBUTE(UNBUFFERED)

		#Main Search Text -------------------------------------------------------
		INPUT
			l_rec_search.text1,
			l_rec_search.text2,
			l_rec_search.text3,
			l_rec_search.text4		
		WITHOUT DEFAULTS
		FROM
			search1,
			search2,
			search3,
			search4
		END INPUT
			
		#Additonal Search Criteria and Parameters --------------------------------
		INPUT
			p_rec_wapi_loqate_param.text
#			p_rec_wapi_loqate_param.origin
#			p_rec_wapi_loqate_param.countries,
#			p_rec_wapi_loqate_param.language,
#			p_rec_wapi_loqate_param.limit,
#			p_rec_wapi_loqate_param.license_key--,
			--p_rec_wapi_loqate_param.container
		WITHOUT DEFAULTS
		FROM
			text
#			origin,
#			countries,
#			language,
#			limit,
#			license_key--,
			--container		
		END INPUT 

		#Filter for initial search/drill down ------------------------------------
		INPUT l_filter_type WITHOUT DEFAULTS FROM filter_type 			
			ON CHANGE filter_type
				CALL filter_data_array(l_filter_type,l_arr_rec_short_addr) RETURNING l_arr_rec_short_addr_filtered
		
		END INPUT

		#Display list of inital found addresses	----------------------------------
		DISPLAY ARRAY l_arr_rec_short_addr_filtered TO scr_response.*
			BEFORE ROW
				LET l_idx = arr_curr()
				IF l_idx > 0 THEN
					LET l_retrieve_address_id = l_arr_rec_short_addr_filtered[l_idx].id
				ELSE
					LET l_retrieve_address_id = NULL
				END IF
				
			ON ACTION ("DOUBLECLICK")
				LET l_idx = arr_curr()
				IF l_idx > 0 THEN
					CASE l_arr_rec_short_addr_filtered[l_idx].loqate_type 

						WHEN "Address"
							CALL retrieve_address(l_arr_rec_short_addr_filtered[l_idx].id,p_rec_wapi_loqate_param.license_key) RETURNING l_ret_rec_loqate_addr.*
							EXIT DIALOG
{
						WHEN "Postcode"							
							CALL show_search_result_list(l_arr_rec_short_addr_filtered[l_idx].id, p_rec_wapi_loqate_param.license_key) RETURNING l_arr_rec_short_addr_filtered
							IF l_arr_rec_short_addr_filtered.getSize() == 1 AND
							l_arr_rec_short_addr_filtered[1].loqate_type = "Address" THEN 
								CALL retrieve_address(l_arr_rec_short_addr_filtered[1].id,p_rec_wapi_loqate_param.license_key) RETURNING l_ret_rec_loqate_addr.*
								RETURN morph_address_to_cust_address(l_ret_rec_loqate_addr.*) #RETURNING l_rec_custom_address.*
							END IF	

						WHEN "BuildingNumber"							
							CALL show_search_result_list(l_arr_rec_short_addr_filtered[l_idx].id, p_rec_wapi_loqate_param.license_key) RETURNING l_arr_rec_short_addr_filtered
							IF l_arr_rec_short_addr_filtered.getSize() == 1 AND
							l_arr_rec_short_addr_filtered[1].loqate_type = "Address" THEN 
								CALL retrieve_address(l_arr_rec_short_addr_filtered[1].id,p_rec_wapi_loqate_param.license_key) RETURNING l_ret_rec_loqate_addr.*
								RETURN morph_address_to_cust_address(l_ret_rec_loqate_addr.*) #RETURNING l_rec_custom_address.*
							END IF	

						WHEN "District"
							CALL show_search_result_list(l_arr_rec_short_addr_filtered[l_idx].id, p_rec_wapi_loqate_param.license_key) RETURNING l_arr_rec_short_addr_filtered
							IF l_arr_rec_short_addr_filtered.getSize() == 1 AND
							l_arr_rec_short_addr_filtered[1].loqate_type = "Address" THEN 
								CALL retrieve_address(l_arr_rec_short_addr_filtered[1].id,p_rec_wapi_loqate_param.license_key) RETURNING l_ret_rec_loqate_addr.*
								RETURN morph_address_to_cust_address(l_ret_rec_loqate_addr.*) #RETURNING l_rec_custom_address.*
							END IF	
}

						OTHERWISE							
							CALL show_search_result_list(l_arr_rec_short_addr_filtered[l_idx].id, p_rec_wapi_loqate_param.license_key) RETURNING l_arr_rec_short_addr_filtered
							IF l_arr_rec_short_addr_filtered.getSize() == 1 AND	l_arr_rec_short_addr_filtered[1].loqate_type = "Address" THEN 
								CALL retrieve_address(l_arr_rec_short_addr_filtered[1].id,p_rec_wapi_loqate_param.license_key) RETURNING l_ret_rec_loqate_addr.*
								EXIT DIALOG
								END IF		
															
					END CASE
				END IF				

		END DISPLAY	
		

	#DIALOG ACTIONS ---------------------------------------------------------------------------

		#ON ACTION "RESULT"
		#	CALL retrieve_address(l_retrieve_address_id,p_rec_wapi_loqate_param.license_key)
	
		ON ACTION "SEARCH"
			LET l_schedule_find = TRUE
			
#		ON IDLE 222
#			IF l_ready == TRUE THEN
#				CALL form_search_text(l_rec_search.*) RETURNING l_rec_param.text
#			
#	 			LET l_retrieve_address_id = NULL 					#Initialise l_retrieve_address_id from possible previous search result	
#				IF (l_rec_param.text IS NOT NULL) AND (l_rec_param.text.getLength() > 5) THEN  #let's wait for at least 6 chars entry for address search start
#					CALL search(l_rec_param.*) RETURNING l_arr_rec_addr, l_rec_addr.*
#					CALL filter_data_array(l_filter_type,l_arr_rec_addr) RETURNING l_arr_rec_addr_filtered
#					LET l_ready = FALSE
#				END IF
#			END IF
			
					
		ON IDLE 2 #Action IDLE  
			IF l_schedule_find == TRUE THEN
				CALL form_search_text(l_rec_search.*) RETURNING p_rec_wapi_loqate_param.text
				
				IF p_rec_wapi_loqate_param.text.getLength() > 5 THEN
		 			LET l_retrieve_address_id = NULL 					#Initialise l_retrieve_address_id from possible previous search result	
					
					IF p_rec_wapi_loqate_param.text IS NOT NULL THEN
						#RETURN l_arr_rec_short_addr, l_ret_rec_loqate_addr.*,l_rec_cust_addr.*
						CALL search(p_rec_wapi_loqate_param.*) RETURNING l_arr_rec_short_addr, l_ret_rec_loqate_addr.*
						CALL filter_data_array(l_filter_type,l_arr_rec_short_addr) RETURNING l_arr_rec_short_addr_filtered
						LET l_schedule_find = FALSE
						IF l_ret_rec_loqate_addr.line1 IS NOT NULL THEN
							EXIT DIALOG
						END IF
					END IF
				END IF #start from char(5) search minmum
			END IF	#IF l_schedule_find

		ON ACTION "ACCEPT"
			IF l_schedule_find == TRUE THEN
				CALL form_search_text(l_rec_search.*) RETURNING p_rec_wapi_loqate_param.text
	 			LET l_retrieve_address_id = NULL 					#Initialise l_retrieve_address_id from possible previous search result	
				
				IF p_rec_wapi_loqate_param.text IS NOT NULL THEN
					#RETURN l_arr_rec_short_addr, l_ret_rec_loqate_addr.*,l_rec_cust_addr.*
					CALL search(p_rec_wapi_loqate_param.*) RETURNING l_arr_rec_short_addr, l_ret_rec_loqate_addr.*
					CALL filter_data_array(l_filter_type,l_arr_rec_short_addr) RETURNING l_arr_rec_short_addr_filtered
					LET l_schedule_find = FALSE
					IF l_ret_rec_loqate_addr.line1 IS NOT NULL THEN
						EXIT DIALOG
					END IF
				END IF
			END IF
		
		# EXIT ------------------------------------------
		ON ACTION "CANCEL"
			EXIT DIALOG
	END DIALOG

	CLOSE WINDOW w_addressManager
	
	#NEED A BETTER WAY FOR THIS VALIDATION
	IF l_ret_rec_loqate_addr.Line1 IS NOT NULL THEN
		LET l_ret_found_status = TRUE #l_ret_found_status BOOLEAN #search found or not found adsress
	ELSE
		LET l_ret_found_status = FALSE
	END IF 
	
	RETURN l_ret_rec_loqate_addr.*, l_ret_found_status
END FUNCTION
#####################################################################################
# END FUNCTION webAPI_address_get(p_rec_wapi_loqate_param)
#####################################################################################


#####################################################################################
# FUNCTION form_search_text(p_rec_search)
#
# 	RETURN l_ret_tmp_str #new value for rec_param.text
#####################################################################################
FUNCTION form_search_text(p_rec_search)
	DEFINE p_rec_search OF dt_rec_search 							#search string segments (user doesn't need to enter pipe symbols)
	DEFINE l_ret_tmp_str STRING
	DEFINE l_regex_replace util.REGEX	#REPLACE

	IF p_rec_search.text1 IS NOT NULL THEN
		LET l_ret_tmp_str = trim(p_rec_search.text1)
	END IF

	IF p_rec_search.text2 IS NOT NULL THEN
		IF l_ret_tmp_str IS NULL THEN
			LET l_ret_tmp_str = p_rec_search.text2
		ELSE
			LET l_ret_tmp_str = trim(l_ret_tmp_str), "|", p_rec_search.text2
		END IF
	END IF

	IF p_rec_search.text3 IS NOT NULL THEN
		IF l_ret_tmp_str IS NULL THEN
			LET l_ret_tmp_str = p_rec_search.text3
		ELSE
			LET l_ret_tmp_str =  trim(l_ret_tmp_str), "|", p_rec_search.text3
		END IF
	END IF

	IF p_rec_search.text4 IS NOT NULL THEN
		IF l_ret_tmp_str IS NULL THEN
			LET l_ret_tmp_str = p_rec_search.text4
		ELSE
			LET l_ret_tmp_str = trim(l_ret_tmp_str), "|", p_rec_search.text4
		END IF
	END IF

	IF p_rec_search.text5 IS NOT NULL THEN
		IF l_ret_tmp_str IS NULL THEN
			LET l_ret_tmp_str = p_rec_search.text5
		ELSE
			LET l_ret_tmp_str = trim(l_ret_tmp_str), "|", p_rec_search.text5
		END IF
	END IF

	IF p_rec_search.text6 IS NOT NULL THEN
		IF l_ret_tmp_str IS NULL THEN
			LET l_ret_tmp_str = p_rec_search.text6
		ELSE
			LET l_ret_tmp_str = trim(l_ret_tmp_str), "|", p_rec_search.text6
		END IF
	END IF
	
	LET l_regex_replace = / /g
	CALL util.REGEX.replace(l_ret_tmp_str, l_regex_replace, "|") RETURNING l_ret_tmp_str	

	RETURN l_ret_tmp_str #new value for rec_param.text
END FUNCTION
#####################################################################################
# END FUNCTION form_search_text(p_rec_param)
#
#
#####################################################################################
 	

#####################################################################################
# FUNCTION search(p_rec_param)
#
# 	RETURN l_arr_rec_short_addr, l_rec_loqate_addr.*,l_rec_cust_addr.*
#####################################################################################
FUNCTION search(p_rec_param)
	DEFINE p_rec_param OF dt_rec_wapi_loqate_param		#API call parameters inc. post code search string and loqate license key
	DEFINE l_arr_rec_short_addr OF dt_arr_rec_short_addr
	DEFINE l_rec_loqate_addr OF dt_rec_loqate_addr  #Final field based Address	
	DEFINE l_filter_type CHAR	

	#Reset previous address retrieve result
	INITIALIZE l_rec_loqate_addr TO NULL		
#	CALL morph_address_to_cust_address(l_rec_loqate_addr.*)

	#fire off service request
	CALL search_address(p_rec_param.*) RETURNING l_arr_rec_short_addr
	
	IF l_arr_rec_short_addr.getSize() = 1 THEN
		IF l_arr_rec_short_addr[1].id IS NULL THEN
			CALL l_arr_rec_short_addr.clear()
		END IF
	END IF
	
	DISPLAY l_arr_rec_short_addr.getSize() TO find_count

	#IF return is single address, retrieve it
	IF (l_arr_rec_short_addr.getSize() == 1) #Only one PostCode/Address.. skip next step and show address instantly
	AND (l_arr_rec_short_addr[1].loqate_type == "Address") THEN
		CALL retrieve_address(l_arr_rec_short_addr[1].id,p_rec_param.license_key) RETURNING l_rec_loqate_addr.*
	END IF			

	RETURN l_arr_rec_short_addr, l_rec_loqate_addr.*
END FUNCTION
#####################################################################################
# END FUNCTION search(p_rec_param)
#####################################################################################


#####################################################################################
# FUNCTION search_address(p_rec_param)
#
# RETURN l_ret_arr_rec_short_addr
#####################################################################################
FUNCTION search_address(p_rec_param)
	DEFINE p_rec_param OF dt_rec_wapi_loqate_param		#API call parameters inc. post code search string and loqate license key
	DEFINE l_ret_arr_rec_short_addr OF dt_arr_rec_short_addr
  DEFINE l_web_response web.Response  
  DEFINE l_web_session web.Session
  DEFINE l_web_response_JSONArray_body util.JSONArray
  
	#fire off service request
	CALL web.Request.get("https://api.addressy.com/Capture/Interactive/Find/v1.1/json.ws")
                .param("Key", p_rec_param.license_key) #"FP38-DY64-DZ48-EG69"
                .param("Container", p_rec_param.container) #container IF NOT NULL, ONLY THIS will be used 
                .param("Text", p_rec_param.text) #SEARCH
								.param("Origin", p_rec_param.origin) # "GB"
                .param("Countries", p_rec_param.countries) # "GB"
                .param("Language", p_rec_param.language) # "ENG"
								.param("Limit", p_rec_param.limit) # "ENG"
								.param("IsMiddleware",p_rec_param.limit)
								.param("BIAS",p_rec_param.bias)
								.param("Filters",p_rec_param.filters)
								.param("GeoFence",p_rec_param.geofence)
                .perform(l_web_session) RETURNING l_web_response

  IF l_web_response.GetHTTPCode() == 200 THEN
		LET l_web_response_JSONArray_body = util.JSONArray.parse(l_web_response.getBody())
		CALL l_web_response_JSONArray_body.toFGL(l_ret_arr_rec_short_addr)
	ELSE
		CALL fgl_winmessage("Error","Service returned ERROR","ERROR")
	END IF
	
	RETURN l_ret_arr_rec_short_addr
END FUNCTION
#####################################################################################
# END FUNCTION search_address(p_rec_param)
#####################################################################################


#####################################################################################
# FUNCTION show_search_result_list(p_id,p_license_key)
#
#
#####################################################################################
FUNCTION show_search_result_list(p_id,p_license_key)
	DEFINE p_id STRING 
	DEFINE p_license_key STRING
	DEFINE ret_l_arr_rec_addr OF dt_arr_rec_short_addr
  DEFINE l_web_response web.Response 
  DEFINE l_web_session web.Session
  DEFINE l_web_response_JSONObject_body util.JSONObject
    
	#fire off service request
  CALL web.Request.get("https://api.addressy.com/Capture/Interactive/Find/v1.1/json.ws")
                  .param("Key", p_license_key) #"FP38-DY64-DZ48-EG69"
									#.param("Addresses", l_rec_param.countries) # "GB"
									.param("Container",p_id) #.param("Container","GB%7CRM%7CENG%7C7hh-so16")
                  #.param("Text", l_rec_param.search_text) #"wr5" #.param("Text", "wr5%203da")
									#.param("Origin", l_rec_param.origin) # "GB"
                  #.param("Countries", l_rec_param.countries) # "GB"
                  #.param("Language", l_rec_param.language) # "ENG"
									#.param("Limit", l_rec_param.limit) # "ENG"
									#.param("IsMiddleware",TRUE)
									#.param("BIAS",XXX)
									#.param("Filters",XXX)
									#.param("GeoFence",XXX)
                  .perform(l_web_session) RETURNING l_web_response
                  
	  IF l_web_response.GetHTTPCode() = 200 THEN
    LET l_web_response_JSONObject_body = util.JSONObject.parse(l_web_response.getBody())
    CALL l_web_response_JSONObject_body.toFGL(ret_l_arr_rec_addr)
  ELSE
  	CALL fgl_winmessage("Error","Service returned ERROR","ERROR")
  END IF

	RETURN ret_l_arr_rec_addr
END FUNCTION
#####################################################################################
# END FUNCTION show_search_result_list(p_id,p_license_key)
#####################################################################################


#####################################################################################
# FUNCTION retrieve_address(p_address_id,p_license_key)
#
# RETURN l_ret_arr_rec_loqate_addr[1].*
#####################################################################################
FUNCTION retrieve_address(p_address_id,p_license_key)
	DEFINE p_address_id STRING 
	DEFINE p_license_key STRING
	DEFINE l_ret_arr_rec_loqate_addr DYNAMIC ARRAY OF dt_rec_loqate_addr
  DEFINE l_web_response web.Response 
  DEFINE l_web_session web.Session
  DEFINE l_web_response_JSONArray_body util.JSONArray
  DEFINE l_ret_found_status BOOLEAN

  CALL web.Request.get("https://api.addressy.com/Capture/Interactive/Retrieve/v1.1/json.ws")
                  .param("Key", p_license_key) #"FP38-DY64-DZ48-EG69"
									.param("id",p_address_id) #.param("Container","GB%7CRM%7CENG%7C7hh-so16")
                  .perform(l_web_session) RETURNING l_web_response

  IF l_web_response.GetHTTPCode() = 200 THEN
    LET l_web_response_JSONArray_body = util.JSONArray.parse(l_web_response.getBody())
    CALL l_web_response_JSONArray_body.toFGL(l_ret_arr_rec_loqate_addr)
    LET l_ret_found_status = TRUE
  ELSE
  	CALL fgl_winmessage("Error","Service returned ERROR","ERROR")
  	LET l_ret_found_status = FALSE
  END IF

	RETURN l_ret_arr_rec_loqate_addr[1].*, l_ret_found_status
END FUNCTION
#####################################################################################
# END FUNCTION retrieve_address(p_address_id,p_license_key)
#####################################################################################


#####################################################################################
# FUNCTION filter_data_array(p_filter_type,p_arr_rec_short_addr_complete)
#
# RETURN l_ret_arr_rec_short_addr_filtered
#####################################################################################
FUNCTION filter_data_array(p_filter_type,p_arr_rec_short_addr_complete)
	DEFINE p_filter_type CHAR
	DEFINE p_arr_rec_short_addr_complete OF dt_arr_rec_short_addr
	DEFINE l_ret_arr_rec_short_addr_filtered OF dt_arr_rec_short_addr
	DEFINE l_filter STRING
	DEFINE i SMALLINT
	
	LET l_ret_arr_rec_short_addr_filtered = p_arr_rec_short_addr_complete 

	IF p_filter_type != "N" THEN
		#OR p_filter_type == "A" 
		#OR p_filter_type == "D" 
		#OR p_filter_type == "B" THEN
		
		
		
		CASE p_filter_type
			WHEN "P"
				LET l_filter = "Postcode"
			WHEN "D"
				LET l_filter = "District"
			WHEN "A"
				LET l_filter = "Address"
			WHEN "B"
				LET l_filter = "BuildingNumber"
			OTHERWISE
				LET l_filter = "Postcode"			
		END CASE

		FOR i = 1 TO p_arr_rec_short_addr_complete.getSize()
			IF l_ret_arr_rec_short_addr_filtered[i].loqate_type != l_filter THEN
				CALL l_ret_arr_rec_short_addr_filtered.delete(i)
				LET i = i-1
			END IF 
		END FOR
	
	END IF
	
	RETURN l_ret_arr_rec_short_addr_filtered
END FUNCTION
#####################################################################################
# END FUNCTION filter_data_array(p_filter_type,p_arr_rec_short_addr_complete)
#####################################################################################

#####################################################################################
# FUNCTION wapi_get_rec_param()
#
# RETURN modu_rec_wapi_loqate_param.*
#####################################################################################
FUNCTION wapi_get_rec_param()
#	DEFINE p_rec_param OF dt_rec_wapi_loqate_param

	RETURN modu_rec_wapi_loqate_param.*
END FUNCTION
#####################################################################################
# END FUNCTION wapi_get_rec_param()
#####################################################################################

#####################################################################################
# FUNCTION webapi_loqate_set_rec_param()
#
# RETURN w_rec_param.*
#####################################################################################
FUNCTION webapi_loqate_set_rec_param(p_rec_param)
	DEFINE p_rec_param OF dt_rec_wapi_loqate_param
	LET modu_rec_wapi_loqate_param.* = p_rec_param.*
END FUNCTION
#####################################################################################
# END FUNCTION webapi_loqate_set_rec_param()
#####################################################################################



#####################################################################################
# FUNCTION wapi_address_init(p_rec_wapi_loqate_param)
#
# RETURN modu_rec_wapi_loqate_param.*
#####################################################################################
FUNCTION wapi_address_init(p_rec_wapi_loqate_param)
	DEFINE p_rec_wapi_loqate_param OF dt_rec_wapi_loqate_param
	
	LET modu_rec_wapi_loqate_param.*  = p_rec_wapi_loqate_param.*
	
	IF modu_rec_wapi_loqate_param.license_key IS NULL THEN
		LET modu_rec_wapi_loqate_param.license_key = "CB99-MF88-XZ97-NJ73" #The key used to authenticate with the service. "CB99-MF88-XZ97-NJ73" "ZZ99-JB69-EP69-WR53"
	END IF
	
	#LET modu_rec_wapi_loqate_param.text = "M308BR" 				#The search text to find. Ideally a postcode or the start of the address.
	#LET modu_rec_wapi_loqate_param.container = NULL 				#A container for the search. This should only be another Id previously returned from this service when the Type of the result was not 'Address'.
	#LET modu_rec_wapi_loqate_param.origin = "GB"						#A starting location for the search. This can be the name or ISO 2 or 3 character code of a country, WGS84 coordinates (comma separated) or IP address to search from.
	#LET modu_rec_wapi_loqate_param.countries = NULL #"GB" 				#A comma separated list of ISO 2 or 3 character country codes to limit the search within.
	#LET modu_rec_wapi_loqate_param.language = "ENG" 				#The preferred language for results. This should be a 2 or 4 character language code e.g. (en, fr, en-gb, en-us etc).
	IF modu_rec_wapi_loqate_param.limit == 0 THEN
		LET modu_rec_wapi_loqate_param.limit = 500 						#The maximum number of results to return.
	END IF
	LET modu_rec_wapi_loqate_param.IsMiddleware = TRUE			#Whether the API is being called from a middleware implementation (and therefore the calling IP address should not be used for biasing). 
	LET modu_rec_wapi_loqate_param.Bias = FALSE 						#Enable/Disable biasing
	LET modu_rec_wapi_loqate_param.Filters = FALSE 					#V4 Shadowterms
	LET modu_rec_wapi_loqate_param.GeoFence = FALSE 				#V4 GeoFence

	RETURN modu_rec_wapi_loqate_param.*
END FUNCTION
#####################################################################################
# END FUNCTION wapi_address_init(p_rec_wapi_loqate_param)
#####################################################################################



#####################################################################################
# FUNCTION init_addressy_param()
#
#
#####################################################################################
FUNCTION init_addressy_param()

	LET modu_rec_addressy_param.license_key = "YR96-DP94-XE91-HY91" # "TZ78-EF47-BN68-RT67" #The key used to authenticate with the service. "CB99-MF88-XZ97-NJ73" "ZZ99-JB69-EP69-WR53"
	#LET modu_rec_addressy_param.license_key = "CB99-MF88-XZ97-NJ73" #The key used to authenticate with the service. "CB99-MF88-XZ97-NJ73" "ZZ99-JB69-EP69-WR53"

	#LET modu_rec_addressy_param.text = "M308BR" 				#The search text to find. Ideally a postcode or the start of the address.
	#LET modu_rec_addressy_param.container = NULL 				#A container for the search. This should only be another Id previously returned from this service when the Type of the result was not 'Address'.
	#LET modu_rec_addressy_param.origin = "GB"						#A starting location for the search. This can be the name or ISO 2 or 3 character code of a country, WGS84 coordinates (comma separated) or IP address to search from.
	#LET modu_rec_addressy_param.countries = NULL #"GB" 				#A comma separated list of ISO 2 or 3 character country codes to limit the search within.
	#LET modu_rec_addressy_param.language = "ENG" 				#The preferred language for results. This should be a 2 or 4 character language code e.g. (en, fr, en-gb, en-us etc).
	LET modu_rec_addressy_param.limit = 500 						#The maximum number of results to return.
	LET modu_rec_addressy_param.IsMiddleware = TRUE			#Whether the API is being called from a middleware implementation (and therefore the calling IP address should not be used for biasing). 
	LET modu_rec_addressy_param.Bias = NULL 						#Enable/Disable biasing
	LET modu_rec_addressy_param.Filters = NULL 					#V4 Shadowterms
	LET modu_rec_addressy_param.GeoFence = NULL 				#V4 GeoFence

END FUNCTION
#####################################################################################
# END FUNCTION init_addressy_param()
#####################################################################################

