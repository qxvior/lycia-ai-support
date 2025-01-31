MAIN
    DEFINE jo util.JSONObject
    DEFINE ja util.JSONArray
    LET jo = util.JSONObject.create()
    LET ja = util.JSONArray.create()
    CALL jo.put( "k1", "v1" )
    CALL ja.put( 1, "a1" )
    CALL jo.put( "k2", "v2" )
    CALL ja.put( 2, "a2" )

    DISPLAY util.JSON.stringify(jo)
    DISPLAY util.JSON.stringify(ja)

	CALL jo.delete(1)
	CALL ja.remove(1)
	
    DISPLAY util.JSON.stringify(jo)
    DISPLAY util.JSON.stringify(ja)
END MAIN	