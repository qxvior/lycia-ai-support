
############################################################
#! Globals
############################################################
GLOBALS "gd_globals.4gl"

	DEFINE l_message VARCHAR(240)
	DEFINE l_icon VARCHAR(20)

  DEFINE   f_TabPageName ARRAY[7] OF STRING --simple

	DEFINE twm_f_title VARCHAR(100), twm_f_message STRING, twm_f_icon VARCHAR(20)       
	DEFINE twq_f_title VARCHAR(100), twq_f_message STRING, twq_f_icon VARCHAR(20)
	DEFINE twb_f_title VARCHAR(100), twb_f_message STRING, twb_f_icon VARCHAR(20)         
	DEFINE twp_f_message STRING, twp_f_datatype INTEGER, twp_f_char_value VARCHAR(40), twp_f_sint_value SMALLINT, twp_f_int_value INTEGER, twp_f_in_len INTEGER   
	DEFINE tmb_f_title VARCHAR(50), tmb_f_message VARCHAR(240), tmb_f_buttons INTEGER    
	DEFINE tem_f_message  VARCHAR(100)
	DEFINE tmm_f_message  VARCHAR(100)	
	DEFINE f_currentTabPage STRING
	
	DEFINE activeTab SMALLINT
	
############################################################
#! Test different message box styles
############################################################
FUNCTION msgbox_form()

  CALL fgl_window_open("w_msgbox",1,1,"form/gd_f_msg_dialog_2_2",FALSE)

  #CALL fgl_form_open("f_winbutton",get_form_path("gd_f_msg_winbutton"))
  #CALL fgl_form_open("f_winprompt",get_form_path("gd_f_msg_winprompt"))
  #CALL fgl_form_open("f_winmessage",get_form_path("gd_f_msg_winmessage"))
  #CALL fgl_form_open("f_winquestion",get_form_path("gd_f_msg_winquestion"))
  #CALL fgl_form_open("f_mbox", get_form_path("gd_f_msg_mbox"))
  #CALL fgl_form_open("f_4gl_error",get_form_path("gd_f_msg_4gl_error"))
  #CALL fgl_form_open("f_4gl_message",get_form_path("gd_f_msg_4gl_message"))

  CALL input_loop()

  CALL fgl_window_close("w_msgbox")
END FUNCTION

