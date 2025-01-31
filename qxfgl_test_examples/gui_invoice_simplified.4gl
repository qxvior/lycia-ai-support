#####################################################################################
# GLOBAL SCOPE VARIABLES and custom DataTypes
#####################################################################################
GLOBALS "../4gl/_lib_web_api_address_lookup_globals.4gl"

################################################################################
# Module Scope Variables
################################################################################
DEFINE invRec 
	RECORD
		company, title, firstName, lastName STRING,
		customerType SMALLINT,
		newsletterAbbo BOOLEAN,
		poCode, invoiceNumber, customerNumber STRING,
		purchaseDate DATE,
		purchaseTime DATETIME hour to second,
		priority SMALLINT,
		invAddress1, invAddress2,invAddress3,invCity,invPostCode,invCountry STRING,
		delAddress1, delAddress2,delAddress3,delCity,delPostCode,delCountry STRING,
		notes STRING
	END RECORD


DEFINE invLineRec DYNAMIC ARRAY OF 
	RECORD
		invLineItem STRING,
		invLineItemPrice MONEY (6,2),
		invLineQuantity SMALLINT,
		invLineItemNetPrice MONEY (8,2),		
		invLineItemTaxPercent DECIMAL (3,2),
		invLineTaxAmount,invLineItemTotal MONEY (8,2)
	END RECORD

DEFINE invMapAddress, delMapAddress STRING
DEFINE invoiceAction STRING



