

MAIN
	DEFINE cookieValue STRING
	DEFINE cookieRead,cookieState,cookieResult STRING
	DEFINE recReadCookie OF 
		RECORD
			Key1 STRING,			
			Key2 STRING,			
			Key3 STRING,			
			Key4 STRING,
			Key5 STRING
		END RECORD 
	DEFINE i INT
	DEFINE tempKeyValue STRING
	DEFINE promptChar CHAR
	OPEN WINDOW wcookies WITH FORM "form/ui_interface_frontcall_cookies"

	#atomic simple   --

	#1.1 Read if cookie was written in a prior session/run
	LET cookieValue = ui.Interface.frontCall("html5", "getLocalStorage", ["MyKey"], cookieResult)
	DISPLAY "cookieValue=", trim(cookieResult)
	DISPLAY cookieValue TO _1_readCookie

	#1.2 Write cookie data
	CALL ui.Interface.frontCall("html5", "setLocalStorage", ["MyKey","Hubert"], cookieState)
	DISPLAY "cookieState=", trim(cookieState)  --what does cookieState do ? 
	DISPLAY cookieValue TO _2_writeCookie

	#1.3 Read cookie data
	LET cookieValue = ui.Interface.frontCall("html5", "getLocalStorage", ["MyKey"], cookieResult)
	DISPLAY "cookieValue=", trim(cookieResult)
	DISPLAY cookieValue TO _3_readCookie

	#2.1 Read if cookie was written in a prior session/run
	#read cookie data
	LET recReadCookie.Key1 = ui.Interface.frontCall("html5", "getLocalStorage", ["Key1"], cookieResult)
	DISPLAY "cookieResult=", trim(cookieResult)
	DISPLAY recReadCookie.Key1 TO _1_key1
	LET recReadCookie.Key2 = ui.Interface.frontCall("html5", "getLocalStorage", ["Key2"], cookieResult)
	DISPLAY "cookieResult=", trim(cookieResult)
	DISPLAY recReadCookie.Key2 TO _1_key2
	LET recReadCookie.Key3 = ui.Interface.frontCall("html5", "getLocalStorage", ["Key3"], cookieResult)
	DISPLAY "cookieResult=", trim(cookieResult)
	DISPLAY recReadCookie.Key3 TO _1_key3
	LET recReadCookie.Key4 = ui.Interface.frontCall("html5", "getLocalStorage", ["Key4"], cookieResult)
	DISPLAY "cookieResult=", trim(cookieResult)
	DISPLAY recReadCookie.Key4 TO _1_key4
	--Read cookie data which never exist
	LET recReadCookie.Key5 = ui.Interface.frontCall("html5", "getLocalStorage", ["Key5"], cookieResult)
	DISPLAY "cookieResult=", trim(cookieResult)
	DISPLAY recReadCookie.Key5 TO _1_key5

	#2.2 Write cookie data
	#write cookie data
	LET tempKeyValue = "Hubert-", trim(CURRENT)
	CALL ui.Interface.frontCall("html5", "setLocalStorage", ["Key1",tempKeyValue], cookieState)
	DISPLAY "cookieState=", trim(cookieState)  --what does cookieState do ? 
	DISPLAY tempKeyValue TO _2_key1

	LET tempKeyValue = "Vitaliy-", trim(CURRENT)
	CALL ui.Interface.frontCall("html5", "setLocalStorage", ["Key2",tempKeyValue], cookieState)
	DISPLAY "cookieState=", trim(cookieState)  --what does cookieState do ? 
	DISPLAY tempKeyValue TO _2_key2

	LET tempKeyValue = "Vlad-", trim(CURRENT)
	CALL ui.Interface.frontCall("html5", "setLocalStorage", ["Key3",tempKeyValue], cookieState)
	DISPLAY "cookieState=", trim(cookieState)  --what does cookieState do ? 
	DISPLAY tempKeyValue TO _2_key3

	LET tempKeyValue = "Victor-", trim(CURRENT)
	CALL ui.Interface.frontCall("html5", "setLocalStorage", ["Key4",tempKeyValue], cookieState)
	DISPLAY "cookieState=", trim(cookieState)  --what does cookieState do ? 
	DISPLAY tempKeyValue TO _2_key4

	#2.3 Read cookie data
	LET recReadCookie.Key1 = ui.Interface.frontCall("html5", "getLocalStorage", ["Key1"], cookieResult)
	DISPLAY "cookieResult=", trim(cookieResult)
	DISPLAY recReadCookie.Key1 TO _3_key1
	
	LET recReadCookie.Key2 = ui.Interface.frontCall("html5", "getLocalStorage", ["Key2"], cookieResult)
	DISPLAY "cookieResult=", trim(cookieResult)
	DISPLAY recReadCookie.Key2 TO _3_key2

	LET recReadCookie.Key3 = ui.Interface.frontCall("html5", "getLocalStorage", ["Key3"], cookieResult)
	DISPLAY "cookieResult=", trim(cookieResult)
	DISPLAY recReadCookie.Key3 TO _3_key3

	LET recReadCookie.Key4 = ui.Interface.frontCall("html5", "getLocalStorage", ["Key4"], cookieResult)
	DISPLAY "cookieResult=", trim(cookieResult)
	DISPLAY recReadCookie.Key4 TO _3_key4

	#Read cookie data which does not exist
	LET recReadCookie.Key5 = ui.Interface.frontCall("html5", "getLocalStorage", ["Key5"], cookieResult)
	DISPLAY "cookieResult=", trim(cookieResult)
	DISPLAY recReadCookie.Key5 TO _3_key5

	PROMPT "" FOR CHAR promptChar

END MAIN