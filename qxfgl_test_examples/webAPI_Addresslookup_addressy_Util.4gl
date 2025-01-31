#####################################################################################
# GLOBAL SCOPE VARIABLES
#####################################################################################
DEFINE dt_rec_search TYPE AS RECORD
		text1 STRING,					#The search text1 to find. Ideally a postcode or the start of the address.
		text2 STRING,					#The search text2 to find. Ideally a postcode or the start of the address.
		text3 STRING,					#The search text3 to find. Ideally a postcode or the start of the address.
		text4 STRING					#The search text4 to find. Ideally a postcode or the start of the address.
END RECORD

DEFINE gl_count_find SMALLINT
DEFINE gl_count_retrieve SMALLINT

#####################################################################################
# MAIN
#
#
#####################################################################################
MAIN
  DEFINE l_idx SMALLINT #array index
  DEFINE l_rec_param OF util_address_search_input               # API call parameters inc. post code search string and loqate license key
  DEFINE l_rec_addr OF util_address_retrieve_output             # Final field based Address
  DEFINE l_arr_rec_addr OF util_address_search_output           # List of ALL postCodes/Addresses Return
  DEFINE l_rec_search OF dt_rec_search                          # Search string segments (user doesn't need to enter pipe symbols)
  DEFINE l_arr_rec_addr_filtered OF util_address_search_output  # List of postCodes/Addresses Return AFTER filter is applied
  DEFINE l_filter_type CHAR                                     # Find returns an rec-array with addresses and postCodes - filter allows the user to control the find result/list
  DEFINE l_retrieve_address_id STRING                           # Address Identifier  found/returned by FIND -> web.Request.get("https://api.addressy.com/Capture/Interactive/Find/v1.1/json.ws")
  DEFINE l_ready BOOLEAN                                        # Trigger FIND/RESULT API call only if true

  OPTIONS INPUT WRAP

  DEFER INTERRUPT

  # INIT
  CALL init_param() RETURNING l_rec_param.*  # Initialise WEB-API parameters
  LET l_filter_type = "N"                    # None / no filter by default

  OPEN WINDOW w_addressManager WITH FORM "form/webAPI_AddressLookup_addressy_Util"

  DIALOG ATTRIBUTE(UNBUFFERED)

    # Main Search Text -------------------------------------------------------
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

    # Additonal Search Criteria and Parameters --------------------------------
    INPUT
      l_rec_param.text,
      l_rec_param.origin,
      l_rec_param.countries,
      l_rec_param.language,
      l_rec_param.limit,
      l_rec_param.key
    WITHOUT DEFAULTS
    FROM
      text,
      origin,
      countries,
      language,
      limit,
      license_key
    END INPUT

    # Filter for initial search/drill down ------------------------------------
    INPUT l_filter_type WITHOUT DEFAULTS FROM filter_type
      ON CHANGE filter_type
        CALL filter_data_array(l_filter_type, l_arr_rec_addr) RETURNING l_arr_rec_addr_filtered

    END INPUT

    # Display list of inital found addresses  ----------------------------------
    DISPLAY ARRAY l_arr_rec_addr_filtered TO scr_response.*
      BEFORE ROW
        LET l_idx = arr_curr()
        IF l_idx > 0 THEN
          LET l_retrieve_address_id = l_arr_rec_addr_filtered[l_idx].id
        ELSE
          LET l_retrieve_address_id = NULL
        END IF

      ON ACTION ("DOUBLECLICK")
        LET l_idx = arr_curr()
        IF l_idx > 0 THEN
          DISPLAY l_arr_rec_addr_filtered[l_idx].id TO container #only used to drill down search i.e. resolve destrict or PostCode group/list
          CASE l_arr_rec_addr_filtered[l_idx].type
            WHEN "Postcode"
              CALL show_search_result_list(l_rec_param.key, l_arr_rec_addr_filtered[l_idx].id) RETURNING l_arr_rec_addr_filtered
              IF l_arr_rec_addr_filtered.getSize() == 1 AND l_arr_rec_addr_filtered[1].type = "Address" THEN
                CALL retrieve_address(l_rec_param.key, l_arr_rec_addr_filtered[1].id) RETURNING l_rec_addr.*
                CALL display_address(l_rec_addr.*)
              END IF

            WHEN "Address"
              CALL retrieve_address(l_rec_param.key, l_arr_rec_addr_filtered[l_idx].id) RETURNING l_rec_addr.*
              CALL display_address(l_rec_addr.*)

            WHEN "District"
              CALL show_search_result_list(l_rec_param.key, l_arr_rec_addr_filtered[l_idx].id) RETURNING l_arr_rec_addr_filtered
              IF l_arr_rec_addr_filtered.getSize() == 1 AND l_arr_rec_addr_filtered[1].type = "Address" THEN
                CALL retrieve_address(l_rec_param.key, l_arr_rec_addr_filtered[1].id) RETURNING l_rec_addr.*
                CALL display_address(l_rec_addr.*)
              END IF

          END CASE
        END IF

    END DISPLAY


    # DIALOG ACTIONS ---------------------------------------------------------------------------

    ON ACTION "RESULT"
      CALL retrieve_address(l_rec_param.key, l_retrieve_address_id)

    ON ACTION "SEARCH"
      LET l_ready = TRUE

    ON IDLE 1 # Action IDLE
      IF l_ready == TRUE THEN
        CALL form_search_text(l_rec_search.*) RETURNING l_rec_param.text
         LET l_retrieve_address_id = NULL  # Initialise l_retrieve_address_id from possible previous search result

        IF l_rec_param.text IS NOT NULL THEN
          CALL search(l_rec_param.*) RETURNING l_arr_rec_addr, l_rec_addr.*
          CALL filter_data_array(l_filter_type, l_arr_rec_addr) RETURNING l_arr_rec_addr_filtered
          LET l_ready = FALSE
        END IF
      END IF

    # EXIT ------------------------------------------
    ON ACTION "CANCEL"
      EXIT DIALOG
  END DIALOG

  CLOSE WINDOW w_addressManager
