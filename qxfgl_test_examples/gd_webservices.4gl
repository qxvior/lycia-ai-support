#########################################################################################################
#! Web Services Demo
# settings.ws_name = Web Service Name,
# settings.ws_port = Web Service Port,
#
# Modification History:
# 01.03.06 HH - New Feature 'Lycia Web Services'
#########################################################################################################

#########################################################################################################
#! GLOBALS
#########################################################################################################
GLOBALS "gd_globals.4gl"

#########################################################################################################
#! MAIN
#########################################################################################################
FUNCTION web_service_demo()
  DEFINE inp_char CHAR
  DEFINE cms_cont_rec OF t_contact_ws_rec

  OPTIONS
    FORM LINE 2

  CALl ws_init_data() RETURNING cms_cont_rec.*
  CALL fgl_window_open("w_ws_contact_details",5,5,get_form_path("gd_f_ws_contact"),1)
  CALL fgl_settitle("Web Services Demo - Data Exchange with CMS")
  #CALL ws_display_contact_details(cms_cont_rec.*)

  WHILE TRUE
    PROMPT "" FOR CHAR inp_char HELP 1
      BEFORE PROMPT
        CALL publish_toolbar("ws_main",0)
      ON KEY(F5)  --edit data
        CALL ws_edit_contact_details(cms_cont_rec.*) RETURNING cms_cont_rec.*    
      ON KEY(F6) --display data
        CALL ws_display_contact_details(cms_cont_rec.*)
      ON KEY(F7) 
        CALL request_web_service_data() RETURNING cms_cont_rec.*
      ON KEY(F8)
        CALL send_web_service_data(cms_cont_rec.*)
      ON KEY(F11)  --Exit Web Service Demo
        EXIT WHILE
      AFTER PROMPT
        CALL publish_toolbar("ws_main",1)
    END PROMPT
  END WHILE

  CALL fgl_window_close("w_ws_contact_details")


  # Clean allocated memory
  # LOCATE cms_cont_rec.cont_picture IN MEMORY
  #FREE cms_cont_rec.cont_picture
  OPTIONS 
    FORM LINE 3

END FUNCTION


########################################################################
# FUNCTION ws_display_contact_details(cms_cont_rec)
#! Shows contact details
########################################################################
FUNCTION ws_display_contact_details(cms_cont_rec)
  DEFINE cms_cont_rec OF t_contact_ws_rec

  #DISPLAY cms_cont_rec.cont_id TO cont_id           -- INT,   --SERIAL(1000)
  DISPLAY cms_cont_rec.cont_title TO cont_title     -- CHAR(5),
  DISPLAY cms_cont_rec.cont_name TO cont_name       -- CHAR(20) NOT NULL,
  DISPLAY cms_cont_rec.cont_fname TO cont_fname     -- CHAR(20),
  DISPLAY cms_cont_rec.cont_lname TO cont_lname     -- CHAR(20),
  DISPLAY cms_cont_rec.cont_addr1 TO cont_addr1     -- CHAR(40),

  DISPLAY cms_cont_rec.cont_addr2 TO cont_addr2     -- CHAR(40),
  DISPLAY cms_cont_rec.cont_addr3 TO cont_addr3     -- CHAR(40),
  DISPLAY cms_cont_rec.cont_city TO cont_city       -- CHAR(20),
  DISPLAY cms_cont_rec.cont_zone TO cont_zone       -- CHAR(15),
  DISPLAY cms_cont_rec.cont_country TO cont_country -- CHAR(30),
  DISPLAY cms_cont_rec.cont_zip	TO cont_zip         -- CHAR(15),
  DISPLAY cms_cont_rec.cont_phone TO cont_phone     -- CHAR(15),

  DISPLAY cms_cont_rec.cont_fax TO cont_fax         -- CHAR(15),
  DISPLAY cms_cont_rec.cont_mobile TO cont_mobile   -- CHAR(15),

  DISPLAY cms_cont_rec.cont_email TO cont_email     -- CHAR(50),
  DISPLAY cms_cont_rec.comp_name TO comp_name     -- CHAR(50),
  DISPLAY cms_cont_rec.cont_notes TO cont_notes     -- CHAR(50),




  #DISPLAY cms_cont_rec.cont_dept TO cont_dept       -- CHAR(15),	# ref cont_dept_id
 # DISPLAY cms_cont_rec.comp_name TO comp_name -- INTEGER,	# ref company_id
{
 	cont_id 	INTEGER,
	cont_title	CHAR(10),
	cont_name 	CHAR(20),
	cont_fname 	CHAR(20),
	cont_lname 	CHAR(20),
	cont_addr1	CHAR(40),
	cont_addr2	CHAR(40),
	cont_addr3	CHAR(40),
	cont_city	CHAR(20),
	cont_zone	CHAR(15),
	cont_zip	CHAR(15),
	cont_country	CHAR(40),
	cont_phone	CHAR(15),
	cont_fax	CHAR(15),
	cont_mobile	CHAR(15),
	cont_email	CHAR(50),
	#cont_dept	CHAR(15),	# ref cont_dept_id
	cont_org	INTEGER,	# ref company_id
	cont_position	CHAR(15),	# ref position_id
	cont_picture	BYTE,
	cont_password	CHAR(15),
	cont_ipaddr	CHAR(15),	# IP V4
	cont_usemail	SMALLINT,
	cont_usephone	SMALLINT,
        cont_notes      CHAR(1000)
}
END FUNCTION


