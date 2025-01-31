##################################################################################
# Module Scope Variables
##################################################################################
DEFINE currencies DYNAMIC ARRAY OF 
	RECORD 
		currency STRING, 
		use BOOL 
	END RECORD

DEFINE dt DATE
DEFINE base STRING

DEFINE currencyExchange DYNAMIC ARRAY OF 
	RECORD 
		currency STRING, 
		exchange FLOAT 
	END RECORD

DEFINE res
	RECORD
		stat INT,
		currency 
			RECORD
				c  RECORD 
						amount STRING 
					END RECORD,
				bs STRING,
				dt STRING
    	END RECORD
	END RECORD


##################################################################################
# MAIN
#
#
##################################################################################
MAIN
  OPTIONS INPUT WRAP
  OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
  
  CALL ui_init()	
  CALL hideNavigation()
	
  OPEN WINDOW wExchangeRate WITH FORM "form/webAPI_CurrencyExchangeView"
  CALL ui.Interface.setText("Currency")
  
  CALL PopulateWithDefault()
  
  DISPLAY "Currency Exchange Rate Converter (WEB-API Demo)" TO lbTitle
  
  DIALOG ATTRIBUTE(UNBUFFERED)
    INPUT BY NAME base, dt WITHOUT DEFAULTS
    	    
      ON CHANGE base
        CALL PopulateExchange()
        
      ON CHANGE dt
        IF dt > TODAY THEN
          LET dt = TODAY
        END IF
        CALL PopulateExchange()
        
    END INPUT
    
    DISPLAY ARRAY currencyExchange TO currencyExchange.*
    END DISPLAY
    
    ON ACTION "Convert"
      CALL Convert()
    
    ON ACTION "Settings"
      CALL Settings()
    
    ON ACTION "Exit"
      EXIT DIALOG
      
		BEFORE DIALOG
			CALL fgl_dialog_setkeylabel("Convert","Convert","{CONTEXT}/public/querix/icon/svg/24/ic_account_balance_24px.svg",3,0,"Convert based on this choosen currency...")
			CALL fgl_dialog_setkeylabel("Settings","Settings","{CONTEXT}/public/querix/icon/svg/24/ic_settings_24px.svg",4,0,"Cancel this...")
			 
  END DIALOG
  
END MAIN


##################################################################################
# FUNCTION Populate()
#
#
##################################################################################
FUNCTION Populate()
  DEFINE i INT
  DEFINE cb ui.ComboBox
  CALL PopulateExchange()
  CALL PopulateCombobox("base")
END FUNCTION


##################################################################################
# FUNCTION PopulateCombobox(name)
#
#
##################################################################################
FUNCTION PopulateCombobox(pName)
  DEFINE pName STRING
  DEFINE i INT
  DEFINE cb ui.ComboBox
  LET cb = ui.ComboBox.ForName(pName)
  CALL cb.Clear()
  FOR i = 1 TO currencies.GetSize()
    CALL cb.AddItem(currencies[i].currency)
  END FOR
END FUNCTION


##################################################################################
# FUNCTION PopulateExchange()
#
#
##################################################################################
FUNCTION PopulateExchange()
  DEFINE i INT
  DEFINE url STRING
  DEFINE rs web.Response
  CALL currencyExchange.Clear()	--delete dynamic array contents
  FOR i = 1 TO currencies.GetSize()
    IF currencies[i].use AND currencies[i].currency <> base THEN
      --CALL currency.date_get(dt USING "yyyy-mm-dd", base, currencies[i].currency) RETURNING res.stat, res.currency.*
      LET url = "https://api.exchangeratesapi.io/" , dt USING "yyyy-mm-dd"
      CALL web.Request.get(url).param("base", base).param("symbols", currencies[i].currency).perform() RETURNING rs
      IF rs.GetHTTPCode() = 200 THEN
	    CALL util.JSON.parse(rs.getBody(), res.currency)
	    CALL currencyExchange.Append([currencies[i].currency, res.currency.c.amount])
      END IF
    END IF
  END FOR
END FUNCTION


##################################################################################
# FUNCTION Convert()
#
#
##################################################################################
FUNCTION Convert()
  DEFINE from, to STRING
  DEFINE amount FLOAT
  
  OPEN WINDOW wConvert AT 1,1 WITH FORM "form/webAPI_CurrencyExchangeCalc" ATTRIBUTE(BORDER)
  CALL fgl_settitle("Calculate Exchange Rate")  
  CALL PopulateCombobox("from")  
  CALL PopulateCombobox("to")
  LET from = base
  LET to = base
  LET amount = 0
  INPUT BY NAME from, to, amount WITHOUT DEFAULTS ATTRIBUTE(UNBUFFERED)
    BEFORE INPUT
      CALL fgl_dialog_setkeylabel("calc","Convert","{CONTEXT}/public/querix/icon/svg/24/ic_process_24px.svg",3,0,"Convert based on this choosen currency...")

    ON CHANGE from
      CALL Calc(from, to, amount)

    ON CHANGE to
      CALL Calc(from, to, amount)

    ON ACTION "calc"
      CALL Calc(from, to, amount)
	      
	ON ACTION "exit"
  	  EXIT INPUT
 END INPUT
  CLOSE WINDOW wConvert
