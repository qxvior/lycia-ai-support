###################################################################################
# This program creates the database schema and test data in the test database 
###################################################################################

###################################################################################
# DATABASE
###################################################################################
#DATABASE guidmeo

###################################################################################
# GLOBALS
###################################################################################
GLOBALS
  #DEFINE window_open SMALLINT
  DEFINE
    monitor STRING, --CHAR(5000),
    retval SMALLINT,
    db_state_str VARCHAR(100),
    db_connect_msg VARCHAR(200),
    db_name VARCHAR(40),
    db_version VARCHAR(10),
    db_build VARCHAR(10),
    db_state SMALLINT,
    table_name_list   ARRAY[20] OF VARCHAR(18),
    inst_table_count      SMALLINT,
    #qxt_table_count       SMALLINT,
    db_table_count       SMALLINT
    #app_type              SMALLINT

	DEFINE dbNameString0,dbNameString1,dbNameString2,dbNameString3 STRING
	
  DEFINE t_db_info TYPE AS 
    RECORD
      db_version VARCHAR(10),
      db_build   VARCHAR(10),
      db_other   vARCHAR(10)
    END RECORD


END GLOBALS

###################################################################################
# MAIN
###################################################################################
MAIN
  DEFINE
    i INTEGER,
    ret SMALLINT,
    db_driver_str VARCHAR(100),
    l_db_info OF t_db_info

  CALL fgl_putenv("DBDATE=dmy4.")

  OPTIONS
    HELP KEY F1,
    HELP FILE "msg/cms-lt-deploy_db_schema.erm",
		AUTOREFRESH 2
  WHENEVER ERROR STOP

  DEFER INTERRUPT
	LET dbNameString0 = "gd"  
	LET dbNameString1 = "GuiDemo"
	LET dbNameString2 = "GuiDemo Database"	
	LET dbNameString3 = "GuiDemo Database Tool"


  IF arg_val(1) IS NOT NULL THEN
    LET db_name = arg_val(1)
  END IF

  CALL ini_table_name_list()

  LET inst_table_count = db_table_count


  CALL fgl_settitle(dbNameString3)


  CALL fgl_form_open("f_db","form/db-deploy_db_schema")
  CALL fgl_form_display("f_db")
  DISPLAY "!" TO bt_db_set
  DISPLAY "!" TO bt_db_connect


  #DISPLAY HYDRA_DB_DRIVER
  LET db_driver_str = fgl_getenv("LYCIA_DB_DRIVER")
  DISPLAY  db_driver_str TO dl_hydra_db_driver
  LET db_name = "guidemo"

  #Display DBDATE Status
  DISPLAY fgl_getenv("DBDATE") TO dl_dbdate_format

  LET monitor = add_monitor_str(monitor, "DB Tool",0)
  CALL display_monitor(monitor)

  
  #Try to connect to database
  CALL connect_db_tools(db_name)
    RETURNING  retval, db_state_str, db_connect_msg, db_state, l_db_info.*