################################################################################
# MAIN
#
#
################################################################################
MAIN
	DEFINE l_rec_wapi_loqate_param OF dt_rec_wapi_loqate_param	#loqate parameter record
	DEFINE l_rec_loqate_addr OF dt_rec_loqate_addr							#loqate address record
	DEFINE l_found_status BOOLEAN 															#IF address web api returned address or not / found address or not ...

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT
	
	CALL ui_init()
	CALL wapi_address_init(l_rec_wapi_loqate_param.*) RETURNING l_rec_wapi_loqate_param.*											#possiblity to set loqate parameters, otherwise, defaults will be used

	OPEN WINDOW mywin WITH FORM "form/gui_invoice_simplified" -- ATTRIBUTE(BORDER)
  CALL fgl_settitle("Invoice Simplified")
	CALL ui.Interface.setText("GUI Invoice")

	CALL initData()
	LET invoiceAction = "printInvoice"
	
	MENU
		ON ACTION "DISPLAY"
			DISPLAY BY NAME invMapAddress,delMapAddress
			CALL ui.interface.refresh()
			DISPLAY BY NAME invRec.*

		ON ACTION "HELP"
		  	CALL onlineHelp("GroupBox",NULL)
			   				
		ON ACTION "EDIT"
			DISPLAY BY NAME invMapAddress,delMapAddress	
			DIALOG ATTRIBUTE(UNBUFFERED)
			
				INPUT BY NAME invRec.* WITHOUT DEFAULTS
					BEFORE INPUT
						CALL dialog.setActionHidden("CANCEL",TRUE)
					
					ON ACTION "INV_ADRESS_LOOKUP"					
						LET l_rec_wapi_loqate_param.text = form_search_text(invRec.invAddress1,invRec.invAddress2,invRec.invAddress3,invRec.invCity,invRec.invPostCode,invRec.invCountry)
						CALL webAPI_address_get(l_rec_wapi_loqate_param.*) RETURNING l_rec_loqate_addr.*, l_found_status
						IF l_found_status THEN #address found/returned
							LET invRec.invAddress1 = l_rec_loqate_addr.line1
							LET invRec.invAddress2 = l_rec_loqate_addr.line2
							LET invRec.invAddress3 = l_rec_loqate_addr.line3
							LET invRec.invCity = l_rec_loqate_addr.city
							LET invRec.invPostCode = l_rec_loqate_addr.PostalCode
							LET invRec.invCountry = l_rec_loqate_addr.CountryName
							LET invMapAddress = getAddress(invRec.invAddress1,invRec.invAddress2,invRec.invAddress3,invRec.invCity,invRec.invPostCode,invRec.invCountry)
							DISPLAY invMapAddress TO invMapAddress
						END IF

					ON ACTION "INV_ADRESS_SEARCH"					
						LET l_rec_wapi_loqate_param.text = NULL
						CALL webAPI_address_get(l_rec_wapi_loqate_param.*) RETURNING l_rec_loqate_addr.*, l_found_status
						IF l_found_status THEN #address found/returned						
							LET invRec.invAddress1 = l_rec_loqate_addr.line1
							LET invRec.invAddress2 = l_rec_loqate_addr.line2
							LET invRec.invAddress3 = l_rec_loqate_addr.line3
							LET invRec.invCity = l_rec_loqate_addr.city
							LET invRec.invPostCode = l_rec_loqate_addr.PostalCode
							LET invRec.invCountry = l_rec_loqate_addr.CountryName
							LET invMapAddress = getAddress(invRec.invAddress1,invRec.invAddress2,invRec.invAddress3,invRec.invCity,invRec.invPostCode,invRec.invCountry)
							DISPLAY invMapAddress TO invMapAddress
						END IF
						
					ON ACTION "INV_ADRESS_CLEAR"
						LET invRec.invAddress1 = NULL
						LET invRec.invAddress2 = NULL
						LET invRec.invAddress3 = NULL
						LET invRec.invCity = NULL
						LET invRec.invPostCode = NULL
						LET invRec.invCountry = NULL

					ON ACTION "DEL_ADRESS_LOOKUP"
						LET l_rec_wapi_loqate_param.text = form_search_text(invRec.delAddress1,invRec.delAddress2,invRec.delAddress3,invRec.delPostCode,invRec.delCity,invRec.delCountry)
						CALL webAPI_address_get(l_rec_wapi_loqate_param.*) RETURNING l_rec_loqate_addr.*, l_found_status
						IF l_found_status THEN #address found/returned						
							LET invRec.delAddress1 = l_rec_loqate_addr.line1
							LET invRec.delAddress2 = l_rec_loqate_addr.line2
							LET invRec.delAddress3 = l_rec_loqate_addr.line3
							LET invRec.delCity = l_rec_loqate_addr.city
							LET invRec.delPostCode = l_rec_loqate_addr.PostalCode
							LET invRec.delCountry = l_rec_loqate_addr.CountryName
							LET delMapAddress = getAddress(invRec.delAddress1,invRec.delAddress2,invRec.delAddress3,invRec.delCity,invRec.delPostCode,invRec.delCountry)
							DISPLAY delMapAddress TO delMapAddress
						END IF

					ON ACTION "DEL_ADRESS_SEARCH"
						LET l_rec_wapi_loqate_param.text = NULL
						CALL webAPI_address_get(l_rec_wapi_loqate_param.*) RETURNING l_rec_loqate_addr.*, l_found_status
						IF l_found_status THEN #address found/returned
							LET invRec.delAddress1 = l_rec_loqate_addr.line1
							LET invRec.delAddress2 = l_rec_loqate_addr.line2
							LET invRec.delAddress3 = l_rec_loqate_addr.line3
							LET invRec.delCity = l_rec_loqate_addr.city
							LET invRec.delPostCode = l_rec_loqate_addr.PostalCode
							LET invRec.delCountry = l_rec_loqate_addr.CountryName
							LET delMapAddress = getAddress(invRec.delAddress1,invRec.delAddress2,invRec.delAddress3,invRec.delCity,invRec.delPostCode,invRec.delCountry)
							DISPLAY delMapAddress TO delMapAddress
						END IF
												
					ON ACTION "DEL_ADRESS_CLEAR"
						LET invRec.delAddress1 = NULL
						LET invRec.delAddress2 = NULL
						LET invRec.delAddress3 = NULL
						LET invRec.delCity = NULL
						LET invRec.delPostCode = NULL
						LET invRec.delCountry = NULL

	
					ON CHANGE invAddress1,invAddress2,invAddress3,invCity,invPostCode,invCountry
						LET invMapAddress = getAddress(invRec.invAddress1,invRec.invAddress2,invRec.invAddress3,invRec.invCity,invRec.invPostCode,invRec.invCountry)
						DISPLAY invMapAddress
			
					ON CHANGE delAddress1,delAddress2,delAddress3,delCity,delPostCode,delCountry   
						DISPLAY BY NAME delMapAddress
						LET delMapAddress = getAddress(invRec.delAddress1,invRec.delAddress2,invRec.delAddress3,invRec.delCity,invRec.delPostCode,invRec.delCountry)
									
				END INPUT
			
				INPUT ARRAY invLineRec FROM scrInvoice.*
			
				END INPUT
			
				INPUT BY NAME invoiceAction WITHOUT DEFAULTS
					#ON CHANGE invoiceAction
					#	CALL invoiceAction(invoiceAction)
					#ON ACTION ("ACCEPT")
					#CALL invoiceAction(invoiceAction)
					#CONTINUE INPUT
						
				END INPUT

				ON ACTION ("INVOKE_MENU_CHOICE")
					CALL invoiceAction(invoiceAction)				
				
				ON ACTION "HELP"
			   	CALL onlineHelp("GroupBox",NULL)
			
				ON ACTION "EXIT"
					EXIT DIALOG
					
			END DIALOG

		ON ACTION "EXIT"
			EXIT MENU
	END MENU