##############################################################
# FUNCTION input_loop()
#! Initialize work with different message boxes
##############################################################
FUNCTION input_loop()
  DEFINE
    cur_function SMALLINT,
    inp_char CHAR,
    #p_style SMALLINT,
    #l_title VARCHAR(50),
    #l_message VARCHAR(240),
    #l_icon VARCHAR(20),
    l_value VARCHAR(20),
    ret SMALLINT

	
      
   
	LET f_TabPageName[1] = "fgl_winmessage()"
	LET f_TabPageName[2] = "fgl_winquestion()"
	LET f_TabPageName[3] = "fgl_winbutton()"		
	LET f_TabPageName[4] = "fgl_winprompt()"
	LET f_TabPageName[5] = "fgl_messagebox()"
	LET f_TabPageName[6] = "4GL ERROR Statement"
	LET f_TabPageName[7] = "4GL MESSAGE Statement"			

    LET activeTab = 1
    DISPLAY f_TabPageName[activeTab] TO f_currentTabPage
    
	CALL init_dialogBox_data()  --init the input data variables
			    
	DIALOG ATTRIBUTE(UNBUFFERED)
		#fgl_winmessage()
  	INPUT BY NAME twm_f_title, twm_f_message, twm_f_icon
    	WITHOUT DEFAULTS
    	HELP 3
    	
			ON ACTION actShow_fgl_winmessage
      	CALL fgl_dialog_update_data()
      	LET twm_f_icon = get_fldbuf(twm_f_icon)
      	LET twm_f_title = get_fldbuf(twm_f_title)
      	LET twm_f_message = get_fldbuf(twm_f_message)
      	CALL fgl_winmessage(twm_f_title, twm_f_message, twm_f_icon)			
			
			ON KEY("F2")
      	CALL fgl_dialog_update_data()
      	LET twm_f_icon = get_fldbuf(twm_f_icon)
      	LET twm_f_title = get_fldbuf(twm_f_title)
      	LET twm_f_message = get_fldbuf(twm_f_message)
      	CALL fgl_winmessage(twm_f_title, twm_f_message, twm_f_icon)
        #RETURNING l_value
      #CALL show_user_data(l_value)         			    	
    END INPUT

		#fgl_winquestion()
  	INPUT BY NAME twq_f_title, twq_f_message, twq_f_icon
    	WITHOUT DEFAULTS
    	HELP 3
 			
			ON KEY (F2)
				CALL fgl_dialog_update_data()
				LET twq_f_icon = get_fldbuf(twq_f_icon)
				LET twq_f_title = get_fldbuf(twq_f_title)
				LET twq_f_message = get_fldbuf(twq_f_message)

				CALL fgl_winquestion(twq_f_title, twq_f_message, "Yes", "Yes|No|Cancel", twq_f_icon, 0)
        RETURNING l_value
				CALL show_user_data(l_value)    	
    END INPUT
    

		#fgl_winbutton()
  	INPUT BY NAME twb_f_title, twb_f_message, twb_f_icon
    	WITHOUT DEFAULTS
    	HELP 3

			ON KEY (F2)
				CALL fgl_dialog_update_data()
				LET twb_f_icon = get_fldbuf(twb_f_icon)
				LET twb_f_title = get_fldbuf(twb_f_title)
				LET twb_f_message = get_fldbuf(twb_f_message)

				CALL fgl_winbutton(twb_f_title, twb_f_message, "Yes", "Yes|No|Cancel", twb_f_icon, 0)
				RETURNING l_value
				CALL show_user_data(l_value)
    END INPUT   
     

		#fgl_winprompt()
  	INPUT BY NAME twp_f_message, twp_f_datatype, twp_f_int_value, twp_f_sint_value, twp_f_char_value, twp_f_in_len
    	WITHOUT DEFAULTS
     	HELP 3
    	

    ON KEY (F2)
      CALL fgl_dialog_update_data()
      LET twp_f_datatype = get_fldbuf(twp_f_datatype)
      LET twp_f_message = get_fldbuf(twp_f_message)
      LET twp_f_in_len = get_fldbuf(twp_f_in_len)

      CASE twp_f_datatype
        WHEN 0  --Char
          CALL fgl_winprompt(3, 3, twp_f_message, twp_f_char_value, twp_f_in_len, twp_f_datatype)
            RETURNING twp_f_char_value
          DISPLAY twp_f_char_value TO returnValue   ATTRIBUTE(RED,BOLD,UNDERLINE)
          CALL show_user_data(twp_f_char_value)


        WHEN 1  --SmallInt
          CALL fgl_winprompt(3, 3, twp_f_message, twp_f_sint_value, twp_f_in_len, twp_f_datatype)
            RETURNING twp_f_sint_value
          DISPLAY twp_f_sint_value TO returnValue   ATTRIBUTE(RED,BOLD,UNDERLINE)
          CALL show_user_data(twp_f_sint_value)

        WHEN 2  --Integer
          CALL fgl_winprompt(3, 3, twp_f_message, twp_f_int_value, twp_f_in_len, twp_f_datatype)
            RETURNING twp_f_int_value
          DISPLAY twp_f_int_value TO returnValue  ATTRIBUTE(RED,BOLD,UNDERLINE)
          CALL show_user_data(twp_f_int_value)

        OTHERWISE
          CALL fgl_winmessage(get_str(30),"Invalid datatype value " || twp_f_datatype, "error")
      END CASE  
      
      CALL ui.Interface.refresh()
      	
    END INPUT     
	
		
	
		#fgl_message_box()
  	INPUT BY NAME tmb_f_title, tmb_f_message, tmb_f_buttons
    	WITHOUT DEFAULTS
    	HELP 3

			ON KEY (F2)
			CALL fgl_dialog_update_data()
			LET tmb_f_title = get_fldbuf(tmb_f_title)
			LET tmb_f_message = get_fldbuf(tmb_f_message)
			LET tmb_f_buttons = get_fldbuf(tmb_f_buttons)
			CALL fgl_message_box(tmb_f_title, tmb_f_message, tmb_f_buttons)
          	
    END INPUT
    

		#ERROR
  	INPUT BY NAME tem_f_message
    	WITHOUT DEFAULTS
    	HELP 2


			ON KEY (F2)
				CALL fgl_dialog_update_data()
				LET tem_f_message = get_fldbuf(tem_f_message)
				ERROR tem_f_message   
				 	
		END INPUT
    

		#MESSAGE
  	INPUT BY NAME tmm_f_message
    	WITHOUT DEFAULTS
    	HELP 3

			ON ACTION actShow_4gl_message
				CALL fgl_dialog_update_data()
				LET tmm_f_message = get_fldbuf(tmm_f_message)
				MESSAGE tmm_f_message  
							
			ON KEY (F2)
				CALL fgl_dialog_update_data()
				LET tmm_f_message = get_fldbuf(tmm_f_message)
				MESSAGE tmm_f_message  
				  	
		END INPUT
		
		
    
		#ON KEY("F11")
        ON ACTION "actExitModule"
			EXIT DIALOG    

		ON ACTION act_twmShown
			LET activeTab = 1
			#LET f_currentTabPage = f_TabPageName[1] 
			DISPLAY f_TabPageName[1] TO f_currentTabPage			
			NEXT FIELD twm_f_title

			

		ON ACTION act_twqShown
			LET activeTab = 2		
			#LET f_currentTabPage = f_TabPageName[2] 
			DISPLAY f_TabPageName[2] TO f_currentTabPage					
			NEXT FIELD twq_f_title


		ON ACTION act_twbShown
			LET activeTab = 3		
			#LET f_currentTabPage = f_TabPageName[3] 
			DISPLAY f_TabPageName[3] TO f_currentTabPage		
			NEXT FIELD twb_f_title	


		ON ACTION act_twpShown
			LET activeTab = 4	
			#LET f_currentTabPage = f_TabPageName[4] 
			DISPLAY f_TabPageName[4] TO f_currentTabPage					
			NEXT FIELD twp_f_message

			
		ON ACTION act_tmbShown  --fgl_messageBox()
			LET activeTab = 5			
			#LET f_currentTabPage = f_TabPageName[5] 
			DISPLAY f_TabPageName[5] TO f_currentTabPage	
			NEXT FIELD tmb_f_title
			
			
		ON ACTION act_temShown  --4gl error message
			LET activeTab = 6						
			#LET f_currentTabPage = f_TabPageName[6] 
			DISPLAY f_TabPageName[6] TO f_currentTabPage
			NEXT FIELD tem_f_message
						
		ON ACTION act_tmmShown  --4gl MESSAGE message
			LET activeTab = 7						
			#LET f_currentTabPage = f_TabPageName[6] 
			DISPLAY f_TabPageName[7] TO f_currentTabPage
			NEXT FIELD tmm_f_message
						
		ON KEY (F13)
			NEXT FIELD twm_f_title
			

		ON KEY (F14)
			NEXT FIELD twq_f_title


		ON KEY (F15)
			NEXT FIELD twb_f_title


		ON KEY (F16)
			NEXT FIELD twp_f_message									

		ON KEY (F17)
			NEXT FIELD tmb_f_title

		ON KEY (F18)
			NEXT FIELD tem_f_message
			

		ON KEY (F19)
			NEXT FIELD tmm_f_message

																		
     AFTER DIALOG
      CALL publish_toolbar("msg_box",1)
      			  
  END DIALOG   
    
    
    