########################################################################
# FUNCTION ws_edit_contact_details(cms_cont_rec)
#! Edit contact details
########################################################################
FUNCTION ws_edit_contact_details(cms_cont_rec)
  DEFINE cms_cont_rec OF t_contact_ws_rec

  INPUT 
    cms_cont_rec.cont_name,
    cms_cont_rec.cont_title,      -- CHAR(5),
    cms_cont_rec.cont_fname,      -- CHAR(20),
    cms_cont_rec.cont_lname,      -- CHAR(20),
    cms_cont_rec.cont_addr1,      -- CHAR(40),
    cms_cont_rec.cont_addr2,      -- CHAR(40),
    cms_cont_rec.cont_addr3,      -- CHAR(40),
    cms_cont_rec.cont_city,       -- CHAR(20),
    cms_cont_rec.cont_zone,       -- CHAR(15),
    cms_cont_rec.cont_zip,	  -- CHAR(15),
    cms_cont_rec.cont_country,    -- CHAR(30),
    cms_cont_rec.cont_phone,      -- CHAR(15),
    cms_cont_rec.cont_mobile,     -- CHAR(15),
    cms_cont_rec.cont_fax,        -- CHAR(15),
    cms_cont_rec.cont_email,      -- CHAR(50),
    cms_cont_rec.comp_name,	
    cms_cont_rec.cont_notes

    WITHOUT DEFAULTS FROM 
      cont_name,         -- CHAR(20) NOT NULL,
      cont_title,        -- CHAR(5),
      cont_fname,        -- CHAR(20),
      cont_lname,        -- CHAR(20),
      cont_addr1,        -- CHAR(40),
      cont_addr2,        -- CHAR(40),
      cont_addr3,        -- CHAR(40),
      cont_city,         -- CHAR(20),
      cont_zone,         -- CHAR(15),
      cont_zip,          -- CHAR(15),
      cont_country,      -- CHAR(30),
      cont_phone,        -- CHAR(15),
      cont_mobile,       -- CHAR(15),
      cont_fax,          -- CHAR(15),
      cont_email,        -- CHAR(50),
      comp_name,    -- INTEGER,	# ref company_id
      cont_notes        --CHAR(1000)

    BEFORE INPUT
      CALL publish_toolbar("ws_edit",0)
    ON KEY(F2)
      CALL fgl_dialog_update_data()
      EXIT INPUT
    ON KEY(F3)
      EXIT INPUT

    AFTER INPUT
  END INPUT
  CALL ws_display_contact_details(cms_cont_rec.*)
  CALL publish_toolbar("ws_edit",1)

  RETURN cms_cont_rec.*

END FUNCTION


########################################################################
# FUNCTION ws_init_data()
# Initialize data for contact details
########################################################################
FUNCTION ws_init_data()
  DEFINE cms_cont_rec OF t_contact_ws_rec

  #LOCATE cms_cont_rec.cont_picture IN MEMORY

  #LET cms_cont_rec.cont_id = 1                -- INT,   --SERIAL(1000)
  LET cms_cont_rec.cont_name = "Name"         -- CHAR(20) NOT NULL,
  LET cms_cont_rec.cont_title = "Mr"       -- CHAR(5),
  LET cms_cont_rec.cont_fname = "First name"  -- CHAR(20),
  LET cms_cont_rec.cont_lname = "Last Name"   -- CHAR(20),
  LET cms_cont_rec.cont_addr1 = "Address 1"   -- CHAR(40),
  LET cms_cont_rec.cont_addr2 = "Address 2"   -- CHAR(40),
  LET cms_cont_rec.cont_addr3 = "Address 3"   -- CHAR(40),
  LET cms_cont_rec.cont_city = "City"         -- CHAR(20),
  LET cms_cont_rec.cont_zone = "Zone"         -- CHAR(15),
  LET cms_cont_rec.cont_zip = "ZIP"           -- CHAR(15),
  LET cms_cont_rec.cont_country = "Country"   -- CHAR(30),
  LET cms_cont_rec.cont_phone = "Phone"       -- CHAR(15),
  LET cms_cont_rec.cont_mobile = "Mobile"     -- CHAR(15),
  LET cms_cont_rec.cont_fax = "Fax"           -- CHAR(15),
  LET cms_cont_rec.cont_email = "Email"       -- CHAR(50),
  LET cms_cont_rec.comp_name = "Supernova Product"       -- CHAR(50),
  LET cms_cont_rec.cont_notes = "This is my super memo field text for testing"       -- CHAR(50),


  RETURN cms_cont_rec.*