{

  WHENEVER ERROR CONTINUE
    DISPLAY db_name TO db_name
    CALL qxt_open_db(db_name) RETURNING retval, db_state_str, db_connect_msg
  WHENEVER ERROR STOP
  #WHENEVER ERROR CALL error_func

  #Update Monitor window
  CALL db_connect_monitor_msg(retval)

  #if connection successful, try to read the database version & build information
  #and display it
  IF retval >= 0 THEN
    CALL db_info("guidemo")  
  END IF
}

  MENU "DB-Create"
    COMMAND "(Re-)Create Database"  HELP 100
      CALL all_tables(-1,0)

    COMMAND "Drop ALL Tables"  HELP 100
      CALL all_tables(0,NULL)

    COMMAND "Create ALL Tables"  HELP 100
      CALL all_tables(1,NULL)

    COMMAND "Populate ALL Tables"  HELP 100
      MENU "Populate"
        COMMAND "Populate from UNL"
          CALL all_tables(2,0)
        COMMAND "Populate from BAK"  HELP 100
          CALL all_tables(2,1)
        COMMAND KEY(F23) "Set Database"
          CALL db_setting()

        COMMAND KEY(F24) "Connect"
          CALL connect_db_tools(db_name)
            RETURNING  retval, db_state_str, db_connect_msg, db_state, l_db_info.*

        COMMAND "Return"
          EXIT MENU
      END MENU

    COMMAND "Unload ALL Tables"  HELP 100
      MENU "Export"
        COMMAND "Unload to .UNL files"
          CALL all_tables(3,0)
        COMMAND "Unload to .BAK files"  HELP 100
          CALL all_tables(3,1)
        COMMAND KEY(F23) "Set Database"
          CALL db_setting()

        COMMAND KEY(F24) "Connect"
          CALL connect_db_tools(db_name)
            RETURNING  retval, db_state_str, db_connect_msg, db_state, l_db_info.*

        COMMAND "Return"
          EXIT MENU
      END MENU

    COMMAND "Individual Tables"
      MENU "Individual Tables"

        COMMAND "Drop"
          CALL table_selection_menu(0,NULL)

        COMMAND "Create"
          CALL table_selection_menu(1,NULL)

        COMMAND "Load UNL"
          CALL table_selection_menu(2,0)

        COMMAND "Load BAK"
          CALL table_selection_menu(2,1)

        COMMAND "Unload UNL"
          CALL table_selection_menu(3,0)

        COMMAND "Unload BAK"
          CALL table_selection_menu(3,1)

        COMMAND "Return"
          EXIT MENU
      END MENU

    COMMAND "Monitor"
      MENU "Monitor"
        COMMAND "Monitor Input"  HELP 100
          INPUT monitor WITHOUT DEFAULTS FROM monitor_progress

        COMMAND "Clear Monitor"  HELP 100
          LET monitor = ""
          CALL display_monitor(monitor)
        COMMAND "Exit"  HELP 100
          EXIT MENU
      END MENU
    COMMAND "DB" HELP 100
      MENU "db_connect"
        COMMAND KEY(F23) "Set Database"
          CALL db_setting()

        COMMAND KEY(F24) "Connect"
          CALL connect_db_tools(db_name)
            RETURNING  retval, db_state_str, db_connect_msg, db_state, l_db_info.*

        COMMAND "Return"
          EXIT MENU

      END MENU

    COMMAND "Exit"  HELP 100
      EXIT MENU

    COMMAND "Help"  HELP 100
      CALL showhelp(100)

    COMMAND KEY(F23) 
      CALL db_setting()          


    COMMAND KEY(F24) 
      CALL connect_db_tools(db_name)
        RETURNING  retval, db_state_str, db_connect_msg, db_state, l_db_info.*


  END MENU

END MAIN


FUNCTION db_setting()

  INPUT db_name WITHOUT DEFAULTS FROM db_name HELP 100
    ON KEY (F23,F24, ACCEPT)
      CALL fgl_dialog_update_data()
      EXIT INPUT
  END INPUT
END FUNCTION


FUNCTION connect_db_tools(db_name)
  DEFINE 
    db_name    VARCHAR(40),
    l_db_info OF t_db_info 

  #Try to connect to database
  WHENEVER ERROR CONTINUE
    DISPLAY db_name TO db_name
    CALL qxt_open_db(db_name) RETURNING retval, db_state_str, db_connect_msg
  WHENEVER ERROR STOP
  #WHENEVER ERROR CALL error_func

  #Update Monitor window
  CALL db_connect_monitor_msg(retval)

  #if connection successful, try to read the database version & build information
  #and display it
  IF retval >= 0 THEN
    CALL db_info(dbNameString1) RETURNING db_state, l_db_info.*
  END IF

  RETURN retval, db_state_str, db_connect_msg, db_state, l_db_info.*

END FUNCTION

FUNCTION db_connect_monitor_msg(retval)
  DEFINE 
    retval SMALLINT,
    err_msg VARCHAR(200)
  IF retval < 0 THEN

    DISPLAY db_connect_msg TO dl_db_state ATTRIBUTE(RED)
    DISPLAY "Connection failed" TO monitor_progress ATTRIBUTE(RED)
    LET err_msg = "Can not connect to database ", db_name CLIPPED, "\nYou need to create the specified database named ", db_name CLIPPED," before you can continue\nAlternatively, change the database (Set DB) Name and try to re-connect"
    CALL fgl_winmessage("Database Error",err_msg,"error")
    #EXIT PROGRAM
  ELSE
    DISPLAY db_connect_msg TO dl_db_state ATTRIBUTE(GREEN)
    DISPLAY "Connection successful" TO monitor_progress ATTRIBUTE(GREEN)

    CALL db_state_report()
  END IF