END MAIN
#####################################################################################
# END MAIN
#####################################################################################


#####################################################################################
# FUNCTION form_search_text(p_rec_search)
#
#
#####################################################################################
FUNCTION form_search_text(p_rec_search)
  DEFINE p_rec_search OF dt_rec_search # Search string segments (user doesn't need to enter pipe symbols)
  DEFINE l_ret_tmp_str STRING
  DEFINE l_regex_replace util.REGEX    # REPLACE

  IF p_rec_search.text1 IS NOT NULL THEN
    LET l_ret_tmp_str = trim(p_rec_search.text1)
  END IF

  IF p_rec_search.text2 IS NOT NULL THEN
    IF l_ret_tmp_str IS NULL THEN
      LET l_ret_tmp_str = p_rec_search.text2
    ELSE
      LET l_ret_tmp_str = "|", trim(l_ret_tmp_str)
    END IF
  END IF

  IF p_rec_search.text3 IS NOT NULL THEN
    IF l_ret_tmp_str IS NULL THEN
      LET l_ret_tmp_str = p_rec_search.text3
    ELSE
      LET l_ret_tmp_str = "|", trim(l_ret_tmp_str)
    END IF
  END IF

  IF p_rec_search.text4 IS NOT NULL THEN
    IF l_ret_tmp_str IS NULL THEN
      LET l_ret_tmp_str = p_rec_search.text4
    ELSE
      LET l_ret_tmp_str = "|", trim(l_ret_tmp_str)
    END IF
  END IF

  LET l_regex_replace = / /g
  CALL util.REGEX.replace(l_ret_tmp_str, l_regex_replace, "|") RETURNING l_ret_tmp_str

  RETURN l_ret_tmp_str # New value for rec_param.text
END FUNCTION
#####################################################################################
# END FUNCTION form_search_text(p_rec_param)
#####################################################################################


#####################################################################################
# FUNCTION search(p_rec_param)
#
#
#####################################################################################
FUNCTION search(p_rec_param)
  DEFINE p_rec_param OF util_address_search_input        # API call parameters inc. post code search string and loqate license key
  DEFINE l_arr_rec_addr OF util_address_search_output
  DEFINE l_filter_type CHAR
  DEFINE l_rec_addr OF util_address_retrieve_output      # Final field based Address

  # Reset previous address retrieve result
  INITIALIZE l_rec_addr TO NULL
  CALL display_address(l_rec_addr.*)
  
  # Fire off service request
  LET gl_count_find = gl_count_find + 1
  DISPLAY gl_count_find TO count_find

  CALL util_address_search(p_rec_param.*) RETURNING l_arr_rec_addr
  DISPLAY "####################SEARCH#########################3"
  DISPLAY p_rec_param
  DISPLAY "####################SEARCH#########################3"
  DISPLAY l_arr_rec_addr
  DISPLAY l_arr_rec_addr.getSize() TO find_count

  # IF return is single address, retrieve it
  IF (l_arr_rec_addr.getSize() == 1) # Only one PostCode/Address.. skip next step and show address instantly
  AND (l_arr_rec_addr[1].type == "Address") THEN
    CALL retrieve_address(p_rec_param.key, l_arr_rec_addr[1].id) RETURNING l_rec_addr.*
    CALL display_address(l_rec_addr.*)
  END IF

  RETURN l_arr_rec_addr, l_rec_addr.*
END FUNCTION
#####################################################################################
# END FUNCTION search(p_rec_param)
#####################################################################################