END FUNCTION



########################################################################
#! FUNCTION request_web_service_data()
########################################################################
FUNCTION request_web_service_data()
  DEFINE cms_cont_rec OF t_contact_ws_rec
  DEFINE ws_service VARCHAR(255)
  DEFINE ws_port VARCHAR(255)
  DEFINE ws_operation VARCHAR(255)
  DEFINE err_string CHAR(1024)
  DEFINE local_debug SMALLINT

  LET local_debug = FALSE

  LET ws_port = "contact_wsSOAP11port_http"
  LET ws_service = "contact_ws"
  LET ws_operation = "ws_get_contact_rec"

#get_ws_port() #returns port
#get_ws_name() #returns name

  CALL fgl_ws_create("ws_request", ws_service, ws_port, ws_operation)
  CALL fgl_ws_setparameters("ws_request", 1)

  IF NOT fgl_ws_execute("ws_request") THEN
    LET err_string = "Web Service Failed:\n", fgl_ws_error("ws_request", "code"), "\nReason:\n", fgl_ws_error("ws_request", "reason")
    CALL fgl_message_box(err_string)
  ELSE 
    CALL fgl_ws_getdata("ws_request")
      RETURNING cms_cont_rec.*
  END IF

  --LET err_string = fgl_ws_call("simple", "simpleSOAP11port_http", "simple", "Hello") elto commented fgl_ws_call(), as it has not yet been implemented
  CALL fgl_message_box(err_string)


  IF local_debug THEN
    DISPLAY "cms_cont_rec.cont_name = " ,  cms_cont_rec.cont_name         -- CHAR(20) NOT NULL,
    DISPLAY "cms_cont_rec.cont_title = ",  cms_cont_rec.cont_title       -- CHAR(5),
    DISPLAY "cms_cont_rec.cont_fname = ",  cms_cont_rec.cont_fname       -- CHAR(20),
    DISPLAY "cms_cont_rec.cont_lname = ",  cms_cont_rec.cont_lname       -- CHAR(20),
    DISPLAY "cms_cont_rec.cont_addr1 = ",  cms_cont_rec.cont_addr1       -- CHAR(40),
    DISPLAY "cms_cont_rec.cont_addr2 = ",  cms_cont_rec.cont_addr2       -- CHAR(40),
    DISPLAY "cms_cont_rec.cont_addr3 = ",  cms_cont_rec.cont_addr3       -- CHAR(40),
    DISPLAY "cms_cont_rec.cont_city = ",   cms_cont_rec.cont_city        -- CHAR(20),
    DISPLAY "cms_cont_rec.cont_zone = ",   cms_cont_rec.cont_zone        -- CHAR(15),
    DISPLAY "cms_cont_rec.cont_zip = ",    cms_cont_rec.cont_zip         -- CHAR(15),
    DISPLAY "cms_cont_rec.cont_country = ",cms_cont_rec.cont_country     -- CHAR(30),
    DISPLAY "cms_cont_rec.cont_phone = ",  cms_cont_rec.cont_phone       -- CHAR(15),
    DISPLAY "cms_cont_rec.cont_mobile = ", cms_cont_rec.cont_mobile      -- CHAR(15),
    DISPLAY "cms_cont_rec.cont_fax = ",    cms_cont_rec.cont_fax         -- CHAR(15),
    DISPLAY "cms_cont_rec.cont_email = ",  cms_cont_rec.cont_email       -- CHAR(50),
    DISPLAY "cms_cont_rec.comp_name = ",   cms_cont_rec.comp_name        -- CHAR(50),
    DISPLAY "cms_cont_rec.cont_notes = ",  cms_cont_rec.cont_notes       -- CHAR(50),
  END IF



  CALL fgl_ws_close("ws_request")
  
  RETURN cms_cont_rec.*
END FUNCTION


########################################################################
#! FUNCTION send_web_service_data(cms_cont_rec)
########################################################################
FUNCTION send_web_service_data(cms_cont_rec)
  DEFINE cms_cont_rec OF t_contact_ws_rec
  DEFINE err_string CHAR(1024)
  DEFINE customer_id INTEGER

{
  CALL fgl_ws_create("ws_send", "ws_send_contact_rec", "ws_send_contact_recSOAP12port_http", "ws_send_contact_rec")
  CALL fgl_ws_setparameters("ws_send", cms_cont_rec.*)

  IF NOT fgl_ws_execute("ws_send") THEN
    LET err_string = "Web Service Failed:\n", fgl_ws_error("ws_send", "code"), "\nReason:\n", fgl_ws_error("ws_send", "reason")
    CALL fgl_message_box(err_string)
  ELSE
    CALL fgl_ws_getdata("ws_send")
      RETURNING customer_id
  END IF

  CALL fgl_ws_close("ws_send")
}
END FUNCTION