{
	#we simulate a F211 key press / put it in the queue
  CALL fgl_key_queue(fgl_keyval("F211"))
  LET loop = 1
  WHILE loop != 0

    PROMPT "" FOR CHAR inp_char  HELP 2 --CASE cur_function
    BEFORE PROMPT
      CALL publish_toolbar("msg_box",0)

      ON KEY("F211") --WHEN 0
        LET loop = do_winmessage()
      ON KEY("F212") --WHEN 1
        LET loop = do_winquestion()
      ON KEY("F213") --WHEN 2
        LET loop = do_winbutton()
      ON KEY("F214") --WHEN 3
        LET loop = do_winprompt()
      ON KEY("F215") --WHEN 4
        LET loop = do_mbox()
      ON KEY("F216") --WHEN 4
        LET loop = do_4gl_error()
      ON KEY("F217") --WHEN 4
        LET loop = do_4gl_message()

      ON KEY("F11")
        LET loop = 0

      AFTER PROMPT
      CALL publish_toolbar("msg_box",1)
    END PROMPT

  END WHILE
  }
END FUNCTION
{

############################################################
# FUNCTION init_buttons()
############################################################
FUNCTION init_buttons()
  DISPLAY "!" TO fb_winmessage
  DISPLAY "!" TO fb_winquestion
  DISPLAY "!" TO fb_winbutton
  DISPLAY "!" TO fb_winprompt
  DISPLAY "!" TO fb_mbox
  DISPLAY "!" TO fb_error
  DISPLAY "!" TO fb_message
  DISPLAY "!" TO fb_close
  DISPLAY "!" TO fb_ok

END FUNCTION
}
{
############################################################
# FUNCTION do_winmessage()
############################################################
FUNCTION do_winmessage()
  DEFINE 
    p_style SMALLINT,
    l_title VARCHAR(50),
    l_message VARCHAR(240),
    l_icon VARCHAR(20),
    l_value VARCHAR(20),
    ret SMALLINT

  LET ret = 1

  #CALL fgl_form_display("f_winmessage")

  #DISPLAY "!" TO fb_winmessage
  DISPLAY "!" TO fb_winquestion
  DISPLAY "!" TO fb_winbutton
  DISPLAY "!" TO fb_winprompt
  DISPLAY "!" TO fb_mbox
  DISPLAY "!" TO fb_error
  DISPLAY "!" TO fb_message
  DISPLAY "!" TO fb_close
  DISPLAY "!" TO fb_ok

  LET l_title = get_str(410)  --fgl_winmessage() Message Box Title
  LET l_message = get_str(411)
  LET l_icon = get_str(412)

  INPUT l_title, l_message, l_icon
    WITHOUT DEFAULTS
    FROM f_title, f_message, f_icon
    HELP 2

    BEFORE INPUT
      CALL publish_toolbar("msg_box",0) 

    ON KEY (F2)
      CALL fgl_dialog_update_data()
      LET l_icon = get_fldbuf(f_icon)
      LET l_title = get_fldbuf(f_title)
      LET l_message = get_fldbuf(f_message)
      CALL fgl_winmessage(l_title, l_message, l_icon)

    ON KEY (F212) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F212"))
      EXIT INPUT
    ON KEY (F213)  --fgl_winbutton()
      CALL fgl_key_queue(fgl_keyval("F213"))
      EXIT INPUT
    ON KEY (F214)  --fgl_winprompt()
      CALL fgl_key_queue(fgl_keyval("F214"))
      EXIT INPUT
    ON KEY (F215)  --fgl_messagebox()
      CALL fgl_key_queue(fgl_keyval("F215"))
      EXIT INPUT
    ON KEY (F216)  --4GL ERROR
      CALL fgl_key_queue(fgl_keyval("F216"))
      EXIT INPUT
    ON KEY (F217)  -- 4GL MESSAGE
      CALL fgl_key_queue(fgl_keyval("F217"))
      EXIT INPUT
    ON KEY (F11)  -- EXIT
      LET ret = 0
      EXIT INPUT

    AFTER INPUT
      CALL publish_toolbar("msg_box",1) 

  END INPUT

  RETURN ret

END FUNCTION
}
{
############################################################
# FUNCTION do_winquestion()
############################################################
FUNCTION do_winquestion()
  DEFINE 
    p_style SMALLINT,
    l_title VARCHAR(50),
    l_message VARCHAR(240),
    l_icon VARCHAR(20),
    l_value VARCHAR(20),
    ret SMALLINT

  #CALL fgl_form_display("f_winquestion")

  LET ret = 1

  DISPLAY "!" TO fb_winmessage
  #DISPLAY "!" TO fb_winquestion
  DISPLAY "!" TO fb_winbutton
  DISPLAY "!" TO fb_winprompt
  DISPLAY "!" TO fb_mbox
  DISPLAY "!" TO fb_error
  DISPLAY "!" TO fb_message
  DISPLAY "!" TO fb_close
  DISPLAY "!" TO fb_ok

  LET l_title = get_str(420)    --"fgl_winquestion() Message Box Title"
  LET l_message = get_str(421)  --"fgl_winquestion() Message text"
  LET l_icon = get_str(422)     --"info"

  INPUT l_title, l_message, l_icon
    WITHOUT DEFAULTS
    FROM f_title, f_message, f_icon
    HELP 2

    BEFORE INPUT
      CALL publish_toolbar("msg_box",0)

    ON KEY (F2)
      CALL fgl_dialog_update_data()
      LET l_icon = get_fldbuf(f_icon)
      LET l_title = get_fldbuf(f_title)
      LET l_message = get_fldbuf(f_message)

      CALL fgl_winquestion(l_title, l_message, "Yes", "Yes|No|Cancel", l_icon, 0)
        RETURNING l_value
      CALL show_user_data(l_value)


    ON KEY (F211) --fgl_winmessage()
      CALL fgl_key_queue(fgl_keyval("F211"))
      EXIT INPUT
#   ON KEY (F212) --fgl_winquestion()
#     CALL fgl_key_queue(fgl_keyval("F212"))
#     EXIT INPUT
    ON KEY (F213)  --fgl_winbutton()
      CALL fgl_key_queue(fgl_keyval("F213"))
      EXIT INPUT
    ON KEY (F214)  --fgl_winprompt()
      CALL fgl_key_queue(fgl_keyval("F214"))
      EXIT INPUT
    ON KEY (F215)  --fgl_messagebox()
      CALL fgl_key_queue(fgl_keyval("F215"))
      EXIT INPUT
    ON KEY (F216)  --4GL ERROR
      CALL fgl_key_queue(fgl_keyval("F216"))
      EXIT INPUT
    ON KEY (F217)  -- 4GL MESSAGE
      CALL fgl_key_queue(fgl_keyval("F217"))
      EXIT INPUT
    ON KEY (F11)  -- EXIT
      LET ret = 0
    
      EXIT INPUT

    AFTER INPUT
      CALL publish_toolbar("msg_box",1)
  END INPUT

  RETURN ret


END FUNCTION

}
{
############################################################
# FUNCTION do_winbutton()
############################################################
FUNCTION do_winbutton()
  DEFINE 
    p_style SMALLINT,
    l_title VARCHAR(50),
    l_message VARCHAR(240),
    l_icon VARCHAR(20),
    l_value VARCHAR(20),
    ret SMALLINT

  #CALL fgl_form_display("f_winbutton")

  LET ret = 1

  DISPLAY "!" TO fb_winmessage
  DISPLAY "!" TO fb_winquestion
  #DISPLAY "!" TO fb_winbutton
  DISPLAY "!" TO fb_winprompt
  DISPLAY "!" TO fb_mbox
  DISPLAY "!" TO fb_error
  DISPLAY "!" TO fb_message
  DISPLAY "!" TO fb_close
  DISPLAY "!" TO fb_ok

  LET l_title = get_str(430)      --"fgl_winbutton() Message Box Title"
  LET l_message = get_str(431)    --"fgl_winbutton() Message text"
  LET l_icon = get_str(432)       --"info"

  INPUT l_title, l_message, l_icon
    WITHOUT DEFAULTS
    FROM f_title, f_message, f_icon
    HELP 2

    BEFORE INPUT
      CALL publish_toolbar("msg_box",0)

    ON KEY (F2)
      CALL fgl_dialog_update_data()
      LET l_icon = get_fldbuf(f_icon)
      LET l_title = get_fldbuf(f_title)
      LET l_message = get_fldbuf(f_message)

      CALL fgl_winbutton(l_title, l_message, "Yes", "Yes|No|Cancel", l_icon, 0)
        RETURNING l_value
      CALL show_user_data(l_value)


    ON KEY (F211) --fgl_winmessage()
      CALL fgl_key_queue(fgl_keyval("F211"))
      EXIT INPUT
    ON KEY (F212) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F212"))
      EXIT INPUT
#   ON KEY (F213)  --fgl_winbutton()
#     CALL fgl_key_queue(fgl_keyval("F213"))
#     EXIT INPUT
    ON KEY (F214)  --fgl_winprompt()
      CALL fgl_key_queue(fgl_keyval("F214"))
      EXIT INPUT
    ON KEY (F215)  --fgl_messagebox()
      CALL fgl_key_queue(fgl_keyval("F215"))
      EXIT INPUT
    ON KEY (F216)  --4GL ERROR
      CALL fgl_key_queue(fgl_keyval("F216"))
      EXIT INPUT
    ON KEY (F217)  -- 4GL MESSAGE
      CALL fgl_key_queue(fgl_keyval("F217"))
      EXIT INPUT
    ON KEY (F11)  -- EXIT
      LET ret = 0
      EXIT INPUT

    AFTER INPUT
      CALL publish_toolbar("msg_box",1)
  END INPUT

  RETURN ret

END FUNCTION
}