END FUNCTION


########################################################
# FUNCTION unload_file_name(str,bak)
########################################################
FUNCTION unload_file_name(file_name,bak)
  DEFINE
    file_name,ret VARCHAR(100),
    bak SMALLINT,
    dir_name VARCHAR(50)
    
  LET dir_name = "unl"

   IF bak = 0 THEN
    LET ret = trim(dir_name), "/", trim(file_name), ".unl" 
    RETURN ret
  ELSE
    LET ret = trim(dir_name), "/", trim(file_name), ".bak" 
    RETURN ret
  END IF

END FUNCTION


########################################################
# FUNCTION splash(p_type,p_name,p_file_type)
#  CALL splash(p_action,p_table_name,p_file_type)
#    CALL splash(p_action,p_table_name,p_file_type)
########################################################
FUNCTION splash(p_action,p_name,p_file_type)
  DEFINE 
    p_action    SMALLINT,
    p_name      VARCHAR(40),
    obj      VARCHAR(120),
    tmp_str     VARCHAR(250),
    p_file_type SMALLINT,
    file_name   VARCHAR(100),
    err_msg     VARCHAR(100)

  IF p_action >1 THEN
    CASE p_file_type
      WHEN 0
        LET file_name = trim(p_name), ".unl"
      WHEN 1
        LET file_name = trim(p_name), ".bak"
    ENd CASE
  END IF

  CASE p_action
    WHEN 0
      LET obj = "Dropping Table: ", trim(p_name), "..."   --  TO monitor  --AT 4,4
     
    WHEN 1
      LET obj = "Creating Table: ", trim(p_name), "..." 
    WHEN 2 
      LET obj = "Loading Table: ", trim(p_name), " from ", file_name   
    WHEN 3 
      LET obj = "Unloading Table: ", trim(p_name), " from ", file_name
    WHEN NULL
      #do nothing
    OTHERWISE
      LET tmp_str = "Invalid p_type argument in function splash()!\p_file_type = ", p_file_type
      CALL fgl_winmessage("Error in splash()",tmp_str, "error")
  END CASE


  IF fgl_fglgui() THEN
    LET monitor = add_monitor_str(monitor, obj,1)
    CALL display_monitor(monitor)
  ELSE 
    CALL display_monitor(obj)
  END IF

  #SLEEP 1
END FUNCTION


########################################################
# FUNCTION error_func()
########################################################
FUNCTION error_func()
  DEFINE msg VARCHAR(200)

  CALL fgl_winmessage("This is a custom error message fuction error_func()","This is a custom error message fuction error_func()","info")
  IF sqlca.sqlcode = 0 THEN
    RETURN
  END IF
  LET msg = "SQL Error: ", sqlca.sqlcode, "\nobj creation failed"
  CALL fgl_message_box(msg)
  ROLLBACK WORK
  EXIT PROGRAM
END FUNCTION


######################################################
# FUNCTION add_monitor_str(str, str2,level)
######################################################
FUNCTION add_monitor_str(str, str2,level)
  DEFINE str, str2 STRING, --VARCHAR(5000),
    error_str VARCHAR(200),
    level SMALLINT
  DISPLAY str
    DISPLAY str2 
      DISPLAY level
       
  DISPLAY str2 TO dl_current_action 

  CASE level
    WHEN 0
      LET str = trim(str), "\n", trim(str2)
    WHEN 1
      LET str = trim(str), "\n\t", trim(str2)
    WHEN 2
      LET str = trim(str), "\n\t\t", trim(str2)
    WHEN 3
      LET str = trim(str), "\n\t\t\t", trim(str2)
    WHEN 4
      LET str = trim(str), "\n\t\t\t\t", trim(str2)
    OTHERWISE
      LET error_str = "Invalid level specified in add_monitor_str() level=" , level
      CALL fgl_winmessage("Internal 4gl source error - add_monitor_str(str, str2,level)",error_str,"error")
  END CASE


      
  RETURN trim(str)
END FUNCTION


######################################################
# FUNCTION display_monitor(str)
######################################################
FUNCTION display_monitor(str)
  DEFINE str STRING --VARCHAR(5000)

  DISPLAY str TO monitor_progress ATTRIBUTE(GREEN)

END FUNCTION


