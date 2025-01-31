	DEFINE arrAddressRec DYNAMIC ARRAY OF
		RECORD
			address1, address2, address3, city, poCode, state, country STRING
		END RECORD

	DEFINE arrIndex SMALLINT


################################################################################
# MAIN
#
#
################################################################################
MAIN
	CALL ui_init()
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	#DEFINE i SMALLINT	

	LET arrIndex = 1
	
	LET arrAddressRec[1].* = "Empire State Building","350 5th Ave",   "",                       "New York", "10118",  "NY",            "USA" 		
	LET arrAddressRec[2].* = "Hofbräuhaus",          "Platzl 9",      "",                       "Munich",   "80331",  "Bavaria",       "Germany"
	LET arrAddressRec[3].* = "Eifel Tower",          "Champ de Mars", "5 Avenue Anatole France","Paris",    "75007",  "Ile-de-France", "France" 	
	
	#LET arrAddressRec[1].address1 = "Empire State Building"
	#LET arrAddressRec[1].address2 = "350 5th Ave"
	#LET arrAddressRec[1].address3 = ""
	#LET arrAddressRec[1].city = "New York"	
	#LET arrAddressRec[1].poCode = "10118"	
	#LET arrAddressRec[1].state = "NY"	
	#LET arrAddressRec[1].country = "USA"	
	
	OPEN WINDOW myWin WITH FORM "form/wig_webComponent_googleMap"
	CALL fgl_settitle("Google Map WebComponent Demo")
	CALL ui.Interface.setText("Map")
		
	#DISPLAY "Hofbräuhaus,  Platzl 9,  80331,  München,  Bavaria,  Germany" TO wcGoogleMap
	--input by name arrAddressRec[arrIndex].address1
	#CALL fgl_getkey()
	
	#LET i = 1
WHILE TRUE
	INPUT BY NAME arrAddressRec[arrIndex].* WITHOUT DEFAULTS attribute(unbuffered)
		BEFORE INPUT
			CALL dialog.setActionHidden("ACCEPT",TRUE)
			DISPLAY addressLine() TO wcGoogleMap
			DISPLAY addressLine() TO wcGoogleMapString
						
		ON CHANGE arrAddressRec[arrIndex].*
			DISPLAY addressLine() TO wcGoogleMap
			DISPLAY addressLine() TO wcGoogleMapString
	
		ON ACTION "Update"
			DISPLAY addressLine() TO wcGoogleMap
			DISPLAY addressLine() TO wcGoogleMapString		
	
		ON ACTION "Next"
			CALL switchAddress()	
			EXIT INPUT	

		ON ACTION "HELP"
  		CALL onlineHelp("Webcomponent",NULL)
  								
		ON ACTION "CANCEL"
			EXIT WHILE
	END INPUT
	END WHILE
	
END MAIN


################################################################################
# FUNCTION addressLine()
#
#
################################################################################
FUNCTION addressLine()
	DEFINE x  SMALLINT	
	DEFINE addressString STRING
	
				
	IF arrAddressRec[arrIndex].address1.Trim().GetLength() <> 0 THEN
		LET addressString = arrAddressRec[arrIndex].address1
	END IF
	
	IF arrAddressRec[arrIndex].address2.Trim().GetLength() <> 0 THEN
		LET addressString = addressString, ",", arrAddressRec[arrIndex].address2
	END IF

	IF arrAddressRec[arrIndex].address3.Trim().GetLength() <> 0 THEN
		LET addressString = addressString, ",", arrAddressRec[arrIndex].address3
	END IF

	IF arrAddressRec[arrIndex].city.Trim().GetLength() <> 0 THEN
		LET addressString = addressString, ",", arrAddressRec[arrIndex].city
	END IF


	IF arrAddressRec[arrIndex].poCode.Trim().GetLength() <> 0 THEN
		LET addressString = addressString, ",", arrAddressRec[arrIndex].poCode
	END IF


	IF arrAddressRec[arrIndex].state.Trim().GetLength() <> 0 THEN
		LET addressString = addressString, ",", arrAddressRec[arrIndex].state
	END IF


	IF arrAddressRec[arrIndex].country.Trim().GetLength() <> 0 THEN
		LET addressString = addressString, ",", arrAddressRec[arrIndex].country
	END IF
	
	RETURN addressString
END FUNCTION 


################################################################################
# FUNCTION switchAddress()
#
#
################################################################################
FUNCTION switchAddress()
	IF arrIndex < 3 THEN
		LET arrIndex = arrIndex + 1
	ELSE
		LET arrIndex = 1
	END IF
END FUNCTION		
		