GLOBALS


#Structure of FIND return
DEFINE dt_arr_rec_short_addr TYPE AS DYNAMIC ARRAY OF RECORD
	id STRING,
	type STRING,  #Address, Postcode (may be others too)
	text STRING,
	highlight STRING,
	description STRING
END RECORD

#Structure of api.retrieve() Full Address & Other Details
DEFINE dt_rec_loqate_addr TYPE AS RECORD
	id STRING,										#The unique Id of the address.
	domesticId	STRING,						#The unique Id of the address as it appears in its respective dataset.
	language	STRING, 						#The language of the address.
	languageAlternatives	STRING, #Alternative languages for the address.
	Department	STRING, 					#Department name.
	Company	STRING, 							#Company name.
	SubBuilding	STRING, 					#The name of the sub building (e.g. flat, unit).
	BuildingNumber	STRING, 			#The number of building.
	BuildingName	STRING, 				#The associated name of the building.
	SecondaryStreet	STRING, 			#The secondary thoroughfare name. Usually a small street off the primary.
	Street	STRING, 							#		The main thoroughfare name.
	Block	STRING, 								#		The block details for the address.
	Neighbourhood	STRING, 				#		The neighbourhood the address is in.
	District	STRING, 						#		District name.
	City	STRING, 								#		City name.
	Line1	STRING, 								#		The first line of the formatted address.
	Line2	STRING, 								#		The second line of the formatted address.
	Line3	STRING, 								#		The third line of the formatted address.
	Line4	STRING, 								#		The fourth line of the formatted address.
	Line5	STRING, 								#		The fifth line of the formatted address.
	AdminAreaName	STRING, 				#		The name of the administrative area for the address.
	AdminAreaCode	STRING,					#		The code of the administrative area for the address.
	Province	STRING, 						#		Province / county.
	ProvinceName	STRING, 				#		Province / county.
	ProvinceCode	STRING, 				#		Associated province code.
	PostalCode	STRING, 					#		Postal code.
	CountryName	STRING, 				#		Name of the country the address is in.
	CountryIso2	STRING, 				#		2 character ISO code for the country.
	CountryIso3	STRING, 				#		3 character ISO code for the country.
	CountryIsoNumber	STRING, 				#		ISO numeric code for the country.
	SortingNumber1	STRING, 				#	
	SortingNumber2	STRING, 				#	
	Barcode	STRING, 				#		The barcode for the addres - needs to be used with an appropriate barcode font.
	POBoxNumber	STRING, 				#		PO Box number
	Label	STRING, 				#		The full address formatted as a label.
	type	STRING, 				#		The type of address if known.
	DataLevel	STRING, 				#		The data level if known - depends on the data set the address originates from.
	Field1	STRING, 				#		The data from the field requested to appear here, otherwise blank. Similar for all FieldX responses.
	Field2	STRING, 				#
	Field3	STRING, 				#
	Field4	STRING, 				#
	Field5	STRING, 				#
	Field6	STRING, 				#
	Field7	STRING, 				#
	Field8	STRING, 				#
	Field9	STRING, 				#
	Field10	STRING, 				#
	Field11	STRING, 				#
	Field12	STRING, 				#
	Field13	STRING, 				#
	Field14	STRING, 				#
	Field15	STRING, 				#
	Field16	STRING, 				#
	Field17	STRING, 				#
	Field18	STRING, 				#
	Field19	STRING, 				#
	Field20	STRING	 				#

END RECORD
							                

#Structure of API call parameters including 3
DEFINE dt_rec_wapi_loqate_param TYPE AS RECORD
		text STRING,					#"text1|text2|text3" The search text to find. Ideally a postcode or the start of the address.
#		text1 STRING,					#The search text1 to find. Ideally a postcode or the start of the address.
#		text2 STRING,					#The search text2 to find. Ideally a postcode or the start of the address.
#		text3 STRING,					#The search text3 to find. Ideally a postcode or the start of the address.
#		text4 STRING,					#The search text4 to find. Ideally a postcode or the start of the address.

		origin STRING,				#A starting location for the search. This can be the name or ISO 2 or 3 character code of a country, WGS84 coordinates (comma separated) or IP address to search from.
		countries STRING, 		#A comma separated list of ISO 2 or 3 character country codes to limit the search within.
		language STRING,			#The preferred language for results. This should be a 2 or 4 character language code e.g. (en, fr, en-gb, en-us etc).
		limit SMALLINT,				#The maximum number of results to return.
		license_key STRING,		#The key used to authenticate with the service
		container STRING, 		#A container for the search. This should only be another Id previously returned from this service when the Type of the result was not 'Address'.
		isMiddleWare BOOLEAN,	#Whether the API is being called from a middleware implementation (and therefore the calling IP address should not be used for biasing).
		bias BOOLEAN,					#Enable/Disable biasing
		filters STRING,				#V4 Shadowterms
		geoFence STRING				#V4 GeoFence

END RECORD


#Structure of API call parameters including 3
DEFINE dt_rec_search TYPE AS RECORD
		text1 STRING,					#The search text1 to find. Ideally a postcode or the start of the address.
		text2 STRING,					#The search text2 to find. Ideally a postcode or the start of the address.
		text3 STRING,					#The search text3 to find. Ideally a postcode or the start of the address.
		text4 STRING					#The search text4 to find. Ideally a postcode or the start of the address.
END RECORD

DEFINE gl_count_find SMALLINT
DEFINE gl_count_retrieve SMALLINT

END GLOBALS