########################################################
# FUNCTION display_db_info(db_version,db_build)
########################################################
FUNCTION display_db_info(l_db_info)
  DEFINE l_db_info OF t_db_info 

  DISPLAY trim(dbNameString2) || " version: " || l_db_info.db_version || "DB_Build:" || l_db_info.db_build || "(Required DB_Build=" || get_required_db_version() || ")" TO dl_db_info

END FUNCTION

########################################################
# FUNCTION display_db_info(db_version,db_build)
########################################################
FUNCTION display_db_error(err_str,err_state)
  DEFINE 
    err_str VARCHAR(100),
    err_state SMALLINT

  IF err_state = 0 THEN
    DISPLAY  err_str TO dl_db_error ATTRIBUTE(GREEN)
  ELSE
    DISPLAY  err_str TO dl_db_error ATTRIBUTE(RED)
  END IF

END FUNCTION




########################################################################
# FUNCTION yes_no(msg)
#
# Question dialog box with the options yes and no
#
# RETURN BOOLEAN TRUE/FALSE
########################################################################
FUNCTION yes_no(title_msg,msg)
  DEFINE
    title_msg VARCHAR(100),
    msg VARCHAR(200),
    rv  CHAR

  IF title_msg = "" THEN
    LET title_msg = "CMS-LT-Demo Application"
  END IF

  LET rv = fgl_winquestion (title_msg,msg,1,"Yes|No","question",0)

  
  IF rv = "Y" THEN
    RETURN TRUE
  ELSE 
    RETURN FALSE
  END IF
END FUNCTION


#################################################################
# FUNCTION db_state_report()
#
#
#
# RETURN NONE
#################################################################
FUNCTION db_state_report()
  DEFINE
    l_db_info OF t_db_info,
    tempString STRING

  CALL db_info(dbNameString1) RETURNING db_state, l_db_info.*

  CASE db_state
    WHEN -1
    	LET tempString =  "Your ", trim(dbNameString1), " database is incomplete/outdated - please reinstall the db"
      CALL display_db_error(tempString,-1)
      CALL display_db_info(l_db_info.*)
    WHEN -2
    	LET tempString =  "Your ", trim(dbNameString1), " database is empty/outdated - please reinstall the database"    
      CALL display_db_error(tempString,-1)
      CALL display_db_info(l_db_info.*)
    WHEN 0
    	LET tempString =  "Your ", trim(dbNameString1), " database seems to be OK"    
      CALL display_db_error(tempString,0)
      CALL display_db_info(l_db_info.*)
  END CASE

END FUNCTION






############################################################################################################



#####################################################
# FUNCTION table_operation()
#
#
#
# RETURN err
#####################################################
FUNCTION table_operation(p_table_name,p_action,p_file_type)
  DEFINE 
    err          SMALLINT,
    p_table_name VARCHAR(50),
    p_action     SMALLINT,
    p_file_type  SMALLINT,
    tmp_str      VARCHAR(250),
    file_name    VARCHAR(250),
    local_debug  SMALLINT

  LET local_debug = FALSE

  LET err = -1  -- -1=error 

  IF p_action > 1 THEN   --0=drop and 1=table create
    LET file_name = unload_file_name(p_table_name,p_file_type)

    #Now done with a sepearte function at import call
    #IF p_action = 2 THEN --Load requires at least the unl or bak file 
      #IF NOT fgl_test("e",file_name) THEN
      #  LET tmp_str = "Following string import file does not exist: \n", file_name
      #  CALL fgl_winmessage("File Error in table_operation()" ,tmp_str, "error")
      #  RETURN -1
      #END IF
    #END IF

  END IF


  IF p_action = 0 THEN   --0=drop and 1=table create 2 =load 3=unload

    IF NOT fgl_find_table(p_table_name) THEN
      LET tmp_Str = "Error - Table ", trim(p_table_name), " can not be removed!\nThis table does not exist ! (Create it prior)\nIgnoring your request.."
      CALL fgl_winmessage("Table Drop (Delete) Error",tmp_str,"error")
    RETURN 0

    END IF

  END IF

  IF p_action = 1 THEN   --0=drop and 1=table create 2 =load 3=unload

    IF fgl_find_table(p_table_name) THEN
      LET tmp_Str = "Error - Table ", trim(p_table_name), " can not be created!\nThis table already exists ! (Drop it prior)\nIgnoring your request.."
      CALL fgl_winmessage("Table Create Error",tmp_str,"error")
    RETURN 0

    END IF

  END IF


  IF p_action > 1 THEN  --Load/Unload  --0=drop and 1=table create 2 =load 3=unload

    IF NOT fgl_find_table(p_table_name) THEN
      LET tmp_Str = "Error - Table ", trim(p_table_name), " does not exist!\nSystem can not export/import data from a missing table.\nIgnoring your request.."
      CALL fgl_winmessage("Table Data Import/Export Error",tmp_str,"error")
      RETURN 0
    END IF

  END IF

  IF p_action = 2 THEN  --Load unl file into table

    IF NOT server_side_file_exists(file_name) THEN
      RETURN 0
    END IF

    #'s' returns true if the file is non-zero size - false if it is empty
    IF NOT fgl_test("s",file_name) THEN  --file exists but is empty - Load will not like it...
      LET tmp_Str = "Error - UNL Load File ", trim(file_name), " is empty!\nSystem can not import data from an empty UNL/BAK file.\nIgnoring your request.."
      CALL fgl_winmessage("Table Data Import Error",tmp_str,"error")
      RETURN 0
    END IF

  END IF

  -- BEGIN WORK

  CALL splash(p_action,p_table_name,p_file_type)

  CASE p_table_name





