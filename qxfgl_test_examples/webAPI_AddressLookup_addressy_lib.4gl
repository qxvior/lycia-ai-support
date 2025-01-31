#####################################################################################
# GLOBAL SCOPE VARIABLES and custom DataTypes
#####################################################################################
GLOBALS "../4gl/_lib_web_api_address_lookup_globals.4gl"

###############################################################################W2 6BD 2######
# END RECORD
#####################################################################################

#####################################################################################
# MAIN
#
# 
#####################################################################################
MAIN
	DEFINE l_json_obj_address util.JSONObject
	DEFINE l_rec_contact RECORD
		company STRING,
		title STRING,
		first_name STRING,
		last_name STRING,
		addr_1 STRING,
		addr_2 STRING,
		city STRING,
		post_code STRING,
		country STRING
	END RECORD
#	DEFINE ret_rec_address RECORD
#		BuildingNumber	STRING, 			#The number of building.
#		BuildingName	STRING, 				#The associated name of the building.
#		Street	STRING, 							#		The main thoroughfare name.
#		City	STRING, 								#		City name.
#		District	STRING, 						#		District name.
#		Province	STRING, 						#		Province / county.
#		PostalCode	STRING, 					#		Postal code.
#		CountryName	STRING, 				#		Name of the country the address is in.
#	
#		Label	STRING, 				#		The full address formatted as a label.
#	
#		Line1	STRING, 								#		The first line of the formatted address.
#		Line2	STRING, 								#		The second line of the formatted address.
#		Line3	STRING, 								#		The third line of the formatted address.
#		Line4	STRING, 								#		The fourth line of the formatted address.
#		Line5	STRING 								#		The fifth line of the formatted address.
#		
#	END RECORD
	DEFINE l_rec_wapi_loqate_param OF dt_rec_wapi_loqate_param					#loqate parameter record
	DEFINE l_rec_loqate_addr OF dt_rec_loqate_addr											#loqate address record
#	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	DEFER INTERRUPT

	CALL ui_init()
	#INIT			
	CALL init_addressy_param()					#Initialise WEB-API parameters
	#CALL wapi_address_init(l_rec_wapi_loqate_param.*) RETURNING l_rec_wapi_loqate_param.*			#possiblity to set loqate parameters, otherwise, defaults will be used
	
  CALL fgl_settitle("Loqate Lib Demo")
	CALL ui.Interface.setText("Loqate Lib")
	
	OPEN WINDOW wMain WITH FORM "form/webAPI_AddressLookup_addressy_lib"	

	INPUT 
		l_rec_contact.company ,
		l_rec_contact.title ,
		l_rec_contact.first_name ,
		l_rec_contact.last_name ,
		l_rec_contact.addr_1 ,
		l_rec_contact.addr_2 ,
		l_rec_contact.city ,
		l_rec_contact.post_code ,
		l_rec_contact.country 
		WITHOUT DEFAULTS
		FROM
		company,
		title,
		first_name,
		last_name,
		addr_1,
		addr_2,
		city,
		post_code,
		country

#		#Additonal Search Criteria and Parameters --------------------------------
#		INPUT
#			l_rec_wapi_loqate_param.text#,
#			l_rec_wapi_loqate_param.origin,
#			l_rec_wapi_loqate_param.countries,
#			l_rec_wapi_loqate_param.language,
#			l_rec_wapi_loqate_param.limit,
#			l_rec_wapi_loqate_param.license_key--,
#			--p_rec_param.container
#		WITHOUT DEFAULTS
#		FROM
#			text,
#			origin,
#			countries,
#			language,
#			limit,
#			license_key--,
#			--container		
#			ATTRIBUTE(UNBUFFERED)
 	
		ON ACTION "ADDRESS_LOOKUP"
			#LET l_rec_wapi_loqate_param.* = wapi_get_rec_param()
			CALL wapi_address_init(l_rec_wapi_loqate_param.*) RETURNING l_rec_wapi_loqate_param.*			#possiblity to set loqate parameters, otherwise, defaults will be used
			
			#CALL webapi_loqate_set_rec_param(l_rec_wapi_loqate_param.*) 
			CALL webAPI_address_get(l_rec_wapi_loqate_param.*) RETURNING l_json_obj_address
			CALL json_get_address(l_json_obj_address)
			RETURNING
				l_rec_contact.addr_1,
				l_rec_contact.addr_2,
				l_rec_contact.city,
				l_rec_contact.post_code,
				l_rec_contact.country 
			
