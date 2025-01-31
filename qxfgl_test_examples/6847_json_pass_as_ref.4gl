MAIN
    DEFINE jo util.JSONObject
    DEFINE ja util.JSONArray
    LET jo = util.JSONObject.create()
    LET ja = util.JSONArray.create()
    CALL jo.put( "k1", "v1" )
    CALL ja.put( 1, "a1" )
    CALL fo(jo)
    CALL fa(ja)
    DISPLAY util.JSON.stringify(jo)
    DISPLAY util.JSON.stringify(ja)
END MAIN

FUNCTION fo(jo)
    DEFINE jo util.JSONObject
    CALL jo.put( "k2", "v2" )
END FUNCTION

FUNCTION fa(ja)
    DEFINE ja util.JSONArray
    CALL ja.put( 2, "a2" )
END FUNCTION