#######################################################################################
# Application related tables
#######################################################################################


    WHEN table_name_list[1] --"gd_info"

      CASE p_action

        WHEN 0  --drop table
          WHENEVER ERROR CONTINUE
          DROP TABLE gd_info
          WHENEVER ERROR STOP
          ##WHENEVER ERROR CALL error_func

        WHEN 1  --create table
          CREATE TABLE gd_info (
            db_version      VARCHAR(10),
            db_build        VARCHAR(10),
            db_other        VARCHAR(10)
          )

        WHEN 2  --load table
          IF server_side_file_exists(file_name) THEN
            LOAD FROM file_name INSERT INTO gd_info
          END IF

        WHEN 3  --unload table
          UNLOAD TO file_name SELECT * FROM gd_info

      END CASE


    WHEN table_name_list[2] --"contact"

      CASE p_action

        WHEN 0  --drop table
          WHENEVER ERROR CONTINUE
          DROP TABLE contact
          WHENEVER ERROR STOP
          ##WHENEVER ERROR CALL error_func

        WHEN 1  --create table
         CREATE TABLE contact (
					#cust_id 	SERIAL(1) NOT NULL,
					cust_id INTEGER NOT NULL, 
					cust_title VARCHAR(10),
					cust_fname VARCHAR(20),
					cust_lname VARCHAR(20),
					cust_country VARCHAR(20),
					cust_dob DATE,
					cust_email VARCHAR(100),
					cust_url VARCHAR(200),
					cust_re INTEGER,
					cust_rp INTEGER,
					cust_rl INTEGER,
					cust_type SMALLINT,
					cust_memo CHAR(5000),
					cust_picture VARCHAR(80),
					--cust_picture_byte	BYTE,       

 
            PRIMARY KEY (cust_id)
          )



          

        WHEN 2  --load table
          IF server_side_file_exists(file_name) THEN
       
            LOAD FROM file_name INSERT INTO contact
          END IF

        WHEN 3  --unload table
          UNLOAD TO file_name SELECT * FROM contact ORDER BY cont_id ASC

      END CASE



    OTHERWISE
      LET tmp_str = "Invalid table name argument in function table_operation()!\ntable_name =", p_table_name
      CALL fgl_winmessage("Error",tmp_str,"error")

  END CASE

  -- COMMIT WORK

  #LET monitor = add_monitor_str(monitor, "End of Create Table Operation",0)
  CALL display_monitor(monitor)

  #CALL fgl_winmessage("End of Operation", "All tables where created","info")

  LET err = 1  -- -1=error  0 = failed but not error 1=ok

  RETURN err 

END FUNCTION

##################################





FUNCTION ini_table_name_list()



  # Actual  Application 
  LET table_name_list[1] = "gd_info"
  LET table_name_list[2] = "contact"
  

  LET db_table_count = 2

END FUNCTION



