MAIN
  DEFINE theBlob BYTE
  CALL c_create_blob(theBlob)
  CALL func(theBlob)
END MAIN

FUNCTION func(theBlob)
  DEFINE theBlob BYTE
  DEFINE ret INT
  CALL c_check_blob(theBlob) RETURNING ret
  IF ret = 0 THEN
    DISPLAY "SUCCESS"
  ELSE
    DISPLAY "FAILED"
  END IF
end FUNCTION