{
############################################################
# FUNCTION do_winprompt()
############################################################
FUNCTION do_winprompt()
  DEFINE
    l_message VARCHAR(240),
    l_datatype INTEGER,
    l_in_len INTEGER,
    l_char_value VARCHAR(40), --0
    l_sint_value SMALLINT,    --1
    l_int_value INTEGER,      --2
    ret SMALLINT

  #CALL fgl_form_display("f_winprompt")

  LET ret = 1

  DISPLAY "!" TO fb_winmessage
  DISPLAY "!" TO fb_winquestion
  DISPLAY "!" TO fb_winbutton
  #DISPLAY "!" TO fb_winprompt
  DISPLAY "!" TO fb_mbox
  DISPLAY "!" TO fb_error
  DISPLAY "!" TO fb_message
  DISPLAY "!" TO fb_close
  DISPLAY "!" TO fb_ok

  --LET l_title = "The Prompt Title"
  LET l_message = get_str(440)  --"The Prompt Question"
  LET l_datatype = 2
  LET l_in_len = 10
  LET l_char_value = get_str(441)  --"Default val"
  LET l_sint_value = 20000
  LET l_int_value  = 60000

  INPUT l_message, l_datatype, l_char_value, l_sint_value, l_int_value, l_in_len
    WITHOUT DEFAULTS
    FROM f_message, f_datatype, f_char_value, f_sint_value, f_int_value,f_in_len
    HELP 2

    BEFORE INPUT
      CALL publish_toolbar("msg_box",0)

    ON KEY (F2)
      CALL fgl_dialog_update_data()
      LET l_datatype = get_fldbuf(f_datatype)
      LET l_message = get_fldbuf(f_message)
      LET l_in_len = get_fldbuf(f_in_len)

      CASE l_datatype
        WHEN 0  --Char
          CALL fgl_winprompt(3, 3, l_message, l_char_value, l_in_len, l_datatype)
            RETURNING l_char_value
          DISPLAY "CHAR return value-->", l_char_value, "<--" AT 16,5  ATTRIBUTE(RED,BOLD,UNDERLINE)
          CALL show_user_data(l_char_value)


        WHEN 1  --SmallInt
          CALL fgl_winprompt(3, 3, l_message, l_sint_value, l_in_len, l_datatype)
            RETURNING l_sint_value
          DISPLAY "SMALLINT return value-->", l_sint_value, "<--" AT 16,5  ATTRIBUTE(RED,BOLD,UNDERLINE)
          CALL show_user_data(l_sint_value)

        WHEN 2  --Integer
          CALL fgl_winprompt(3, 3, l_message, l_int_value, l_in_len, l_datatype)
            RETURNING l_int_value
          DISPLAY "INTEGER return value-->", l_int_value, "<--" AT 16,5  ATTRIBUTE(RED,BOLD,UNDERLINE)
          CALL show_user_data(l_int_value)

        OTHERWISE
          CALL fgl_winmessage(get_str(30),"Invalid datatype value " || l_datatype, "error")
      END CASE

    ON KEY (F211) --fgl_winmessage()
      CALL fgl_key_queue(fgl_keyval("F211"))
      EXIT INPUT
    ON KEY (F212) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F212"))
      EXIT INPUT
    ON KEY (F213)  --fgl_winbutton()
      CALL fgl_key_queue(fgl_keyval("F213"))
      EXIT INPUT
#   ON KEY (F214)  --fgl_winprompt()
#     CALL fgl_key_queue(fgl_keyval("F214"))
#     EXIT INPUT
    ON KEY (F215)  --fgl_messagebox()
      CALL fgl_key_queue(fgl_keyval("F215"))
      EXIT INPUT
    ON KEY (F216)  --4GL ERROR
      CALL fgl_key_queue(fgl_keyval("F216"))
      EXIT INPUT
    ON KEY (F217)  -- 4GL MESSAGE
      CALL fgl_key_queue(fgl_keyval("F217"))
      EXIT INPUT
    ON KEY (F11)  -- EXIT
      LET ret = 0
      EXIT INPUT

    AFTER INPUT
      CALL publish_toolbar("msg_box",1)

  END INPUT

  RETURN ret
END FUNCTION


############################################################
# FUNCTION do_mbox()
############################################################
FUNCTION do_mbox()
  DEFINE 
    l_title VARCHAR(50),
    l_message VARCHAR(240),
    l_buttons INTEGER,
    ret SMALLINT

  #CALL fgl_form_display("f_mbox")

  LET ret = 1

  DISPLAY "!" TO fb_winmessage
  DISPLAY "!" TO fb_winquestion
  DISPLAY "!" TO fb_winbutton
  DISPLAY "!" TO fb_winprompt
  #DISPLAY "!" TO fb_mbox
  DISPLAY "!" TO fb_error
  DISPLAY "!" TO fb_message
  DISPLAY "!" TO fb_close
  DISPLAY "!" TO fb_ok

  LET l_title = get_str(450)    --"Message Box Title"
  LET l_message = get_str(451)  --"Message body"
  LET l_buttons = 0

  INPUT l_title, l_message, l_buttons
    WITHOUT DEFAULTS
    FROM f_title, f_message, f_buttons
    HELP 2

    BEFORE INPUT
      CALL publish_toolbar("msg_box",0)

    ON KEY (F2)
      CALL fgl_dialog_update_data()
      LET l_title = get_fldbuf(f_title)
      LET l_message = get_fldbuf(f_message)
      LET l_buttons = get_fldbuf(f_buttons)
      CALL fgl_message_box(l_title, l_message, l_buttons)

    ON KEY (F211) --fgl_winmessage()
      CALL fgl_key_queue(fgl_keyval("F211"))
      EXIT INPUT
    ON KEY (F212) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F212"))
      EXIT INPUT
    ON KEY (F213)  --fgl_winbutton()
      CALL fgl_key_queue(fgl_keyval("F213"))
      EXIT INPUT
    ON KEY (F214)  --fgl_winprompt()
      CALL fgl_key_queue(fgl_keyval("F214"))
      EXIT INPUT

    ON KEY (F216)  --4GL ERROR
      CALL fgl_key_queue(fgl_keyval("F216"))
      EXIT INPUT
    ON KEY (F217)  -- 4GL MESSAGE
      CALL fgl_key_queue(fgl_keyval("F217"))
      EXIT INPUT
    ON KEY (F11)  -- EXIT
      LET ret = 0
      EXIT INPUT

    AFTER INPUT
      CALL publish_toolbar("msg_box",1)
  END INPUT

  RETURN ret

END FUNCTION

}
{
############################################################
# FUNCTION do_4gl_error()
############################################################
FUNCTION do_4gl_error()
  DEFINE 
    l_message VARCHAR(240),
    ret SMALLINT

  #CALL fgl_form_display("f_4gl_error")

  LET ret = 1

  DISPLAY "!" TO fb_winmessage
  DISPLAY "!" TO fb_winquestion
  DISPLAY "!" TO fb_winbutton
  DISPLAY "!" TO fb_winprompt
  DISPLAY "!" TO fb_mbox
  #DISPLAY "!" TO fb_error
  DISPLAY "!" TO fb_message
  DISPLAY "!" TO fb_close
  DISPLAY "!" TO fb_ok


  LET l_message = get_str(460)  --"4GL ERROR Message body"

  INPUT l_message
    WITHOUT DEFAULTS
    FROM f_message
    HELP 2

    BEFORE INPUT
      CALL publish_toolbar("msg_box",0)

    ON KEY (F2)
      CALL fgl_dialog_update_data()
      LET l_message = get_fldbuf(f_message)
      ERROR l_message

    ON KEY (F211) --fgl_winmessage()
      CALL fgl_key_queue(fgl_keyval("F211"))
      EXIT INPUT
    ON KEY (F212) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F212"))
      EXIT INPUT
    ON KEY (F213)  --fgl_winbutton()
      CALL fgl_key_queue(fgl_keyval("F213"))
      EXIT INPUT
    ON KEY (F214)  --fgl_winprompt()
      CALL fgl_key_queue(fgl_keyval("F214"))
      EXIT INPUT
    ON KEY (F215)  --fgl_messagebox()
      CALL fgl_key_queue(fgl_keyval("F215"))
      EXIT INPUT
#   ON KEY (F216)  --4GL ERROR
#     CALL fgl_key_queue(fgl_keyval("F216"))
#     EXIT INPUT
    ON KEY (F217)  -- 4GL MESSAGE
      CALL fgl_key_queue(fgl_keyval("F217"))
      EXIT INPUT
    ON KEY (F11)  -- EXIT
      LET ret = 0
      EXIT INPUT

    AFTER INPUT
      CALL publish_toolbar("msg_box",1)
  END INPUT

  RETURN ret

END FUNCTION



############################################################
# FUNCTION do_4gl_message()
############################################################
FUNCTION do_4gl_message()
  DEFINE 
    l_message VARCHAR(240),
    ret SMALLINT

  #CALL fgl_form_display("f_4gl_message")

  LET ret = 1

  DISPLAY "!" TO fb_winmessage
  DISPLAY "!" TO fb_winquestion
  DISPLAY "!" TO fb_winbutton
  DISPLAY "!" TO fb_winprompt
  DISPLAY "!" TO fb_mbox
  DISPLAY "!" TO fb_error
  #DISPLAY "!" TO fb_message
  DISPLAY "!" TO fb_close
  DISPLAY "!" TO fb_ok


  LET l_message = get_str(465)  --"4GL MESSAGE Message body"

  INPUT l_message
    WITHOUT DEFAULTS
    FROM f_message
    HELP 2

    BEFORE INPUT
      CALL publish_toolbar("msg_box",0)

    ON KEY (F2)
      CALL fgl_dialog_update_data()
      LET l_message = get_fldbuf(f_message)
      MESSAGE l_message

    ON KEY (F211) --fgl_winmessage()
      CALL fgl_key_queue(fgl_keyval("F211"))
      EXIT INPUT
    ON KEY (F212) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F212"))
      EXIT INPUT
    ON KEY (F213)  --fgl_winbutton()
      CALL fgl_key_queue(fgl_keyval("F213"))
      EXIT INPUT
    ON KEY (F214)  --fgl_winprompt()
      CALL fgl_key_queue(fgl_keyval("F214"))
      EXIT INPUT
    ON KEY (F215)  --fgl_messagebox()
      CALL fgl_key_queue(fgl_keyval("F215"))
      EXIT INPUT
    ON KEY (F216)  --4GL ERROR
      CALL fgl_key_queue(fgl_keyval("F216"))
      EXIT INPUT

    ON KEY (F11)  -- EXIT
      LET ret = 0
      EXIT INPUT

    AFTER INPUT
      CALL publish_toolbar("msg_box",1)
  END INPUT

  RETURN ret

END FUNCTION

}
############################################################
# FUNCTION show_user_data(p_value)
############################################################
FUNCTION show_user_data(p_value)
  DEFINE p_value VARCHAR(40)

  CALL fgl_winmessage(get_str(470), get_str(471) || " " || p_value, "info")  --You entered the value: 
