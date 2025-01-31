#####################################################################################
# GLOBAL SCOPE VARIABLES and custom DataTypes
#####################################################################################
GLOBALS "../4gl/_lib_web_api_address_lookup_globals_custom.4gl"
GLOBALS "../4gl/_lib_web_api_address_lookup_globals_internal.4gl"

#####################################################################################
# FUNCTION morph_address_to_cust_address(p_rec_addr)
#
#
#####################################################################################
FUNCTION morph_address_to_cust_address(p_rec_addr)
	DEFINE p_rec_addr OF dt_rec_loqate_addr  #Final field based Address	
	DEFINE l_rec_cust_addr OF dt_rec_cust_addr  #Final customized Address record/structure

	#MAP loquate address structure to application address structure

	LET l_rec_cust_addr.company = p_rec_addr.company
	LET l_rec_cust_addr.line1 = p_rec_addr.Line1
	LET l_rec_cust_addr.line2 = p_rec_addr.Line2
	LET l_rec_cust_addr.line3 = p_rec_addr.Line3
	LET l_rec_cust_addr.line4 = p_rec_addr.Line4
	LET l_rec_cust_addr.line5 = p_rec_addr.Line5
	LET l_rec_cust_addr.City = p_rec_addr.City
	LET l_rec_cust_addr.ProvinceName = p_rec_addr.ProvinceName
	LET l_rec_cust_addr.PostalCode = p_rec_addr.PostalCode
	LET l_rec_cust_addr.CountryName = p_rec_addr.CountryName
	LET l_rec_cust_addr.label = p_rec_addr.label

				
	IF FALSE THEN #debug window
		OPEN WINDOW w_address WITH FORM "form/_lib_web_api_address_lookup_rec_map.fm2"
	
		DISPLAY p_rec_addr.id TO address_id										#The unique Id of the address.
		DISPLAY p_rec_addr.domesticId	TO domesticId						#The unique Id of the address as it appears in its respective dataset.
		DISPLAY p_rec_addr.language	TO address_language				#The language of the address.
		DISPLAY p_rec_addr.languageAlternatives	TO languageAlternatives	#Alternative languages for the address.
		DISPLAY p_rec_addr.Department	TO Department 					#Department name.
		DISPLAY p_rec_addr.Company TO Company									#Company name.
		DISPLAY p_rec_addr.SubBuilding TO SubBuilding					#The name of the sub building (e.g. flat, unit).
		DISPLAY p_rec_addr.BuildingNumber	TO BuildingNumber		#The number of building.
		DISPLAY p_rec_addr.BuildingName	TO BuildingName				#The associated name of the building.
		DISPLAY p_rec_addr.SecondaryStreet TO SecondaryStreet #The secondary thoroughfare name. Usually a small street off the primary.
		DISPLAY p_rec_addr.Street TO Street										#		The main thoroughfare name.
		DISPLAY p_rec_addr.Block TO Block 										#		The block details for the address.
		DISPLAY p_rec_addr.Neighbourhood TO Neighbourhood			#		The neighbourhood the address is in.
		DISPLAY p_rec_addr.District	TO District								#		District name.
		DISPLAY p_rec_addr.City	TO City												#		City name.
		DISPLAY p_rec_addr.Line1 TO Line1											#		The first line of the formatted address.
		DISPLAY p_rec_addr.Line2 TO Line2											#		The second line of the formatted address.
		DISPLAY p_rec_addr.Line3 TO Line3											#		The third line of the formatted address.
		DISPLAY p_rec_addr.Line4 TO Line4											#		The fourth line of the formatted address.
		DISPLAY p_rec_addr.Line5 TO Line5											#		The fifth line of the formatted address.
		DISPLAY p_rec_addr.AdminAreaName TO AdminAreaName			#		The name of the administrative area for the address.
		DISPLAY p_rec_addr.AdminAreaCode TO AdminAreaCode			#		The code of the administrative area for the address.
		DISPLAY p_rec_addr.Province	TO Province								#		Province / county.
		DISPLAY p_rec_addr.ProvinceName TO ProvinceName				#		Province / county.
		DISPLAY p_rec_addr.ProvinceCode TO ProvinceCode				#		Associated province code.
		DISPLAY p_rec_addr.PostalCode TO PostalCode						#		Postal code.
		DISPLAY p_rec_addr.CountryName TO CountryName 				#		Name of the country the address is in.
		DISPLAY p_rec_addr.CountryIso2 TO CountryIso2 				#		2 character ISO code for the country.
		DISPLAY p_rec_addr.CountryIso3 TO CountryIso3 				#		3 character ISO code for the country.
		DISPLAY p_rec_addr.CountryIsoNumber	TO CountryIsoNumber				#		ISO numeric code for the country.
		DISPLAY p_rec_addr.SortingNumber1	TO SortingNumber1		#	
		DISPLAY p_rec_addr.SortingNumber2	TO SortingNumber2		#	
		DISPLAY p_rec_addr.Barcode TO Barcode					 				#		The barcode for the addres - needs to be used with an appropriate barcode font.
		DISPLAY p_rec_addr.POBoxNumber TO POBoxNumber 				#		PO Box number
		DISPLAY p_rec_addr.Label TO Label											#		The full address formatted as a label.
		DISPLAY p_rec_addr.type TO loqate_type		 						#		The type of address if known.
		DISPLAY p_rec_addr.DataLevel TO DataLevel							#		The data level if known - depends on the data set the address originates from.
		DISPLAY p_rec_addr.Field1 TO Field1						 				#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		DISPLAY p_rec_addr.Field2 TO Field2						 			#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		DISPLAY p_rec_addr.Field3 TO Field3						 			#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		DISPLAY p_rec_addr.Field4 TO Field4						 			#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		DISPLAY p_rec_addr.Field5 TO Field5						 			#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		DISPLAY p_rec_addr.Field6 TO Field6						 			#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		DISPLAY p_rec_addr.Field7 TO Field7						 			#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		DISPLAY p_rec_addr.Field8 TO Field8						 			#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		DISPLAY p_rec_addr.Field9 TO Field9						 			#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		DISPLAY p_rec_addr.Field10 TO Field10						 		#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		DISPLAY p_rec_addr.Field11 TO Field11						 		#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		DISPLAY p_rec_addr.Field12 TO Field12						 		#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		DISPLAY p_rec_addr.Field13 TO Field13						 		#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		#DISPLAY p_rec_addr.Field14 TO Field14						 		#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		#DISPLAY p_rec_addr.Field15 TO Field15						 		#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		#DISPLAY p_rec_addr.Field16 TO Field16						 		#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		#DISPLAY p_rec_addr.Field17 TO Field17						 		#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		#DISPLAY p_rec_addr.Field18 TO Field18						 		#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		#DISPLAY p_rec_addr.Field19 TO Field19						 		#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
		#DISPLAY p_rec_addr.Field20 TO Field20						 		#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.

		MENU
			ON ACTION ACCEPT
				EXIT MENU
		END MENU
		CLOSE WINDOW w_address
	END IF
	
	RETURN l_rec_cust_addr.*