END FUNCTION


##################################################################################
# FUNCTION Calc(from, to, amount)  
#
#
##################################################################################
FUNCTION Calc(from, to, amount)  
  DEFINE from, to STRING
  DEFINE amount, result FLOAT
  DEFINE rs web.Response
  --CALL currency.latest_get(from, to) RETURNING res.stat, res.currency.*
  CALL web.Request.get("https://api.exchangeratesapi.io/latest").param("base", from).param("symbols", to).perform() RETURNING rs
  IF rs.GetHTTPCode() = 200 THEN
    CALL util.JSON.parse(rs.getBody(), res.currency)
    LET result = amount * res.currency.c.amount
  END IF
  DISPLAY result TO result
END FUNCTION


##################################################################################
# FUNCTION Settings()
#
#
##################################################################################
FUNCTION Settings()
  DEFINE updt BOOL
  OPEN WINDOW s AT 1,1 WITH FORM "form/webAPI_CurrencyExchangeSettings" --ATTRIBUTE(BORDER)
  CALL fgl_setTitle("Calculate Conversion")
  LET updt = FALSE
  INPUT ARRAY currencies WITHOUT DEFAULTS FROM currencies.*
    ATTRIBUTES(
      INSERT ROW = FALSE,
      DELETE ROW = FALSE,
      APPEND ROW = FALSE,
      AUTO APPEND = FALSE)
      
    ON ACTION ACCEPT
      LET updt = TRUE
      EXIT INPUT
    ON ACTION CANCEL
      EXIT INPUT
  END INPUT  
  
  CLOSE WINDOW s
  IF updt THEN
    CALL Populate()
  END IF
END FUNCTION


##################################################################################
# FUNCTION PopulateWithDefault()
#
#
##################################################################################
FUNCTION PopulateWithDefault()
  LET currencies[ 1].currency = "AUD"
  LET currencies[ 2].currency = "BGN"
  LET currencies[ 3].currency = "BRL"
  LET currencies[ 4].currency = "CAD"
  LET currencies[ 5].currency = "CHF"
  LET currencies[ 6].currency = "CNY"
  LET currencies[ 7].currency = "CZK"
  LET currencies[ 8].currency = "DKK"
  LET currencies[ 9].currency = "GBP"
  LET currencies[10].currency = "HKD"
  LET currencies[11].currency = "HRK"
  LET currencies[12].currency = "HUF"
  LET currencies[13].currency = "IDR"
  LET currencies[14].currency = "ILS"
  LET currencies[15].currency = "INR"
  LET currencies[16].currency = "JPY"
  LET currencies[17].currency = "KRW"
  LET currencies[18].currency = "MXN"
  LET currencies[19].currency = "MYR"
  LET currencies[20].currency = "NOK"
  LET currencies[21].currency = "NZD"
  LET currencies[22].currency = "PHP"
  LET currencies[23].currency = "PLN"
  LET currencies[24].currency = "RON"
  LET currencies[25].currency = "RUB"
  LET currencies[26].currency = "SEK"
  LET currencies[27].currency = "SGD"
  LET currencies[28].currency = "THB"
  LET currencies[29].currency = "TRY"
  LET currencies[30].currency = "USD"
  LET currencies[31].currency = "ZAR"
  LET currencies[32].currency = "EUR"
  
  LET currencies[ 1].use = TRUE
  LET currencies[ 2].use = FALSE
  LET currencies[ 3].use = FALSE
  LET currencies[ 4].use = FALSE
  LET currencies[ 5].use = FALSE
  LET currencies[ 6].use = FALSE
  LET currencies[ 7].use = TRUE
  LET currencies[ 8].use = FALSE
  LET currencies[ 9].use = FALSE
  LET currencies[10].use = FALSE
  LET currencies[11].use = FALSE
  LET currencies[12].use = FALSE
  LET currencies[13].use = FALSE
  LET currencies[14].use = FALSE
  LET currencies[15].use = FALSE
  LET currencies[16].use = TRUE
  LET currencies[17].use = FALSE
  LET currencies[18].use = TRUE
  LET currencies[19].use = FALSE
  LET currencies[20].use = FALSE
  LET currencies[21].use = FALSE
  LET currencies[22].use = FALSE
  LET currencies[23].use = TRUE
  LET currencies[24].use = FALSE
  LET currencies[25].use = FALSE
  LET currencies[26].use = FALSE
  LET currencies[27].use = FALSE
  LET currencies[28].use = FALSE
  LET currencies[29].use = FALSE
  LET currencies[30].use = TRUE
  LET currencies[31].use = FALSE
  LET currencies[32].use = TRUE
  
  LET base = "EUR"
  LET dt = TODAY
    
  CALL Populate()
END FUNCTION