FUNCTION all_tables(p_action,p_file_type)
  DEFINE
   p_action SMALLINT,
   id       SMALLINT,
   err      SMALLINT,
   tmp_str  VARCHAR(200),
   tmp_str1 VARCHAR(100),
   tmp_str2 VARCHAR(200),
   tmp_str3 VARCHAR(100),
   p_file_type SMALLINT,
   temp_action  SMALLINT,
   local_debug  SMALLINT


 LET local_debug = FALSE

  IF local_debug THEN
    DISPLAY "all_tables() - p_action=", p_action
    DISPLAY "all_tables() - p_file_type=", p_file_type
  END IF

  CASE p_action
    WHEN -1  --Re-create entire database
      LET tmp_str1 = "Re-create (Drop,Create/Populate) ALL tables"
      LET tmp_str2 = "Are you sure you want to re-create (drop) all tables?\nYou can not undo this operation and will lose all tables including their data"
      LET tmp_str3 = "End Of Operation - The entire database was re-created"
    WHEN 0  --drop
      LET tmp_str1 = "Drop ALL tables"
      LET tmp_str2 = "Are you sure you want to drop all tables?\nYou can not undo this operation and will lose all tables including their data"
      LET tmp_str3 = "End Of Operation - All database tables were droped"
    WHEN 1  --create
      LET tmp_str1 = "Create ALL tables"
      LET tmp_str2 = "Are you sure you want to create all tables?\nYou can not undo this operation"
      LET tmp_str3 = "End Of Operation - All database tables were created"

    WHEN 2  --load
      LET tmp_str1 = "Populate (Load) ALL tables"
      LET tmp_str2 = "Are you sure you want to populate all tables?\nYou can not undo this operation"
      LET tmp_str3 = "End Of Operation - All database tables populated (unl load)"

    WHEN 3  --unload
      LET tmp_str1 = "Export (UnLoad) ALL tables"
      LET tmp_str2 = "Are you sure you want to export all tables?\nExisting 'Load/Unload files will be overwritten"
      LET tmp_str3 = "End Of Operation - All database table data were exported"
      
    OTHERWISE
      LET tmp_str = "Error in function all_tables()\nFunction argument p_action is invalid\np_action = ", p_action
      CALL fgl_winmessage("Error in function all_tables()",tmp_str,"error")
      RETURN

  END CASE

  IF local_debug THEN
    DISPLAY "all_tables() - yes/no?="
    #DISPLAY "all_tables() - p_file_type=", p_file_type
  END IF

  #Are you sure ?
  IF yes_no(tmp_str1,tmp_str2) THEN

    LET monitor = "" --initialise monitor progress string
    LET monitor = add_monitor_str(monitor, tmp_str1,0)
    CALL display_monitor(monitor)


    #recreate entire database
    IF p_action = -1  THEN --recreate entire database 

      #drop 
      LET temp_action = 0   --0=drop and 1=table create 2 =load 3=unload
      #Note: must drop table in reversed order
      #If any table can not be dropped, return from function
      FOR id = inst_table_count TO 1  STEP -1
        IF fgl_find_table(table_name_list[id]) THEN  --only drop, if the table does exist
          CALL table_operation(table_name_list[id],temp_action,p_file_type) RETURNING err
 
          IF fgl_find_table(table_name_list[id]) THEN
            LET monitor = monitor, "\tCould NOT drop the table: ", trim(table_name_list[id]), "... \n"
            CALL display_monitor(monitor)            
            LET tmp_str = "Could not drop the table ", table_name_list[id], "\nAbort database schema recreation now...\n(Some tables may have been dropped)"
            CALL fgl_winmessage("Could not drop table",tmp_str,"error")     
            RETURN err      

          END IF  
          
        END IF
      END FOR

      #create
      LET temp_action = 1
      FOR id = 1 TO inst_table_count 
        IF NOT fgl_find_table(table_name_list[id]) THEN  --only drop, if the table does exist
          CALL table_operation(table_name_list[id],temp_action,p_file_type) RETURNING err
        END IF
      END FOR

      #populate
      LET temp_action = 2
      FOR id = 1 TO inst_table_count 
        CALL table_operation(table_name_list[id],temp_action,p_file_type) RETURNING err
      END FOR
      

    ELSE
      #Note: must drop table in reversed order
      IF p_action = 0 THEN  --drop all tables
        FOR id = inst_table_count TO 1 STEP -1
        IF fgl_find_table(table_name_list[id]) THEN  --only drop, if the table does exist
          CALL table_operation(table_name_list[id],p_action,p_file_type) RETURNING err

          IF fgl_find_table(table_name_list[id]) THEN
            LET monitor = monitor, "\tCould NOT drop the table: ", trim(table_name_list[id]), "... \n"
            LET tmp_str = "Could not drop the table ", table_name_list[id]
            CALL fgl_winmessage("Could not drop table",tmp_str,"error")
            CALL display_monitor(monitor)
          END IF  
                    
        END IF
        END FOR
      ELSE
        FOR id = 1 TO inst_table_count 
          CALL table_operation(table_name_list[id],p_action,p_file_type) RETURNING err
        END FOR
      END IF

    END IF

    CALL db_state_report()
    LET monitor = add_monitor_str(monitor, tmp_str3,0)
    CALL display_monitor(monitor)
  ELSE
    CALL fgl_winmessage("Operation canceled",trim(tmp_str1) || " operation canceled on user request","info")
  END IF

  RETURN err