END FUNCTION
#####################################################################################
# END FUNCTION morph_address_to_cust_address(p_rec_addr)
#####################################################################################

{
#####################################################################################
# FUNCTION wapi_address_init(p_rec_param)
#
# RETURN p_rec_param.*
#####################################################################################
FUNCTION wapi_address_init(p_rec_param)
	DEFINE p_rec_param OF dt_rec_wapi_loqate_param
	
	IF p_rec_param.license_key IS NULL THEN
		LET p_rec_param.license_key = "CB99-MF88-XZ97-NJ73" #The key used to authenticate with the service. "CB99-MF88-XZ97-NJ73" "ZZ99-JB69-EP69-WR53"
	END IF
	
	#LET p_rec_param.text = "M308BR" 				#The search text to find. Ideally a postcode or the start of the address.
	#LET p_rec_param.container = NULL 				#A container for the search. This should only be another Id previously returned from this service when the Type of the result was not 'Address'.
	#LET p_rec_param.origin = "GB"						#A starting location for the search. This can be the name or ISO 2 or 3 character code of a country, WGS84 coordinates (comma separated) or IP address to search from.
	#LET p_rec_param.countries = NULL #"GB" 				#A comma separated list of ISO 2 or 3 character country codes to limit the search within.
	#LET p_rec_param.language = "ENG" 				#The preferred language for results. This should be a 2 or 4 character language code e.g. (en, fr, en-gb, en-us etc).
	IF p_rec_param.limit == 0 THEN
		LET p_rec_param.limit = 500 						#The maximum number of results to return.
	END IF
	LET p_rec_param.IsMiddleware = TRUE			#Whether the API is being called from a middleware implementation (and therefore the calling IP address should not be used for biasing). 
	LET p_rec_param.Bias = FALSE 						#Enable/Disable biasing
	LET p_rec_param.Filters = FALSE 					#V4 Shadowterms
	LET p_rec_param.GeoFence = FALSE 				#V4 GeoFence

	RETURN p_rec_param.*
END FUNCTION
#####################################################################################
# END FUNCTION wapi_address_init(p_rec_param)
#####################################################################################
}