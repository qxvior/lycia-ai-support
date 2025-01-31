MAIN
  DEFINE physdb_name  CHAR(60)
  LET physdb_name = get_envvar( "DBNAME" )
  DISPLAY "|", physdb_name, "|"
  CALL fgl_getkey()
END MAIN