#			DISPLAY l_rec_loqate_addr.company TO company
#			DISPLAY l_rec_loqate_addr.BuildingNumber TO BuildingNumber
#			DISPLAY l_rec_loqate_addr.BuildingName TO BuildingName
#			DISPLAY l_rec_loqate_addr.Street TO Street
#			DISPLAY l_rec_loqate_addr.District TO District
#			DISPLAY l_rec_loqate_addr.Line1 TO Line1
#			DISPLAY l_rec_loqate_addr.Line2 TO Line2
#			DISPLAY l_rec_loqate_addr.Line3 TO Line3
#			DISPLAY l_rec_loqate_addr.Line4 TO Line4
#			DISPLAY l_rec_loqate_addr.Line5 TO Line5
#			DISPLAY l_rec_loqate_addr.City TO City
#			DISPLAY l_rec_loqate_addr.AdminAreaName TO AdminAreaName
#			DISPLAY l_rec_loqate_addr.ProvinceName TO ProvinceName
#			DISPLAY l_rec_loqate_addr.PostalCode TO PostalCode
#			DISPLAY l_rec_loqate_addr.CountryName TO CountryName
#			DISPLAY l_rec_loqate_addr.POBoxNumber TO POBoxNumber
#			DISPLAY l_rec_loqate_addr.label TO label
#						
#			CONTINUE INPUT
	END INPUT

END MAIN
#####################################################################################
# END MAIN
#####################################################################################


FUNCTION json_get_address(p_json_obj_address)
	DEFINE p_json_obj_address util.JSONObject
	DEFINE l_address_1 STRING
	DEFINE l_address_2 STRING
	DEFINE l_city STRING
	DEFINE l_postalCode STRING
	DEFINE l_countryName STRING
	DEFINE l_rec_addr_line RECORD
		line1 STRING,
		line2 STRING,
		line3 STRING,
		line4 STRING,
		line5 STRING
	END RECORD
	
	LET l_rec_addr_line.line1 = p_json_obj_address.get("Line1")
	LET l_rec_addr_line.line2 = p_json_obj_address.get("Line2")
	LET l_rec_addr_line.line3 = p_json_obj_address.get("Line3")
	LET l_rec_addr_line.line4 = p_json_obj_address.get("Line4")
	LET l_rec_addr_line.line5 = p_json_obj_address.get("Line5")


	CALL morph_to_2_lines_address(l_rec_addr_line.*,40) #40 characters max line length
	RETURNING l_address_1, l_address_2
	
	CALL p_json_obj_address.get("City") RETURNING l_city
	CALL p_json_obj_address.get("PostalCode") RETURNING l_postalCode
	CALL p_json_obj_address.get("CountryName") RETURNING l_countryName
	

	RETURN l_address_1,l_address_2,l_city,l_postalCode,l_countryName
END FUNCTION

# Example function to morph address record 5 lines to 2 lines
FUNCTION morph_to_2_lines_address(p_rec_addr_line,p_line_max_length)
	DEFINE p_rec_addr_line RECORD
		line1 STRING,
		line2 STRING,
		line3 STRING,
		line4 STRING,
		line5 STRING
	END RECORD
	DEFINE l_line_all STRING
	DEFINE p_line_max_length SMALLINT
	DEFINE l_line_length1 SMALLINT
	DEFINE l_line_length2 SMALLINT
	DEFINE l_line_length3 SMALLINT
	
	LET l_line_length1 = p_rec_addr_line.line1.getLength()
	LET l_line_length2 = p_rec_addr_line.line1.getLength()

	LET l_line_all = p_rec_addr_line.line1, " ",p_rec_addr_line.line2, " ",p_rec_addr_line.line3, " ",p_rec_addr_line.line4, " ",p_rec_addr_line.line5
	
	IF l_line_all.getLength() > 5 * p_line_max_length THEN
		ERROR "Address is too long and will be clipped"
		#problem, we need to clip.. no choice	.. but we only inform and continue to process
	END IF
	
	# we akways copy line 5 to line 4
	IF p_rec_addr_line.line5 IS NOT NULL THEN 
		LET p_rec_addr_line.line4 = trim(p_rec_addr_line.line4), ",", trim(p_rec_addr_line.line5) 
	END IF

	IF p_rec_addr_line.line4 IS NOT NULL THEN 
		LET p_rec_addr_line.line3 = trim(p_rec_addr_line.line3), ",", trim(p_rec_addr_line.line4) 
	END IF
	
	IF p_rec_addr_line.line3 IS NULL THEN
		## all fine, we use simply  line1 and line 2 as they are...
	ELSE
		LET l_line_length3 = p_rec_addr_line.line3.getLength()
		#line1 is longest
		IF (l_line_length1 > l_line_length2) AND (l_line_length1 > l_line_length3) THEN
			LET p_rec_addr_line.line2 = trim(p_rec_addr_line.line2), ",", trim(p_rec_addr_line.line3)
		ELSE
			IF (l_line_length1 + l_line_length2) > (l_line_length2 + l_line_length3) THEN
				LET p_rec_addr_line.line2 = trim(p_rec_addr_line.line2), ",", trim(p_rec_addr_line.line3)
			ELSE
				LET p_rec_addr_line.line1 = trim(p_rec_addr_line.line1), ",", trim(p_rec_addr_line.line2)
				LET p_rec_addr_line.line2 = trim(p_rec_addr_line.line3)
			END IF
		END IF	
	END IF
	
	RETURN p_rec_addr_line.line1, p_rec_addr_line.line2	
END FUNCTION
