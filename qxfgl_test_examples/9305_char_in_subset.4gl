MAIN
  DEFINE
  	av_sht_size           CHAR(3),
  	av_reams_cartn        CHAR(20)

	LET av_reams_cartn = 7
	LET av_sht_size = "LT"

	IF av_sht_size in ("LT","LG","P3","OF2") and av_reams_cartn>5 then
		DISPLAY "PASSED 1"
    END IF
    
	IF av_sht_size in ("LG","P3","OF2") and av_reams_cartn>5 then
		DISPLAY "FAILED 1"
    END IF

    IF ( av_sht_size is not null and av_sht_size not in (' ', '*') )  then
		DISPLAY "PASSED 2"
    END IF

    IF ( av_sht_size is not null and av_sht_size not in ('LT', '*') )  then
		DISPLAY "FAILED 2"
    END IF
    
    

END MAIN  