#####################################################################################
# FUNCTION show_search_result_list(p_license_key, p_id)
#
#
#####################################################################################
FUNCTION show_search_result_list(p_license_key, p_id)
  DEFINE p_license_key, p_id STRING
  DEFINE l_search_input OF util_address_search_input

  LET gl_count_find = gl_count_find + 1
  DISPLAY gl_count_find TO count_find

  LET l_search_input.Key = p_license_key
  LET l_search_input.Container = p_id

  RETURN util_address_search(l_search_input.*)
END FUNCTION
#####################################################################################
# END FUNCTION show_search_result_list(p_license_key, p_id)
#####################################################################################


#####################################################################################
# FUNCTION retrieve_address(p_license_key, p_address_id)
#
#
#####################################################################################
FUNCTION retrieve_address(p_license_key, p_address_id)
  DEFINE p_license_key, p_address_id STRING
  DEFINE ret_l_arr_rec_addr OF util_address_retrieve_output

  LET gl_count_retrieve = gl_count_retrieve + 1
  DISPLAY gl_count_retrieve TO count_retrieve

  CALL util_address_retrieve(p_license_key, p_address_id) RETURNING ret_l_arr_rec_addr.*
  DISPLAY "#############################retrieve#######################################"
  DISPLAY p_license_key,"|", p_address_id
  DISPLAY ret_l_arr_rec_addr
  RETURN ret_l_arr_rec_addr.*
END FUNCTION
#####################################################################################
# END FUNCTION retrieve_address(p_license_key, p_address_id)
#####################################################################################


#####################################################################################
# FUNCTION filter_data_array(p_filter_type, p_arr_rec_addr_complete)
#
#
#####################################################################################
FUNCTION filter_data_array(p_filter_type, p_arr_rec_addr_complete)
  DEFINE p_filter_type CHAR
  DEFINE p_arr_rec_addr_complete OF util_address_search_output
  DEFINE ret_l_arr_rec_addr_filtered OF util_address_search_output
  DEFINE l_filter STRING
  DEFINE i SMALLINT

  LET ret_l_arr_rec_addr_filtered = p_arr_rec_addr_complete

  IF p_filter_type == "P" OR p_filter_type == "A" THEN

    CASE p_filter_type
      WHEN "P"
        LET l_filter = "Postcode"
      WHEN "D"
        LET l_filter = "District"
      WHEN "A"
        LET l_filter = "Address"
    END CASE

    FOR i = 1 TO p_arr_rec_addr_complete.getSize()
      IF ret_l_arr_rec_addr_filtered[i].type != l_filter THEN
        CALL ret_l_arr_rec_addr_filtered.delete(i)
        LET i = i-1
      END IF
    END FOR

  END IF

  RETURN ret_l_arr_rec_addr_filtered
END FUNCTION
#####################################################################################
# END FUNCTION filter_data_array(p_filter_type, p_arr_rec_addr_complete)
#####################################################################################


#####################################################################################
# FUNCTION init_param()
#
#
#####################################################################################
FUNCTION init_param()
  DEFINE l_rec_param OF util_address_search_input
  
  PROMPT "Enter your Loqate Addressy license key:" FOR l_rec_param.key 
  LET l_rec_param.limit        = 10                    # The maximum number of results to return.
  LET l_rec_param.IsMiddleware = TRUE                  # Whether the API is being called from a middleware implementation (and therefore the calling IP address should not be used for biasing).
  LET l_rec_param.Bias         = NULL                  # Enable/Disable biasing
  LET l_rec_param.Filters      = NULL                  # V4 Shadowterms
  LET l_rec_param.GeoFence     = NULL                  # V4 GeoFence

  #LET l_rec_param.text        = "M308BR"              # The search text to find. Ideally a postcode or the start of the address.
  #LET l_rec_param.container   = NULL                  # A container for the search. This should only be another Id previously returned from this service when the Type of the result was not 'Address'.
  #LET l_rec_param.origin      = "GB"                  # A starting location for the search. This can be the name or ISO 2 or 3 character code of a country, WGS84 coordinates (comma separated) or IP address to search from.
  #LET l_rec_param.countries   = NULL #"GB"            # A comma separated list of ISO 2 or 3 character country codes to limit the search within.
  #LET l_rec_param.language    = "ENG"                 # The preferred language for results. This should be a 2 or 4 character language code e.g. (en, fr, en-gb, en-us etc).
  
  RETURN l_rec_param.*
END FUNCTION
#####################################################################################
# END FUNCTION init_param()
#####################################################################################


