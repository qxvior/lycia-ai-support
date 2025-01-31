MAIN
    DEFINE jo util.JSONObject
    DEFINE ja util.JSONArray
    LET jo = util.JSONObject.create()
    LET ja = util.JSONArray.create()
    CALL jo.insert( "k1", "v1" )
    CALL ja.insert( 1, "a1" )
    CALL jo.insert( "k2", "v2" )
    CALL ja.insert( 2, "a2" )
    CALL jo.insert( "k3", "v3" )
    CALL ja.insert( 3, "a3" )

    DISPLAY util.JSON.stringify(jo)
    DISPLAY util.JSON.stringify(ja)

	CALL jo.delete(1,2)
	CALL ja.delete(1,2)
	
    DISPLAY util.JSON.stringify(jo)
    DISPLAY util.JSON.stringify(ja)
END MAIN	