END MAIN	
################################################################################
# END MAIN
################################################################################


################################################################################
# FUNCTION invoiceAction(pInvoiceAction)
#
#
################################################################################
FUNCTION invoiceAction(pInvoiceAction)
	DEFINE pInvoiceAction STRING
	
	CASE pInvoiceAction
		WHEN "printInvoice"
			CALL fgl_winmessage("Print invoice","Print invoice","info")
	
		WHEN "addWareHouse"
			CALL fgl_winmessage("Add Warehouse items","Add Warehouse items","info")
		WHEN "deliveryStatus"
			CALL fgl_winmessage("Change Delivery Status","Change Delivery Status","info")
		WHEN "freeCustomerAccount"
			CALL fgl_winmessage("Freeze Customer Account","Freeze Customer Account","info")
		WHEN "chargeFine"
			CALL fgl_winmessage("Charge fine","Charge fine","info")
	
	END CASE
	
END FUNCTION
################################################################################
# END FUNCTION invoiceAction(pInvoiceAction)
################################################################################


################################################################################
# FUNCTION initData()
#
#
################################################################################
FUNCTION initData()
	DEFINE i SMALLINT

	LET invRec.company = "Supernova Plc"
	LET invRec.title = "Mr."
	LET invRec.firstName = "Christopher"
	LET invRec.lastName = "Rose"
	LET invRec.customerType = 2	
	LET invRec.newsLetterAbbo = TRUE
	LET invRec.poCode = "RES-8129"
	LET invRec.invoiceNumber = "DE-25243-129"		
	LET invRec.customerNumber = "SUPERN-01"		
	LET invRec.purchaseDate = MDY(12,24,2019)
	LET invRec.purchaseTime = "16:45:00"
	LET invRec.priority = 8
	
	LET invRec.invAddress1 = "Empire State Building"
	LET invRec.invAddress2 = "350 5th Ave"
	LET invRec.invAddress3 = ""
	LET invRec.invCity = "New York"		
	LET invRec.invPostCode = "10118"		
	LET invRec.invCountry = "USA"		
	
	LET invRec.delAddress1 = "Hofbräuhaus"
	LET invRec.delAddress2 = "Platzl 9"
	LET invRec.delAddress3 = ""
	LET invRec.delCity = "Munich"
	LET invRec.delPostCode = "80331"		
	LET invRec.delCountry = "Germany"		


	LET invMapAddress = getAddress(invRec.invAddress1,invRec.invAddress2,invRec.invAddress3,invRec.invCity,invRec.invPostCode,invRec.invCountry)
	LET delMapAddress = getAddress(invRec.delAddress1,invRec.delAddress2,invRec.delAddress3,invRec.delCity,invRec.delPostCode,invRec.delCountry)


	LET invRec.notes = "This is just a dummy text note example. ABCDEFGHIJKLMNOPQRSTUVWXYZ ÖöÜüÄäß !§$%&/()=?`"		
	FOR i = 1 TO 7
		LET invRec.notes = invRec.notes, "\n",  invRec.notes 	
	END FOR
	
	
	LET i = 1
	LET invLineRec[i].invLineItem = "BCWF20x40"
	LET invLineRec[i].invLineItemPrice = 162.92
	LET invLineRec[i].invLineQuantity = 5
	LET invLineRec[i].invLineItemNetPrice = invLineRec[i].invLineItemPrice * invLineRec[i].invLineQuantity
	LET invLineRec[i].invLineItemTaxPercent = 0.19
	LET invLineRec[i].invLineTaxAmount 	= invLineRec[i].invLineQuantity * invLineRec[i].invLineItemPrice * invLineRec[i].invLineItemTaxPercent
	LET invLineRec[i].invLineItemTotal = 	invLineRec[i].invLineQuantity * invLineRec[i].invLineItemPrice * (1+invLineRec[i].invLineItemTaxPercent)	

	LET i = i+ 1
	LET invLineRec[i].invLineItem = "SNCB-8"
	LET invLineRec[i].invLineItemPrice = 231.15
	LET invLineRec[i].invLineQuantity = 13
	LET invLineRec[i].invLineItemNetPrice = invLineRec[i].invLineItemPrice * invLineRec[i].invLineQuantity
	LET invLineRec[i].invLineItemTaxPercent = 0.19
	LET invLineRec[i].invLineTaxAmount 	= invLineRec[i].invLineQuantity * invLineRec[i].invLineItemPrice * invLineRec[i].invLineItemTaxPercent
	LET invLineRec[i].invLineItemTotal = 	invLineRec[i].invLineQuantity * invLineRec[i].invLineItemPrice * (1+invLineRec[i].invLineItemTaxPercent)	

	LET i = i+ 1
	LET invLineRec[i].invLineItem = "SNCB-5"
	LET invLineRec[i].invLineItemPrice = 196.23
	LET invLineRec[i].invLineQuantity = 24
	LET invLineRec[i].invLineItemNetPrice = invLineRec[i].invLineItemPrice * invLineRec[i].invLineQuantity	
	LET invLineRec[i].invLineItemTaxPercent = 0.19
	LET invLineRec[i].invLineTaxAmount 	= invLineRec[i].invLineQuantity * invLineRec[i].invLineItemPrice * invLineRec[i].invLineItemTaxPercent
	LET invLineRec[i].invLineItemTotal = 	invLineRec[i].invLineQuantity * invLineRec[i].invLineItemPrice * (1+invLineRec[i].invLineItemTaxPercent)	


	LET i = i+ 1
	LET invLineRec[i].invLineItem = "SNCB-2"
	LET invLineRec[i].invLineItemPrice = 146.72
	LET invLineRec[i].invLineQuantity = 12
	LET invLineRec[i].invLineItemNetPrice = invLineRec[i].invLineItemPrice * invLineRec[i].invLineQuantity	
	LET invLineRec[i].invLineItemTaxPercent = 0.19
	LET invLineRec[i].invLineTaxAmount 	= invLineRec[i].invLineQuantity * invLineRec[i].invLineItemPrice * invLineRec[i].invLineItemTaxPercent
	LET invLineRec[i].invLineItemTotal = 	invLineRec[i].invLineQuantity * invLineRec[i].invLineItemPrice * (1+invLineRec[i].invLineItemTaxPercent)	


	CALL ui.ComboBox.ForName("invLineItem").addItem("BCWF20x40","Britisch Coffee Waterfilter 20x40")
	CALL ui.ComboBox.ForName("invLineItem").addItem("BCWF25x40","Britisch Coffee Waterfilter 25x40")
	CALL ui.ComboBox.ForName("invLineItem").addItem("BCWF30x40","Britisch Coffee Waterfilter 30x40")
	CALL ui.ComboBox.ForName("invLineItem").addItem("BCWF40x40","Britisch Coffee Waterfilter 40x40")
	CALL ui.ComboBox.ForName("invLineItem").addItem("SNCB-1","Super Nova Coffee Beans - Intensity Level 1")
	CALL ui.ComboBox.ForName("invLineItem").addItem("SNCB-2","Super Nova Coffee Beans - Intensity Level 2")
	CALL ui.ComboBox.ForName("invLineItem").addItem("SNCB-3","Super Nova Coffee Beans - Intensity Level 3")
	CALL ui.ComboBox.ForName("invLineItem").addItem("SNCB-4","Super Nova Coffee Beans - Intensity Level 4")
	CALL ui.ComboBox.ForName("invLineItem").addItem("SNCB-5","Super Nova Coffee Beans - Intensity Level 5")
	CALL ui.ComboBox.ForName("invLineItem").addItem("SNCB-6","Super Nova Coffee Beans - Intensity Level 6")
	CALL ui.ComboBox.ForName("invLineItem").addItem("SNCB-7","Super Nova Coffee Beans - Intensity Level 7")
	CALL ui.ComboBox.ForName("invLineItem").addItem("SNCB-8","Super Nova Coffee Beans - Intensity Level 8")
	CALL ui.ComboBox.ForName("invLineItem").addItem("SNCB-9","Super Nova Coffee Beans - Intensity Level 9")
	CALL ui.ComboBox.ForName("invLineItem").addItem("SNCB-10","Super Nova Coffee Beans - Intensity Level 10")
	
END FUNCTION
################################################################################
# END FUNCTION initData()
################################################################################


################################################################################
# FUNCTION getAddress(address1,address2,address3,city,postCode,country)
#
#
################################################################################
FUNCTION getAddress(address1,address2,address3,city,postCode,country)
	DEFINE address1,address2,address3,city,postCode,country STRING
	DEFINE lAddress STRING
	LET lAddress =	address1 CLIPPED, ",", 
									address2 CLIPPED, ",", 
									address3 CLIPPED, ",", 
									city CLIPPED, ",",
									postCode CLIPPED, ",", 
									country CLIPPED

	RETURN lAddress
END FUNCTION
################################################################################
# END FUNCTION getAddress(address1,address2,address3,city,postCode,country)
################################################################################