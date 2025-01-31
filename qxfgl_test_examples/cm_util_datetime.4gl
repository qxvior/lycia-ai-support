


MAIN
	DEFINE dt_datetime_year_to_second DATETIME YEAR TO SECOND
#	DEFINE l_getCurrentAsLocal DATETIME YEAR TO FRACTION(5)	
	DEFINE l_utc_datetime_year_to_fraction_5 DATETIME YEAR TO FRACTION(5)
	DEFINE l_local_datetime_year_to_fraction_5 DATETIME YEAR TO FRACTION(5)
	DEFINE dt_ym DATETIME YEAR TO MINUTE
	DEFINE dt_yd DATETIME YEAR TO DAY
	DEFINE dt_yy DATETIME YEAR TO YEAR
  DEFINE l_local_datetime_year_to_second DATETIME YEAR TO SECOND
	DEFINE l_epoch VARIANT
	DEFINE l_utc_datetime_year_to_second DATETIME YEAR TO SECOND

	OPEN WINDOW cm_util_datetime WITH FORM "form/cm_util_datetime"
	    
	#DISPLAY util.Datetime.format
	#formats a DATETIME value according to the specified format
	DISPLAY CURRENT TO format_current
	DISPLAY util.Datetime.format(CURRENT, "%Y-%m-%d %H:%M") TO format_current_result
  
	#util.Datetime.fromSecondsSinceEpoch
	#converts a number of seconds since Unix epoch to a DATETIME value
	LET dt_datetime_year_to_second = util.Datetime.fromSecondsSinceEpoch(-1379020785)
	DISPLAY "Unix epoch time:  -1379020785" TO fromSecondsSinceEpoch_seconds  
	DISPLAY dt_datetime_year_to_second TO fromSecondsSinceEpoch_human_readable  #"Human readable time:  ", 

	#util.Datetime.getCurrentAsLocal()
	#returns current date and time as a DATETIME value in the local time zone
	LET l_local_datetime_year_to_fraction_5 = util.Datetime.getCurrentAsLocal()
	DISPLAY CURRENT TO getCurrentAsLocal_current 
	DISPLAY l_local_datetime_year_to_fraction_5 TO getCurrentAsLocal_current_local#"Current Local: "

	#util.Datetime.getCurrentAsUTC()
	#returns current date and time as UTC
	LET l_utc_datetime_year_to_fraction_5 = util.Datetime.getCurrentAsUTC()
	DISPLAY l_utc_datetime_year_to_fraction_5 TO getCurrentAsUTC

	#util.Datetime.parse
	#converts a string into a DATETIME value according to the specified format
	LET dt_ym= util.Datetime.parse("2017-02-22 14:15", "%Y-%m-%d %H:%M")
	DISPLAY dt_ym TO parse_1
	LET dt_yd = util.Datetime.parse("2017-02-22 14:15", "%Y-%m-%d")
	DISPLAY dt_yd TO parse_2
	LET dt_yy= util.Datetime.parse("2017-02-22 14:15", "%Y")
	DISPLAY dt_yy TO parse_3

	#to_LocalTime()
	#converts a DATETIME value in UTC to the DATETIME value in the local time zone
	LET l_local_datetime_year_to_second = util.Datetime.toLocalTime(DATETIME(2017-02-23 12:34:56) YEAR TO SECOND)
	DISPLAY l_local_datetime_year_to_second TO to_LocalTime

	#util.Datetime.toSecondsSinceEpoch()
	#converts a DATETIME value to a FLOAT value showing number of seconds since Unix epoch
	DISPLAY CURRENT TO view_current
	LET l_epoch = util.Datetime.toSecondsSinceEpoch(CURRENT)
	DISPLAY l_epoch TO toSecondsSinceEpoch

	#util.Datetime.toUTC()
	#converts a local time zome DATETIME value to UTC
	DISPLAY "2017-02-23 12:34:56" TO local_dateime_year_to_second
	LET l_utc_datetime_year_to_second = util.Datetime.toUTC(DATETIME(2017-02-23 12:34:56) YEAR TO SECOND)
	DISPLAY l_utc_datetime_year_to_second TO toUTC

	MENU
		BEFORE MENU
			CALL dialog.setActionHidden("CANCEL",TRUE)
		ON ACTION "ACCEPT"
			EXIT MENU
	END MENU

END MAIN