DEFINE dt_rec_jsonObj TYPE AS RECORD
	fName STRING,
	transaction DYNAMIC ARRAY OF MONEY
END RECORD
MAIN
	DEFINE json_obj util.JSONObject
	DEFINE l_rec_data OF dt_rec_jsonObj
	DEFINE l_ref_rec REFERENCE

	LET json_obj = util.JSONObject.CREATE()
	CALL init_record() RETURNING l_rec_data.*

	LET l_ref_rec = l_rec_data
	DISPLAY "REFERENCE :", l_ref_rec
	LET json_obj = util.JSONObject.fromFGL(l_ref_rec)
	DISPLAY "JSON      :",json_obj.toString()
END MAIN

FUNCTION init_record()
	DEFINE l_rec_data OF dt_rec_jsonObj
	DEFINE i SMALLINT

	LET l_rec_data.fName = "Hubert"
	LET l_rec_data.transaction[1]= 110
	FOR i = 2 TO 4
		LET l_rec_data.transaction[i]= l_rec_data.transaction[i-1] + 110
	END FOR

	RETURN l_rec_data.*
END FUNCTION
