MAIN
DEFINE root_dir, 
         log_path STRING,
         log_text,
         net_use TEXT
        
LET root_dir = os.Path.rootdir()
IF fgl_arch() = "nt" THEN
    LET log_path = root_dir, "tmp\\startlog.log"
ELSE  
  LET log_path = root_dir, "tmp/startlog.log"
END IF

OPEN WINDOW w1 WITH FORM "1189/1189_qrun_network_drive" ATTRIBUTE (BORDER)
INPUT BY NAME log_path WITHOUT DEFAULTS ATTRIBUTE(UNBUFFERED)
AFTER FIELD log_path
    NEXT FIELD log_path
ON ACTION "startlog"
    CALL startlog(log_path)
    CALL errorlog ("Log file ", log_path , " was created successfully! " )
    LOCATE log_text IN FILE log_path
    DISPLAY log_text
ON ACTION "net"
    RUN "net use > test.out"
    RUN "whoami >> test.out"
    LOCATE net_use IN FILE "test.out"
    DISPLAY net_use
ON ACTION "Exit"
    EXIT INPUT
END INPUT

END MAIN