#####################################################################################
# FUNCTION display_address(p_rec_addr)
#
#
#####################################################################################
FUNCTION display_address(p_rec_addr)
  DEFINE p_rec_addr OF util_address_retrieve_output  #Final field based Address

  DISPLAY p_rec_addr.id                   TO address_id           # The unique Id of the address.
  DISPLAY p_rec_addr.domesticId           TO domesticId           # The unique Id of the address as it appears in its respective dataset.
  DISPLAY p_rec_addr.language             TO address_language     # The language of the address.
  DISPLAY p_rec_addr.languageAlternatives TO languageAlternatives # Alternative languages for the address.
  DISPLAY p_rec_addr.Department           TO Department           # Department name.
  DISPLAY p_rec_addr.Company              TO Company              # Company name.
  DISPLAY p_rec_addr.SubBuilding          TO SubBuilding          # The name of the sub building (e.g. flat, unit).
  DISPLAY p_rec_addr.BuildingNumber       TO BuildingNumber       # The number of building.
  DISPLAY p_rec_addr.BuildingName         TO BuildingName         # The associated name of the building.
  DISPLAY p_rec_addr.SecondaryStreet      TO SecondaryStreet      # The secondary thoroughfare name. Usually a small street off the primary.
  DISPLAY p_rec_addr.Street               TO Street               # The main thoroughfare name.
  DISPLAY p_rec_addr.Block                TO Block                # The block details for the address.
  DISPLAY p_rec_addr.Neighbourhood        TO Neighbourhood        # The neighbourhood the address is in.
  DISPLAY p_rec_addr.District             TO District             # District name.
  DISPLAY p_rec_addr.City                 TO City                 # City name.
  DISPLAY p_rec_addr.Line1                TO Line1                # The first line of the formatted address.
  DISPLAY p_rec_addr.Line2                TO Line2                # The second line of the formatted address.
  DISPLAY p_rec_addr.Line3                TO Line3                # The third line of the formatted address.
  DISPLAY p_rec_addr.Line4                TO Line4                # The fourth line of the formatted address.
  DISPLAY p_rec_addr.Line5                TO Line5                # The fifth line of the formatted address.
  DISPLAY p_rec_addr.AdminAreaName        TO AdminAreaName        # The name of the administrative area for the address.
  DISPLAY p_rec_addr.AdminAreaCode        TO AdminAreaCode        # The code of the administrative area for the address.
  DISPLAY p_rec_addr.Province             TO Province             # Province / county.
  DISPLAY p_rec_addr.ProvinceName         TO ProvinceName         # Province / county.
  DISPLAY p_rec_addr.ProvinceCode         TO ProvinceCode         # Associated province code.
  DISPLAY p_rec_addr.PostalCode           TO PostalCode           # Postal code.
  DISPLAY p_rec_addr.CountryName          TO CountryName          # Name of the country the address is in.
  DISPLAY p_rec_addr.CountryIso2          TO CountryIso2          # 2 character ISO code for the country.
  DISPLAY p_rec_addr.CountryIso3          TO CountryIso3          # 3 character ISO code for the country.
  DISPLAY p_rec_addr.CountryIsoNumber     TO CountryIsoNumber     # ISO numeric code for the country.
  DISPLAY p_rec_addr.SortingNumber1       TO SortingNumber1       #
  DISPLAY p_rec_addr.SortingNumber2       TO SortingNumber2       #
  DISPLAY p_rec_addr.Barcode              TO Barcode              # The barcode for the addres - needs to be used with an appropriate barcode font.
  DISPLAY p_rec_addr.POBoxNumber          TO POBoxNumber          # PO Box number
  DISPLAY p_rec_addr.Label                TO Label                # The full address formatted as a label.
  DISPLAY p_rec_addr.type                 TO loqate_type          # The type of address if known.
  DISPLAY p_rec_addr.DataLevel            TO DataLevel            # The data level if known - depends on the data set the address originates from.
  DISPLAY p_rec_addr.Field1               TO Field1               # The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
  DISPLAY p_rec_addr.Field2               TO Field2               # The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
  DISPLAY p_rec_addr.Field3               TO Field3               # The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
  DISPLAY p_rec_addr.Field4               TO Field4               # The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
  DISPLAY p_rec_addr.Field5               TO Field5               # The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
  DISPLAY p_rec_addr.Field6               TO Field6               # The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
  DISPLAY p_rec_addr.Field7               TO Field7               # The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
  DISPLAY p_rec_addr.Field8               TO Field8               # The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
  DISPLAY p_rec_addr.Field9               TO Field9               # The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
  DISPLAY p_rec_addr.Field10              TO Field10              # The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
  DISPLAY p_rec_addr.Field11              TO Field11              # The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
  DISPLAY p_rec_addr.Field12              TO Field12              # The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
  DISPLAY p_rec_addr.Field13              TO Field13              # The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
END FUNCTION
#####################################################################################
# END FUNCTION display_address(p_rec_addr)
#####################################################################################