END FUNCTION


########################################################################
# FUNCTION table_selection_menu(p_action,p_file_type)
#
# Display table list for selection & apply action/operation
#
# RETURN err
########################################################################

FUNCTION table_selection_menu(p_action,p_file_type)
  DEFINE
    p_action   SMALLINT,
    tmp_str    VARCHAR(250),
    id         SMALLINT,
    err        SMALLINT,
    p_file_type SMALLINT

  IF fgl_fglgui() THEN
    CALL fgl_window_open("w_table_popup",5,5,"form/db-deploy_table_list_g",TRUE)
    CALL fgl_settitle("Table List")
  ELSE
    CALL fgl_window_open("w_table_popup",5,5,"form/db-deploy_table_list_t",TRUE)
  END IF

  CALL set_count(inst_table_count)
  LET int_flag = FALSE

  DISPLAY ARRAY table_name_list TO table_name_list.*
    --ATTRIBUTES(CURRENT ROW DISPLAY = "BLUE, REVERSE")

    AFTER DISPLAY
      LET id = arr_curr()
      
  END DISPLAY  

  CALL fgl_window_close("w_table_popup")

  IF int_flag THEN  --cancel
    #do nothing
    LET int_flag = FALSE
  ELSE
    CALL table_operation(table_name_list[id],p_action,p_file_type) RETURNING err
  END IF

  RETURN err
END FUNCTION


###########################################################
# FUNCTION validate_file_server_side_exists(p_filename, p_optional_str,p_dialog)
#
# FILE - Validate the existence of a file on the SERVER (with optional message)
#
# RETURN BOOLEAN
###########################################################
FUNCTION server_side_file_exists(p_filename)
  DEFINE 
    p_filename     VARCHAR(250),
    p_dialog       SMALLINT,
    tmp_str        VARCHAR(300),
    msg VARCHAR(200),
    rv  CHAR,
    ret              SMALLINT,
    local_debug      SMALLINT

  LET local_debug = FALSE

  LET rv = "E"
  LET ret = TRUE

  IF local_debug THEN
    DISPLAY "server_side_file_exists() - p_filename=", p_filename
  END IF

  WHILE TRUE 
    #Check if the file exists on the server
    IF fgl_test("e",p_filename) THEN
      IF local_debug THEN
        DISPLAY "server_side_file_exists() - file does exist=", p_filename
      END IF

      LET ret = TRUE
      EXIT WHILE

    ELSE  --file does not exist
      IF local_debug THEN
        DISPLAY "server_side_file_exists() - file does NOT exist=", p_filename
      END IF

      LET tmp_str = "Following file does not exist:\n", trim(p_filename)
      LET rv = fgl_winquestion ("Read/Import UNL/BAK Data",tmp_str,1,"Abort|Retry|Ignore","question",0)
      IF local_debug THEN
        DISPLAY "server_side_file_exists() - User choice ret=", rv
      END IF

      CASE rv
        WHEN "I" 
          LET ret = FALSE
          EXIT WHILE

        WHEN "A"
          EXIT PROGRAM

        WHEN "R" --Retry
          --simply re-run loop

        OTHERWISE
          LET tmp_str = "Error in server_side_file_exists()\nInvalid case rv value\nrv=", rv
          cALL fgl_winmessage("Error",rv,"error")
          EXIT PROGRAM
      END CASE
    END IF
  END WHILE

  IF local_debug THEN
    DISPLAY "server_side_file_exists() - RETURN ret=", ret
  END IF

  RETURN ret


END FUNCTION









