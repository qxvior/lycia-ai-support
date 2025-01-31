

FUNCTION qxt_open_db(db_name)
  DEFINE db_name CHAR(64),
         sqlr    SMALLINT,
         retval  SMALLINT,
         ret_msg VARCHAR(200)

  WHENEVER ERROR CONTINUE
    DATABASE db_name
    LET retval = status
    LET sqlr = SQLCA.SQLCODE

  IF retval = 0 THEN
    LET ret_msg = "DB Connection Succesful"
  END IF

  WHENEVER ERROR STOP
  CASE
    WHEN (sqlr = -329 OR sqlr = -827)
      LET ret_msg = db_name CLIPPED,
        ": Database not found or no system permission. (-320 or -827)"
      ERROR ret_msg
    WHEN (sqlr = -349)
      LET ret_msg = db_name CLIPPED,
        ": not opened, you do not have Connect privilege (-349)"
      ERROR ret_msg
    WHEN (sqlr = -354)
      LET ret_msg = db_name CLIPPED,
        ": Incorrect database name format. (-354)"
      ERROR ret_msg
    WHEN (sqlr = -377)
      LET ret_msg = "qxt_open_db() called with a transaction still incomplete (-377)"
      ERROR ret_msg
    WHEN (sqlr = -512)
      LET ret_msg = "Unable to open in exclusive mode, db is probably in use. (-512)"
      ERROR ret_msg
  END CASE

  RETURN retval, sqlr, ret_msg
END FUNCTION


FUNCTION qxt_connect_db_tool()
  DEFINE
    db_name   VARCHAR(18),
    yes_no    CHAR(64),
    ask_retry SMALLINT,
    test_conn SMALLINT,
    retval    SMALLINT,
    sqltype INTEGER,
    sqllen INTEGER

  LET db_name = get_db_name_tool()
  DISPLAY "Default Database (defined in config.cfg)", trim(db_name) AT 3,3 ATTRIBUTE(BLUE,BOLD)
	CALL fgl_winmessage("Display AT gd_db_deploy_db.4gl line 56","Display AT","info")

  WHENEVER ERROR CONTINUE
  CALL qxt_open_db(db_name) RETURNING retval
  WHENEVER ERROR STOP


  IF retval < 0 THEN
    DISPLAY "Connection failed" AT 7,3

    WHILE retval < 0 
      PROMPT "Enter database name: " FOR db_name
        ON KEY(INTERRUPT)
          EXIT WHILE
      END PROMPT

      IF length(db_name)=0 THEN
        #CONTINUE WHILE
      END IF

      DISPLAY "Enter database name: ",db_name CLIPPED AT 4, 1
      DISPLAY "Connecting to database '",db_name CLIPPED,"'..." AT 6, 3

      WHENEVER ERROR CONTINUE
        CALL qxt_open_db(db_name) RETURNING retval
      WHENEVER ERROR STOP
      IF retval > 0 THEN
        DISPLAY "Connection successful" AT 7,3 ATTRIBUTE(GREEN)
        EXIT WHILE
      ELSE
        DISPLAY "Connection failed" AT 7,3 ATTRIBUTE(RED)
      END IF

    END WHILE

  ELSE
    DISPLAY "Connection successful" AT 7,3 ATTRIBUTE(GREEN)
  END IF



END FUNCTION
