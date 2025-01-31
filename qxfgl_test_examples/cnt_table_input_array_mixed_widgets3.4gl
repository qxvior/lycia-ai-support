DEFINE t_rec_contact TYPE AS
	RECORD
#		id int,
		fname VARCHAR(20),
		lname VARCHAR(20),
		email VARCHAR(30),
		gender CHAR(1),
		driving BOOLEAN
	END RECORD

DEFINE t_rec_contact2 TYPE AS
	RECORD
		id int,
		fname VARCHAR(20),
		lname VARCHAR(20),
    dob DATE,		
		email VARCHAR(30),
		gender SMALLINT,
		personality SMALLINT,
		priority SMALLINT,
		driving BOOLEAN
	END RECORD

DEFINE rec_guidemo_contact TYPE AS
 RECORD
    cust_id INTEGER, 
    cust_title VARCHAR(10),
    cust_fname VARCHAR(20),
    cust_lname VARCHAR(20),

    cust_dob DATE,
    cust_email VARCHAR(100),
    cust_url VARCHAR(200),

    cust_address1 STRING,
    cust_address2 STRING,
    cust_address3 STRING,
    cust_post_code STRING,        
    cust_country VARCHAR(20),

    cust_re INTEGER,
    cust_rp INTEGER,
    cust_rl INTEGER,
    cust_type SMALLINT,
    cust_memo CHAR(5000),
    cust_picture STRING
  END RECORD
  
DEFINE rec_contact OF t_rec_contact
DEFINE arrRec_contactMorphed DYNAMIC ARRAY OF t_rec_contact2


######################################################################
# MAIN
#
#
######################################################################
MAIN
	DEFINE i SMALLINT
	DEFINE msg STRING
	DEFINE idx SMALLINT	
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	CALL ui_init()
	

		
	OPEN WINDOW wContact WITH FORM "form/cnt_table_input_array_mixed_widgets3"
  CALL fgl_settitle("Table Container Input Array with mixed widgets Demo Example 3")
	CALL ui.Interface.setText("InpArr")
	DISPLAY "Input Array with mixed widgets - Demo 2" TO lbTitle
	
	CALL init_data()

	DISPLAY arrRec_contactMorphed.getlength() TO lbArrCnt
	
	INPUT ARRAY arrRec_contactMorphed WITHOUT DEFAULTS FROM scr_contact2.* ATTRIBUTE(UNBUFFERED)
		BEFORE INPUT
			CALL fgl_dialog_setkeylabel("firstrow","")
			CALL fgl_dialog_setkeylabel("prevpage","")
			CALL fgl_dialog_setkeylabel("nextpage","")
			CALL fgl_dialog_setkeylabel("lastrow","")			
			CALL fgl_dialog_setkeylabel("doubleClick","")			
							
		BEFORE ROW
			LET idx = arr_curr()
			DISPLAY idx TO lbCurrentRow	
	
		AFTER INSERT
			LET arrRec_contactMorphed[idx].id = 1000 + arrRec_contactMorphed.getlength() 
		
		ON ACTION "DISPLAY"
			FOR i = 1 TO arrRec_contactMorphed.getlength()
				DISPLAY arrRec_contactMorphed[i].*
			END FOR
		
		ON ACTION "sendEmail"
			LET msg = "Send E-mail to\n", trim(arrRec_contactMorphed[idx].fname), " ", trim(arrRec_contactMorphed[idx].lname), " ", trim(arrRec_contactMorphed[idx].email), "\nWould be nice to be able to send emails"
			CALL fgl_winmessage("send email",msg, "info")

		ON ACTION "doubleClick"
			LET msg = "ID: ", trim(arrRec_contactMorphed[idx].id), "\n"
			LET msg = msg, "First Name: ", trim(arrRec_contactMorphed[idx].fname), "\n"
			LET msg = msg, "LastName: ", trim(arrRec_contactMorphed[idx].lname), "\n"
			LET msg = msg, "E-mail Address: ", trim(arrRec_contactMorphed[idx].email), "\n"
			IF arrRec_contactMorphed[idx].gender = 'm' THEN
				LET msg = msg, "Gender: ", "Male", "\n"
			ELSE
				LET msg = msg, "Gender: ", "Female", "\n"
			END IF

			IF arrRec_contactMorphed[idx].driving = 1 THEN
				LET msg = msg, "Driving License: ", "Yes", "\n"
			ELSE
				LET msg = msg, "Driving License: ", "No", "\n"
			END IF
			
			CALL fgl_winmessage("Contact Details",msg,"info")

		ON ACTION "act_call_contact"
			LET msg = "The phone is ringing but ", trim(arrRec_contactMorphed[idx].fname), " ", trim(arrRec_contactMorphed[idx].lname), " does not answer your call !"
			CALL fgl_winmessage("Phone is ringing",msg, "info") 		
	END INPUT	

END MAIN

#############################################################################
# FUNCTION morph_contactRec(id)
#
#
#############################################################################
FUNCTION morph_contactRec(id,p_rec_guidemo_cust)
	DEFINE id SMALLINT
	DEFINE p_rec_guidemo_cust OF rec_guidemo_contact
		
	LET arrRec_contactMorphed[id].id = p_rec_guidemo_cust.cust_id
	LET arrRec_contactMorphed[id].fname = p_rec_guidemo_cust.cust_fname
	LET arrRec_contactMorphed[id].lname = p_rec_guidemo_cust.cust_lname
	LET arrRec_contactMorphed[id].dob = p_rec_guidemo_cust.cust_dob
	
	LET arrRec_contactMorphed[id].email = p_rec_guidemo_cust.cust_email
	LET arrRec_contactMorphed[id].gender = p_rec_guidemo_cust.cust_rp
	LET arrRec_contactMorphed[id].personality = p_rec_guidemo_cust.cust_type
	LET arrRec_contactMorphed[id].priority = p_rec_guidemo_cust.cust_rl
		
	LET arrRec_contactMorphed[id].driving = p_rec_guidemo_cust.cust_re
		
END FUNCTION



######################################################################
# FUNCTION init_data()
#
#
######################################################################
FUNCTION init_data()
	DEFINE i SMALLINT
	DEFINE l_rec_guidemo_contact OF rec_guidemo_contact
	
  CALL fgl_channel_open_file("stream", "unl/sample_table.unl", "r")
  CALL fgl_channel_set_delimiter("stream","|")

  LET i = 1

  WHILE fgl_channel_read("stream",l_rec_guidemo_contact.*)
  	CALL morph_contactRec(i,l_rec_guidemo_contact.*) 
    LET i = i + 1
  END WHILE

END FUNCTION