END FUNCTION

############################################################
# FUNCTION init_dialogBox_data()
#! Initialize dialog box data
############################################################
FUNCTION init_dialogBox_data()

  			LET twm_f_title = get_str(410)  --fgl_winmessage() Message Box Title
  			LET twm_f_message = get_str(411)
  			LET twm_f_icon = get_str(412)


				LET twq_f_title = get_str(420)    --"fgl_winquestion() Message Box Title"
				LET twq_f_message = get_str(421)  --"fgl_winquestion() Message text"
  			LET twq_f_icon = get_str(422)     --"info" 


  			LET twb_f_title = get_str(430)      --"fgl_winbutton() Message Box Title"
  			LET twb_f_message = get_str(431)    --"fgl_winbutton() Message text"
  			LET twb_f_icon = get_str(432)       --"info"


			  LET twp_f_message = get_str(440)  --"The Prompt Question"
			  LET twp_f_datatype = 2
			  LET twp_f_in_len = 10
			  LET twp_f_char_value = get_str(441)  --"Default val"
			  LET twp_f_sint_value = 20000
			  LET twp_f_int_value  = 60000 


  			LET tmb_f_title = get_str(450)    --"Message Box Title"
  			LET tmb_f_message = get_str(451)  --"Message body"
  			LET tmb_f_buttons = 0

				LET tem_f_message = get_str(460)  --"4GL ERROR Message body"

    	
				LET tmm_f_message = get_str(465)  --"4GL MESSAGE Message body"
  						   			
END FUNCTION
