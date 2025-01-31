IMPORT JAVA SendSmSOcto
-- IMPORT JAVA java.net.URL
IMPORT JAVA SmsBelgacom
-- IMPORT JAVA java.util.regex.Pattern
-- IMPORT JAVA java.util.regex.Matcher

-- database magix

MAIN
DEFINE	urljava,userlogjava,apikeyjava,smstextjava,smsrecjava,smstypejava,smsenderjava STRING
DEFINE	str,proCredit,stCredit STRING
DEFINE	send SendSmSOcto
DEFINE	resultat STRING
DEFINE	url CHAR(100)
DEFINE	user_login CHAR(50)
DEFINE	api_key CHAR(40)
DEFINE	sms_text CHAR(459)
DEFINE	sms_recipients CHAR(18)
DEFINE	sms_mode SMALLINT
DEFINE	sms_type CHAR(3)
DEFINE	sms_sender CHAR(30)
DEFINE	sms_d SMALLINT
DEFINE	sms_m INTEGER
DEFINE	sms_y INTEGER
DEFINE	sms_h SMALLINT
DEFINE	sms_i SMALLINT
DEFINE	request_mode,date_str STRING

	LET send = SendSmSOcto.create()
	LET urljava = url CLIPPED
	LET userlogjava = user_login CLIPPED
	LET apikeyjava = api_key CLIPPED

	LET str = send.getCredit(urljava,userlogjava,apikeyjava)

	-- LET send = SendSmSOcto.create()

	LET urljava = url CLIPPED
	LET userlogjava = user_login CLIPPED
	LET apikeyjava = api_key CLIPPED
	LET smstextjava = sms_text CLIPPED
	LET smsrecjava = sms_recipients CLIPPED
	LET smstypejava = sms_type CLIPPED
	LET smsenderjava = sms_sender CLIPPED

	-- No such method
	LET resultat = send.undefined(sms_mode)
END MAIN
