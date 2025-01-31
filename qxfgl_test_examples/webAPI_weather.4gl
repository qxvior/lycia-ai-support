##############################################################################################
# FUNCTION GetWeather
#
# web service stub to invoke the web service operation, GetWeather
#
# URL               : http://www.webservicex.net/globalweather.asmx
# Binding           : null
# Address Style     : SOAP1.2
#
# Input Parameters  :
#   CityName  VARCHAR(255),
#   CountryName  VARCHAR(255)
# Output parameters : 
#   GetWeatherResult  VARCHAR(255)
#
# 
##############################################################################################

##############################################################################################
# FUNCTION GetCitiesByCountry
#
# web service stub to invoke the web service operation, GetCitiesByCountry
#
# URL               : http://www.webservicex.net/globalweather.asmx
# Binding           : null
# Address Style     : SOAP1.2
#
# Input Parameters  :
#   CountryName  VARCHAR(255)
# Output parameters : 
#   GetCitiesByCountryResult  VARCHAR(255)
#
# 
##############################################################################################

FUNCTION GetCitiesByCountry(input_record)

  DEFINE  input_record  RECORD
    CountryName  VARCHAR(255)
  END  RECORD

  DEFINE  output_record  RECORD
    GetCitiesByCountryResult  VARCHAR(255)
  END  RECORD

#  CALL fgl_wsdl_load("/home/mdata/testapp2/globalweather.asmx.xml")
  CALL fgl_wsdl_load("xml/globalweather.asmx.xml")
  CALL fgl_ws_create(
    "GetCitiesByCountry_handle",
    "GlobalWeather",
    "GlobalWeatherSoap12",
    "GetCitiesByCountry")

  CALL fgl_ws_setparameters("GetCitiesByCountry_handle",input_record.*)

  IF NOT fgl_ws_execute("GetCitiesByCountry_handle") THEN
    DISPLAY "ERROR CODE:\n", fgl_ws_error("GetCitiesByCountry_handle", "code")
    DISPLAY "ERROR DESCRIPTION:\n", fgl_ws_error("GetCitiesByCountry_handle", "reason")
    DISPLAY "ERROR DETAIL:\n", fgl_ws_error("GetCitiesByCountry_handle", "detail")
  ELSE
    CALL fgl_ws_getdata("GetCitiesByCountry_handle")
      RETURNING output_record.*
  END IF

  CALL fgl_ws_close("GetCitiesByCountry_handle")

  RETURN output_record.*

END FUNCTION

