###################################################################################
# GLOBALS
###################################################################################
GLOBALS

  DEFINE t_db_info TYPE AS 
    RECORD
      db_version VARCHAR(10),
      db_build   VARCHAR(10),
      db_other   vARCHAR(10)
    END RECORD


END GLOBALS

########################################################
# FUNCTION get_required_db_version()
########################################################

FUNCTION get_required_db_version()

  RETURN "6.002"

END FUNCTION


######################################################
# FUNCTION db_info(db_name)
######################################################
FUNCTION db_info(db_name)
  DEFINE 
    db_name,db_state_str VARCHAR(100),
    retval,row_count,db_state SMALLINT,
    l_db_info_arr ARRAY[30] OF t_db_info 

  WHENEVER ERROR CONTINUE



  IF  fgl_find_table("db_info") THEN

    DECLARE c_db_info CURSOR FOR 
    SELECT *
      #INTO l_db_info_arr.*
      FROM db_info

    LET row_count = 1
    FOREACH c_db_info INTO l_db_info_arr[row_count]
      LET row_count = row_count + 1
      IF row_count > 30 THEN
        EXIT FOREACH
      END IF
    END FOREACH

    LET row_count = row_count - 1

    Let db_state = compare_db_version(l_db_info_arr[1].*)


  ELSE  --Error

    LET db_state = -2

  END IF

  #WHENEVER ERROR CONTINUE
  WHENEVER ERROR STOP

  RETURN db_state, l_db_info_arr[1].*  --db_version, l_db_info_arr[1].db_build

END FUNCTION



########################################################
# FUNCTION open_db(db_name)
########################################################
FUNCTION open_db(db_name)
  DEFINE db_name CHAR(64),
         sqlr    SMALLINT,
         retval  SMALLINT,
         db_state_str VARCHAR(100)

  WHENEVER ERROR CONTINUE
    DATABASE db_name
    LET retval = status
    LET sqlr = SQLCA.SQLCODE
  WHENEVER ERROR STOP
  CASE
    WHEN (sqlr = -329 OR sqlr = -827)
      LET db_state_str = db_name CLIPPED,
        ": Database not found or no system permission."
      ERROR db_state_str CLIPPED

    WHEN (sqlr = -349)
      LET db_state_str = db_name CLIPPED,
        " not opened, you do not have Connect privilege - SQL Code:", sqlr
      ERROR db_state_str CLIPPED

    WHEN (sqlr = -354)
      LET db_state_str = db_name CLIPPED,
        ": Incorrect database name format. - SQL Code:", sqlr
      ERROR db_state_str CLIPPED

    WHEN (sqlr = -377)
      LET db_state_str = "open_db() called with a transaction still incomplete - SQL Code:", sqlr
      ERROR db_state_str CLIPPED

    WHEN (sqlr = -512)
      LET db_state_str = "Unable to open in exclusive mode, db is probably in use. - SQL Code:", sqlr
      ERROR db_state_str CLIPPED

    WHEN (sqlr = 0)
      LET db_state_str = "Connection successful - SQL Code:", sqlr
      #ERROR db_state_str CLIPPED

    OTHERWISE 
      LET db_state_str = "Other error - SQL Code:", sqlr
      ERROR db_state_str CLIPPED
  END CASE
  RETURN retval, db_state_str
END FUNCTION



########################################################
# FUNCTION compare_db_version(db_info2)
########################################################

FUNCTION compare_db_version(db_info2)
  DEFINE db_info1, db_info2 OF t_db_info 

  IF get_required_db_version() = db_info2.db_build THEN
    RETURN 0

  ELSE
    RETURN -1
  END IF

END FUNCTION

