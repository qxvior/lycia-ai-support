#########################################################################################################
# Contact Demo - Main GUI Demo Application to demonstrate GUI Clients
#
# Modification History:
# 19.10.06 HH - V3 - Extracted from gd_guidemo.4gl
# 19.10.06 HH - V3 - Contact Form independent functionality of language settings
#
#
# FUNCTION                                        DESCRIPTION                                            RETURN
# contact_demo(pLanguage)                         Main module for the contact manager                    NONE
# gd_contact_menu()                               Contact manager menu                                   NONE
# input_data(cust_rec)                            Edit/Input function for contact manager                NONE
# input_array()                                   Bring the screen array into input state                ret SMALLINT
# manage_list_box()                               Adds new list item to list box                         NONE
# grid_export_clipboard()                         Export grid data to the clipboard                      NONE
# grid_export_file()                              Export grid data to a file                             NONE
# send_email()                                    Send an email to the contact                           NONE
# populate_form()                                 Populate contact form with labels and field/grid data  NONE
# change_grid_header(column_name)                 Change column header of grid                           NONE
# update_grid_col_header()                        Update grid column header                              NONE
# grid_data_array_update(id,p_gr_head_temp_rec)   Update the grid header labels & format                 NONE
# init_gr_head_temp_rec(p_id)											Initialises temp record                                p_gr_head_temp_rec.*
# country_popup()                                 Display country selection list                         l_data[i] or NULL
# image_selection()                               Display image browser window for selection             NONE
# get_contact_win_name()                          Return contact window name (language depending)        "window name"
# get_contact_form_name()                         Return contact form name (language depending)          "form name"
# example_error()                                 Displays an example 4gl error message                  NONE
# example_message()                               Displays an example 4gl MESSAGE message                NONE
# print_contact_html()                            Print contact details in html format                   NONE
#                                                 (prepare and call print html function)
#########################################################################################################

# check html 5 creation in 4gl #job for Hubert

############################################################
# Globals
############################################################
GLOBALS "gui_demo_globals.4gl"


############################################################
# Module Scope globals
############################################################
  DEFINE
    w_name VARCHAR(20),
    f_name VARCHAR(40)
    
	DEFINE mdRecId SMALLINT
#########################################################################################################
# FUNCTION contact_demo(pLanguage)
#
# Main module for the contact manager
#
# RETURN NONE
#########################################################################################################
FUNCTION contact_demo(pLanguage)
  DEFINE
    w_icon VARCHAR(80),
    w_title VARCHAR(80),
    ret SMALLINT,
    inp_char CHAR,
    pLanguage INT

  DEFINE w WINDOW
  DEFINE f FORM

#
#	IF pLanguage IS NULL OR (pLanguage <1 or pLanguage>8 ) THEN
#  	IF lang_menu() = 0 THEN  --force user to select language
#  	  RETURN
#  	END IF
#
#  	#update language
#  	LET languageID = get_language()
#
#	ELSE
#		CALL set_language(pLanguage)
#		LET languageID = pLanguage
#	END IF
	LET languageID = 1
#	
  LET w_name = get_contact_win_name()
  LET w_title = get_str(100 + languageID)  --titlebar string starts ranges from 101 - 107

	CALL w.OpenWithForm(w_name,get_form_path(get_contact_form_file()),1,1,"","")  --main guidemo CONTACT form window

  CALL fgl_settitle(w_name,w_title)

  LET mdRecId = 1   
  CALL populate_form()
  CALL gd_contact_menu()


  CALL w.Close() 
END FUNCTION



#########################################################################################################
# FUNCTION gd_contact_menu()
#
# Contact manager menu
#
# RETURN NONE
######################################################################################################### 
FUNCTION gd_contact_menu()  --not in edit mode yet
  DEFINE
    inp_char CHAR

  WHILE TRUE  
		CALL displayRecord(mdRecId)
		DISPLAY ARRAY act_arr TO sc_rec.* HELP 80
    #PROMPT "" FOR CHAR inp_char HELP 80
    BEFORE DISPLAY
        CALL publish_toolbar("gd_contact",0)

#      ON ACTION "actExitModule" --Exit/Return
			ON ACTION "CANCEL"
        EXIT WHILE 

#      ON ACTION "actExitModule" --Exit/Return
			ON ACTION "ACCEPT"  --default event on row double click
        #do nothing
                
#			ON ACTION "FirstRecord"
			ON ACTION "FIRSTRECORD"
				IF mdRecId <> 1 THEN
					LET mdRecId = 1
					EXIT DISPLAY
					#CALL displayRecord(mdRecId)
				END IF

#			ON ACTION "PreviousRecord"
			ON ACTION "PREVIOUSRECORD"
				IF mdRecId > 1 THEN
					LET mdRecId = mdRecId - 1
					EXIT DISPLAY					
					#CALL displayRecord(mdRecId)
				END IF
				
#			ON ACTION "NextRecord"
			ON ACTION "NEXTRECORD"
				IF mdRecId < 9 THEN
					LET mdRecId = mdRecId + 1
					EXIT DISPLAY					
					#CALL displayRecord(mdRecId)
				END IF

#			ON ACTION "LastRecord"
			ON ACTION "LASTRECORD"
				IF mdRecId <> 9 THEN
					LET mdRecId = 9
					EXIT DISPLAY					
					#CALL displayRecord(mdRecId)
				END IF

#      ON KEY(F5)    -- Edit Data
 			ON ACTION "EDIT"
        CALL input_data()
        IF exit_menu = 1 THEN
          EXIT WHILE  
        END IF
 
 		ON ACTION "Email"
      CALL send_email()

		ON ACTION "ERROR"
      CALL example_error()

		ON ACTION "MESSAGE"
      CALL example_message()

      ON KEY(F91)    -- DISPLAY Data Update
        CALL populate_form() 


      ON KEY ("F1024") -- "Show Help in HTML format..."
        CALL html_help(get_help_url(2))

      ON ACTION ("PRINT")    -- just to show you can work with key or action events
         # print_contact_html() locates in this file at line 1082
         CALL print_contact_html()

      AFTER DISPLAY
        CALL publish_toolbar("gd_contact",1)
 
    END DISPLAY
     
  END WHILE

END FUNCTION



#########################################################################################################
# FUNCTION input_data(cust_rec)
#
# Edit/Input function for contact manager
#
# RETURN NONE
#########################################################################################################
FUNCTION input_data()
  DEFINE 
    exit_input,i SMALLINT

  #CALL set_count(20)
  

	DIALOG

  INPUT BY NAME cust_rec[languageID].* 
                WITHOUT DEFAULTS
                HELP 1
    BEFORE INPUT
      # ignore before and after field validations for field jumps (with the mouse)
      CALL fgl_dialog_fieldorder(FALSE)

      #Publish the toolbar key labels for the menu 'gd_co_edit' (this is a custom function call)
      CALL publish_toolbar("gd_co_edit",0)


    #This is a combo box feature - when the user enters a title which does not exist in the current list
    # the program will add it to the list
    AFTER FIELD cust_title
      IF fgl_list_find("cust_title",cust_rec[1].cust_title) = 0 THEN 
        CALL fgl_list_insert("cust_title",99,cust_rec[1].cust_title)
        CALL fgl_list_sort("cust_title",1)
      END IF

#    ON KEY(F2)
#      CALL fgl_dialog_update_data()
#      EXIT DIALOG


#    ON ACTION "actInputExit"
#      CALL fgl_dialog_update_data()
#      EXIT DIALOG

#    ON KEY(F3)     
#      EXIT DIALOG

 #   ON KEY (F6)
 #     LET exit_input = input_array()
 #     CASE exit_input
 #       WHEN 1
 #         CALL fgl_dialog_update_data()
 #         EXIT DIALOG
 #       WHEN -1
 #         EXIT DIALOG
 #     END CASE
        
#      IF exit_menu = 1 THEN
#        EXIT DIALOG
#      END IF

#      ON ACTION "actPictureBrowser"
#        LET cust_rec[languageID].cust_picture=image_selection()  --click the persons picture

    #ON KEY (F81)
    #  CALL image_selection()  --click the persons image picture

    ON ACTION manageListBox --KEY (F82)
      CALL manage_list_box()

    ON ACTION "grid_export_clipboard" --KEY (F83)
      CALL grid_export_clipboard()

    ON ACTION "grid_export_file"  --KEY (F84)
      CALL grid_export_file()

		ON ACTION "actCountryList" INFIELD(cust_country) 
        LET cust_rec[languageID].cust_country = country_popup()
        DISPLAY BY NAME cust_rec[languageID].cust_country

		ON ACTION "PRINT"
      CALL print_contact_html()
      
    #ON KEY (F1010)
    #   CALL print_contact_html()

    ON KEY ("F1024") --"Show Help in HTML format..."
      CALL html_help(get_help_url(3))


    AFTER INPUT
      CALL publish_toolbar("gd_co_edit",1)

  END INPUT



  INPUT ARRAY act_arr 
    WITHOUT DEFAULTS 
    FROM sc_rec.* 
    HELP 1

    BEFORE INPUT
      CALL publish_toolbar("gd_co_ed_gr",0)

#    ON KEY(F2)
#      CALL fgl_dialog_update_data()
#      #LET ret = 1
#      EXIT DIALOG

 #   ON KEY(F3)
 #     #LET ret = -1
 #     EXIT DIALOG

#    ON KEY("F5")
#      CALL fgl_dialog_update_data()
#      #LET ret = 0
#      LET exit_menu = 0
#      EXIT DIALOG

#    ON KEY(F40)  --default entry point
#      CALL change_grid_header(grid_header[1].col_name)
#
#    ON KEY(F41)
#      CALL change_grid_header(grid_header[1].col_name)
#
#    ON KEY(F42)
#      CALL change_grid_header(grid_header[2].col_name)
#
#    ON KEY(F43)
#      CALL change_grid_header(grid_header[3].col_name)
#
#    ON KEY(F44)
#      CALL change_grid_header(grid_header[4].col_name)
#
#    ON KEY(F45)
#      CALL change_grid_header(grid_header[5].col_name)
#
#    ON KEY(F46)
#      CALL change_grid_header(grid_header[6].col_name)

      ON ACTION "actPictureBrowser"
        CALL image_selection()  --click the persons picture


#    ON KEY("F144")
#      #LET ret = 0
#      EXIT DIALOG


    ON KEY ("F1024") --"Show Help in HTML format..."
      CALL html_help(get_help_url(4))

    AFTER INPUT
      CALL publish_toolbar("gd_co_ed_gr",1)

  END INPUT


		#ON ACTION "imageSelection"
    #ON KEY (F81)
    #  CALL image_selection()

		ON ACTION "Email"
      CALL send_email()

		ON ACTION "ERROR"
      CALL example_error()

		ON ACTION "MESSAGE"
      CALL example_message()

		ON ACTION "PRINT"
      CALL print_contact_html()


  	ON ACTION "ACCEPT"
  		EXIT DIALOG
  	
  	ON ACTION "CANCEL"
  		EXIT DIALOG
  
  END DIALOG

  CALL populate_form()



END FUNCTION
{
#########################################################################################################
# FUNCTION input_array()
#
# Bring the screen array into input state
#
# RETURN ret SMALLINT
#########################################################################################################
FUNCTION input_array()
  DEFINE 
    i INTEGER,
    ret SMALLINT

  LET ret = 0

  CALL set_count(20)
call fgl_winmessage("is this still","is this still used ?. if not, remove","info")
  INPUT ARRAY act_arr 
    WITHOUT DEFAULTS 
    FROM sc_rec.* 
    HELP 1

    BEFORE INPUT
      CALL publish_toolbar("gd_co_ed_gr",0)

#    ON KEY(F2)
#      CALL fgl_dialog_update_data()
#      LET ret = 1
#      EXIT INPUT

#    ON KEY(F3)
#      LET ret = -1
#      EXIT INPUT

    ON KEY("F5")
      CALL fgl_dialog_update_data()
      LET ret = 0
      LET exit_menu = 0
      EXIT INPUT

    ON KEY(F40)  --default entry point
      CALL change_grid_header(grid_header[1].col_name)

    ON KEY(F41)
      CALL change_grid_header(grid_header[1].col_name)

    ON KEY(F42)
      CALL change_grid_header(grid_header[2].col_name)

    ON KEY(F43)
      CALL change_grid_header(grid_header[3].col_name)

    ON KEY(F44)
      CALL change_grid_header(grid_header[4].col_name)

    ON KEY(F45)
      CALL change_grid_header(grid_header[5].col_name)

    ON KEY(F46)
      CALL change_grid_header(grid_header[6].col_name)

    #ON KEY (F81)
    #  CALL image_selection()


    ON KEY (F86)
      CALL send_email()


    ON KEY(F101)
      CALL example_error()

    ON KEY(F102)
      CALL example_message()

    ON KEY("F144")
      LET ret = 0
      EXIT INPUT

		ON ACTION "PRINT"
      CALL print_contact_html()

    ON KEY ("F1024") --"Show Help in HTML format..."
      CALL html_help(get_help_url(4))

    AFTER INPUT
      CALL publish_toolbar("gd_co_ed_gr",1)

  END INPUT

  RETURN ret
END FUNCTION

}

##################################################################
# FUNCTION manage_list_box()
#
# Adds new list item to list box
#
# RETURN NONE
##################################################################
FUNCTION manage_list_box()
  DEFINE list_value VARCHAR(20)

  LET list_value = fgl_winprompt(5,5,get_str(251),get_str(252),10,0)

  IF list_value = "" OR list_value IS NULL THEN --IS NULL THEN
    CALL fgl_winmessage(get_str(257),get_str(258),"info")
  ELSE
    CALL fgl_list_insert("cust_title",99,list_value)
    CALL fgl_winmessage(get_str(253),trim(get_str(254)) || "\n" || list_value || "\n" || trim(get_str(255)),"info")
  END IF
  
END FUNCTION



##################################################################
# FUNCTION grid_export_clipboard()
#
# Export grid data to the clipboard
#
# RETURN NONE
##################################################################
FUNCTION grid_export_clipboard()
  DEFINE list_value VARCHAR(20)

  CALL fgl_grid_export("sc_rec",1,100,"Clipboard","html")

  CALL fgl_winmessage(get_str(261),get_str(262) || "\n" || get_str(263) || "\n" || get_str(264),"info")

END FUNCTION


##################################################################
# FUNCTION grid_export_file()
#
# Export grid data to a file
#
# RETURN NONE
##################################################################
FUNCTION grid_export_file()
  DEFINE list_value VARCHAR(20)

  CALL fgl_grid_export("sc_rec",1,100,"File","csv")

  CALL fgl_winmessage(get_str(261),get_str(262) || "\n" || get_str(263) || "\n" || get_str(264),"info")

END FUNCTION


##################################################################
# FUNCTION send_email()
#
# Send an email to the contact
#
# RETURN NONE
##################################################################
FUNCTION send_email()
  DEFINE e_name VARCHAR(100)

  LET e_name = trim(cust_rec[languageID].cust_fname), " ", trim(cust_rec[languageID].cust_lname)
  #CALL fgl_winmessage(cust_rec[language].cust_email,e_name,"info")
  CALL post_email_default_client(cust_rec[languageID].cust_email, e_name)


END FUNCTION


Function populate_gridHeader_form()
  #DISPLAY get_str(5) TO b_update
  #DISPLAY get_str(3) TO b_done
  DISPLAY get_str(291) TO lbTitle  --Dynamic Grid Header

  CALL fgl_settitle("w_grid_header",get_str(296))


END FUNCTION

FUNCTION displayRecord(recId)
DEFINE recId SMALLINT
 	DEFINE mapQuery STRING 
 	
  #DEFINE i INTEGER
  #DEFINE f_style INTEGER,
  DEFINE  e_name VARCHAR(100)
	#DEFINE rb ui.RadioButton
	#DEFINE lb ui.Label
	#DEFINE cb_cust_re, cb_cust_rp, cb_cust_rl ui.CheckBox

  
  --alpr for map
  LET mapQuery = TRIM(cust_rec[recId].cust_address1)," , ",TRIM(cust_rec[recId].cust_address2)," , ",TRIM(cust_rec[recId].cust_address3)," , ",TRIM(cust_rec[recId].cust_post_code)," , ", TRIM(cust_rec[recId].cust_country) 
  DISPLAY mapQuery 	TO wc_google_map   


  #Display actual field data to form
  DISPLAY BY NAME cust_rec[recId].*

  LET e_name = "<" , trim(cust_rec[recId].cust_fname), " ", trim(cust_rec[recId].cust_lname), ">"

  DISPLAY hotlink_config_string_wrapper(cust_rec[recId].cust_url , get_str(213)) TO cust_url
  DISPLAY hotlink_config_string_wrapper("mailto:" || trim(cust_rec[recId].cust_email) || " " || trim(e_name), get_str(214)) TO hl_cust_email


END FUNCTION

#########################################################################################################
# FUNCTION populate_form()
#
# Populate contact form with labels and field/grid data
#
# RETURN NONE
#########################################################################################################
FUNCTION populate_form()
  DEFINE i INTEGER
  DEFINE f_style INTEGER,
    e_name VARCHAR(100)
	DEFINE rb ui.Radio  #ui has changed 22.06.2018 ui.RadioButton
	DEFINE lb ui.Label
	DEFINE cb_cust_re, cb_cust_rp, cb_cust_rl ui.CheckBox
 	DEFINE mapQuery STRING 
  LET languageID = get_language()
  
  --alpr for map
  LET mapQuery = TRIM(cust_rec[languageID].cust_address1)," , ",TRIM(cust_rec[languageID].cust_address2)," , ",TRIM(cust_rec[languageID].cust_address3)," , ",TRIM(cust_rec[languageID].cust_post_code)," , ", TRIM(cust_rec[languageID].cust_country) 
  DISPLAY mapQuery 	TO wc_google_map   
  #Display labels and button text
  DISPLAY get_str(201) TO dl_c_id 
  DISPLAY get_str(202) TO dl_title 
  DISPLAY get_str(203) TO dl_f_name 
  DISPLAY get_str(204) TO dl_s_name
  DISPLAY get_str(205) TO dl_country 
  DISPLAY get_str(206) TO dl_email 
  DISPLAY get_str(207) TO dl_dob 
  #DISPLAY get_str(208) TO dl_cb_rec_email 
  #DISPLAY get_str(209) TO dl_cb_rec_call 
  #DISPLAY get_str(210) TO dl_cb_rec_post 
  #DISPLAY get_str(211) TO dl_rb_ct_private 
  #DISPLAY get_str(212) TO dl_rb_ct_business 
  
  LET cb_cust_re=ui.CheckBox.ForName("cust_re")
	CALL cb_cust_re.SetTitle(get_str(208))
  
  LET cb_cust_rp=ui.CheckBox.ForName("cust_rp")
	CALL cb_cust_rp.SetTitle(get_str(209))
  
  LET cb_cust_rl=ui.CheckBox.ForName("cust_rl")
	CALL cb_cust_rl.SetTitle(get_str(210))
	
	
  LET e_name = "<" , trim(cust_rec[languageID].cust_fname), " ", trim(cust_rec[languageID].cust_lname), ">"

  DISPLAY hotlink_config_string_wrapper(cust_rec[languageID].cust_url , get_str(213)) TO cust_url
  DISPLAY hotlink_config_string_wrapper("mailto:" || trim(cust_rec[languageID].cust_email) || " " || trim(e_name), get_str(214)) TO hl_cust_email

  #DISPLAY get_str(213) dl_cb_rec_post
  #DISPLAY get_str(214) dl_cb_rec_post
  DISPLAY get_str(215) TO fb_clipboard_copy
  DISPLAY get_str(216)TO fb_file_copy
  DISPLAY get_str(217) TO fb_error
  DISPLAY get_str(218) TO fb_message
  #DISPLAY get_str(219) TO fb_cancel
  #DISPLAY get_str(220) TO fb_help
  DISPLAY get_str(221) TO lbTitle 

  #Display actual field data to form
  DISPLAY BY NAME cust_rec[languageID].*
  CALL set_count(20)

  # Set the grid column header dynamically
  CALL update_grid_col_header()
 
  #DISPLAY ARRAY act_arr TO sc_rec.* WITHOUT SCROLL

END FUNCTION



#####################################################################
# FUNCTION change_grid_header(column_name)
#
# Change column header of grid
#
# RETURN NONE
#####################################################################
FUNCTION change_grid_header(column_name)
  DEFINE 
    column_name VARCHAR(30),
    f_title1,f_title2,f_title3 VARCHAR(30),
    rb_alignment1,rb_alignment2,rb_alignment3 VARCHAR(10),
    cb_list_id,c SMALLINT,
    gr_head_temp_rec #OF t_gr_head_temp_rec
      RECORD
        col_name VARCHAR(30),
        col_label VARCHAR(30),
        col_alignment VARCHAR(10)
      END RECORD

  DEFINE w WINDOW, fm_grid_header FORM

  #Initalise default record
  #record for the input (can be seen as a temp record which will be later copied to the corresponding grid header array record)
  CALL init_gr_head_temp_rec(1) RETURNING gr_head_temp_rec.*


	#CALL fgl_window_open("w_grid_header",5,5,get_form_path("gd_f_grid_header_2_2"),TRUE)
  CALL w.OpenWithForm("w_grid_header", get_form_path("gd_f_grid_header_2_2"), 5, 30, "" ,"border") --huho 20.8.14 changed to normal window open statement due to window class bug
	
  #Initialise Buttons and text labels
	
	CALL populate_gridHeader_form()

  FOR c = 1 TO 6
    CALL fgl_list_set("col_name",c,grid_header[c].col_name)
  END FOR

  WHILE TRUE

    INPUT BY NAME gr_head_temp_rec.*   WITHOUT DEFAULTS attribute(UNBUFFERED) HELP 1
      BEFORE INPUT
        CALL publish_toolbar("gd_co_grid",0)

        #ON CHANGE col_alignment
        #CALL fgl_message_box(gr_head_temp_rec.col_alignment)
        
  
		ON CHANGE col_name
        LET cb_list_id = fgl_list_find("col_name",gr_head_temp_rec.col_name)
        CALL init_gr_head_temp_rec(cb_list_id) RETURNING gr_head_temp_rec.*
				#LET gr_head_temp_rec.col_label = gr_head_temp_rec.col_label
				#LET gr_head_temp_rec.col_alignment = gr_head_temp_rec.col_alignment
        #DISPLAY gr_head_temp_rec.col_label TO col_label        
        #DISPLAY gr_head_temp_rec.col_alignment TO col_alignment
        				
      #AFTER FIELD col_name
       # LET cb_list_id = fgl_list_find("col_name",gr_head_temp_rec.col_name)
        #CALL init_gr_head_temp_rec(cb_list_id) RETURNING gr_head_temp_rec.*
				#LET gr_head_temp_rec.col_label = gr_head_temp_rec.col_label
				#LET gr_head_temp_rec.col_alignment = gr_head_temp_rec.col_alignment
        #DISPLAY gr_head_temp_rec.col_label TO col_label        
        #DISPLAY gr_head_temp_rec.col_alignment TO col_alignment
      #  NEXT FIELD col_label

			#ON ACTION "actUpHeader"
      #  CALL update_grid_col_header()
      #  EXIT WHILE       
			
      ON KEY(F11)
        CALL update_grid_col_header()
        EXIT WHILE       

      AFTER INPUT
        
        LET cb_list_id = fgl_list_find("col_name",gr_head_temp_rec.col_name)
        IF cb_list_id <1 OR cb_list_id > 6 THEN
					CALL fgl_winmessage("4gl Error in change_grid_header()","4gl Error in change_grid_header\ncb_list_id is 0 or > 6","error")
				END IF
					
        CALL grid_data_array_update(cb_list_id,gr_head_temp_rec.*)
    END INPUT

    IF int_flag THEN
      LET int_flag = FALSE
      EXIT WHILE
    END IF

    #CALL fgl_message_box(gr_head_temp_rec.col_alignment)
    CALL fgl_window_current(w_name)
    CALL update_grid_col_header()
    CALL fgl_window_current("w_grid_header")

  END WHILE

	#CALL fgl_window_close()
  CALL fgl_window_current("w_grid_header")
  CALL w.Close()
END FUNCTION

############################################################
# FUNCTION init_gr_head_temp_rec(p_id)
#
# Initialises temp record
#
# RETURN p_gr_head_temp_rec.*
##################################################################
FUNCTION init_gr_head_temp_rec(p_id)
  DEFINE
    p_id SMALLINT,
    p_gr_head_temp_rec OF t_gr_head_temp_rec


  LET p_gr_head_temp_rec.col_name = grid_header[p_id].col_name
  LET p_gr_head_temp_rec.col_label = grid_header[p_id].col_label
  LET p_gr_head_temp_rec.col_alignment = grid_header[p_id].col_alignment

  RETURN p_gr_head_temp_rec.*

END FUNCTION


############################################################
# FUNCTION grid_data_array_update(id,p_gr_head_temp_rec)
#
# Update the grid header labels & format
#
# RETURN NONE
############################################################
FUNCTION grid_data_array_update(id,p_gr_head_temp_rec)
  DEFINE 
    id SMALLINT,
    p_gr_head_temp_rec OF t_gr_head_temp_rec,
    local_debug SMALLINT

  LET local_debug = FALSE

	IF id <1 OR id > 6 THEN
		CALL fgl_winmessage("4gl Error in grid_data_array_update()","4gl Error in grid_data_array_update()\narray id is 0 or > 6","error")
		RETURN -1
	END IF
	
  LET grid_header[id].col_name = p_gr_head_temp_rec.col_name 
  LET grid_header[id].col_label = p_gr_head_temp_rec.col_label
  LET grid_header[id].col_alignment = p_gr_head_temp_rec.col_alignment

  IF local_debug THEN
    DISPLAY "grid_data_processing() - id=", id
    DISPLAY "grid_data_processing() - grid_header[id].col_name=", grid_header[id].col_name
    DISPLAY "grid_data_processing() - grid_header[id].col_label=", grid_header[id].col_label
    DISPLAY "grid_data_processing() - grid_header[id].col_alignment=", grid_header[id].col_alignment

  END IF

END FUNCTION


#########################################################################################################
# FUNCTION update_grid_col_header()
#
# Update grid column header
#
# RETURN NONE
#########################################################################################################
FUNCTION update_grid_col_header()
  DEFINE 
    i SMALLINT,
    local_debug SMALLINT

  LET local_debug = FALSE

  FOR i = 1 TO 6

		#removed alignment and key - Initially display it with the default (alignment = dataType driven)
    #CALL fgl_grid_header("sc_rec", grid_header[i].col_name, grid_header[i].col_label, grid_header[i].col_alignment, grid_header[i].col_key)
    #CALL fgl_grid_header("sc_rec", grid_header[i].col_name, grid_header[i].col_label)
    IF local_debug THEN
      DISPLAY "fgl_grid_header(\"sc_rec\"," , grid_header[i].col_name, "," ,grid_header[i].col_label, "," , grid_header[i].col_alignment, "," , grid_header[i].col_key , ")"
    END IF
  END FOR

  IF local_debug THEN
    DISPLAY "****** Grid header updated *****************"
  END IF
END FUNCTION


#########################################################################################################
# FUNCTION country_popup()
#
# Display country selection list
#
# RETURN l_data[i] or NULL
#########################################################################################################
FUNCTION country_popup()
  DEFINE l_data ARRAY[10] OF CHAR(25)
  DEFINE i INTEGER
  DEFINE w WINDOW

  FOR i = 1 TO 10
    LET l_data[i] = get_str(i+230)  -- country strings start with index 231
  END FOR

  CALL w.OpenWithForm("w_popup_country", "form/gui_demo_country", 8, 20,  "border")

  #CALL set_count(sizeof(l_data))  -- may be not too good...
  CALL set_count(10)
  LET int_flag = FALSE

  DISPLAY ARRAY l_data TO sc_rec.* --HELP 1 ATTRIBUTES(BLUE, CURRENT ROW DISPLAY = "BLUE, REVERSE") HELP 1
    BEFORE DISPLAY
    	CALL hideNavigation()
      #CALL publish_toolbar("country_sel",0)
#    ON KEY (RETURN)
#      EXIT DISPLAY

  END DISPLAY

  CALL w.Close()

  IF int_flag THEN
    RETURN NULL
  ELSE
    LET i = arr_curr()
    RETURN l_data[i]
  END IF
END FUNCTION



##########################################################
# FUNCTION image_selection()
#
# Display image browser window for selection
#
# RETURN NONE
##########################################################
FUNCTION image_selection()
  DEFINE 
    array_element_id,ret,change_image SMALLINT,
    w_name VARCHAR(30)
    #imageUri STRING
    
  DEFINE w WINDOW

  #OPTIONS
  #  FORM LINE 1

  LET w_name = "w_image_selection"
  LET change_image = 0
 
  CALL w.OpenWithForm("w_image_selection", get_form_path("gd_f_img_selection_2_2"), 5, 55, "", "border")

  CALL fgl_settitle("Browser")
  CALL set_count(7)

  LET int_flag = FALSE

  DISPLAY ARRAY cust_picture TO image_scr_rec.* HELP 1
    BEFORE DISPLAY
      CALL publish_toolbar("img_brows",0)
    ON KEY(F2)
    	LET array_element_id = arr_curr()
      LET change_image = 1
      EXIT DISPLAY

    ON KEY(F3)   -- cancel
      LET change_image = 0
      EXIT DISPLAY

  END DISPLAY

  CALL w.Close()
  
  IF change_image = 1 AND int_flag IS NOT NULL THEN
    #LET array_element_id = arr_curr()
    #LET cust_picture = cust_picture[array_element_id]
    #LET imageUri = "qx://application/", trim(cust_picture)
    DISPLAY cust_picture[array_element_id] TO cust_picture
    
    CALL fgl_winmessage(get_str(281),get_str(282),"info")
  END IF

	#RETURN cust_picture[array_element_id]
  #OPTIONS
  #  FORM LINE 3

END FUNCTION


#########################################################################################################
# FUNCTION get_contact_win_name()
#
# Return contact window name (language depending)
#
# RETURN "window name"
#########################################################################################################
FUNCTION get_contact_win_name()
	#With Lycia 2.2, we will only use one form and do the corresponding form element translations via the API
	RETURN "w_english"

{
  CASE get_language()  -- global
    WHEN 1
      RETURN "w_english"
    WHEN 2
      RETURN "w_spanish"
    WHEN 3
      RETURN "w_german"
    WHEN 4
      RETURN "w_french"
    WHEN 5
      RETURN "w_arabic"
    WHEN 6
      RETURN "w_italian"
    WHEN 7
      RETURN "w_other"
    OTHERWISE
      LET err_msg = get_str(42) CLIPPED, " get_contact_win_name() Language= " , get_language()
      CALL fgl_winmessage(get_str(30),err_msg, "error")
  END CASE
}END FUNCTION


#########################################################################################################
# FUNCTION get_contact_form_name()
#
# Return contact form name (language depending)
#
# RETURN "form name"
#########################################################################################################
FUNCTION get_contact_form_name()
#With Lycia 2.2, we will only use one form and do the corresponding form element translations via the API
RETURN "f_a_english"

{
  CASE get_language()  --global
    WHEN 1
      RETURN "f_a_english"
    WHEN 2
      RETURN "f_a_spanish"
    WHEN 3
      RETURN "f_a_german"
    WHEN 4
      RETURN "f_a_french"
    WHEN 5
      RETURN "f_a_arabic"
    WHEN 6
      RETURN "f_a_italian"
    WHEN 7
      RETURN "f_a_other"
    OTHERWISE
      LET err_msg = get_str(42) CLIPPED,  " get_contact_form_name() Language= " , get_language()
      CALL fgl_winmessage(get_str(30),err_msg, "error")  
  END CASE
}
END FUNCTION

# Return contact form name (language depending)
FUNCTION get_contact_form_file()
#With Lycia 2.2, we will only use one form and do the corresponding form element translations via the API

RETURN "gui_demo_contact"
{
  CASE get_language()  --global
    WHEN 1
      RETURN "gui_demo_contact"
    WHEN 2
      RETURN "gd_f_contact_spanish"
    WHEN 3
      RETURN "gd_f_contact_german"
    WHEN 4
      RETURN "gd_f_contact_french"
    WHEN 5
      RETURN "gd_f_contact_arabic"
    WHEN 6
      RETURN "gd_f_contact_italian"
    WHEN 7
      RETURN "gd_f_contact_other"
    OTHERWISE
      LET err_msg = get_str(42) CLIPPED,  " get_contact_form_name() Language= " , get_language()
      CALL fgl_winmessage(get_str(30),err_msg, "error")  
  END CASE
}
END FUNCTION



#########################################################################################################
# FUNCTION example_error()
#
# Displays an example 4gl error message
#
# RETURN NONE
#########################################################################################################
FUNCTION example_error()

  ERROR trim(get_str(241)), " " , trim(get_str(243)) ," ", trim(get_str(244))

END FUNCTION


#########################################################################################################
# FUNCTION example_message()
#
# Displays an example 4gl MESSAGE message
#
# RETURN NONE
#########################################################################################################
FUNCTION example_message()


  MESSAGE trim(get_str(242)), " " , trim(get_str(243))  ," ", trim(get_str(244))

END FUNCTION


#########################################################################################################
# FUNCTION print_contact_html()
#
# Print contact details in html format (prepare and call print html function)
#
# RETURN NONE
#########################################################################################################
FUNCTION print_contact_html()
  DEFINE 
    arg_str VARCHAR(2000),
    client_path_file VARCHAR(300),
    previous_help_file_id SMALLINT,
    clientTempFolderImage, clientTempFolderImage2 STRING,
    imagePath STRING
    
    DEFINE tmp_template,tmp_path,tmp_html_output STRING
    
    
    
  LET previous_help_file_id = get_current_classic_help()

    # SeZa Apr 2014 :
    # currently easiest way to show complex generated HTML using qx://application/ path without calling fgl_download()


	#Get the image file downloaded and a fully qualified path
	#Phoenix used to work diffrently / less secure
	#LET tl_client_temp_directory = fgl_get_property("gui","system.file.client_temp","")
	#LET clientTempFolderImage = trim(get_client_temp_directory()),trim(cust_rec[language].cust_picture)
	#CALL fgl_download(cust_rec[language].cust_picture,clientTempFolderImage) RETURNING clientTempFolderImage2
	
	
  LET arg_str = append_arg_str(arg_str, "hm_s01",get_str(201))
  LET arg_str = append_arg_str(arg_str, "hm_s02",get_str(202))
  LET arg_str = append_arg_str(arg_str, "hm_s03",get_str(203))
  LET arg_str = append_arg_str(arg_str, "hm_s04",get_str(204))
  LET arg_str = append_arg_str(arg_str, "hm_s05",get_str(205))
  LET arg_str = append_arg_str(arg_str, "hm_s06",get_str(207))
  LET arg_str = append_arg_str(arg_str, "hm_s07",get_str(206))
  LET arg_str = append_arg_str(arg_str, "hm_s08",get_str(245))
  LET arg_str = append_arg_str(arg_str, "hm_s09",get_str(209))  -- not used
  LET arg_str = append_arg_str(arg_str, "hm_s10",get_str(210))  -- not used
  LET arg_str = append_arg_str(arg_str, "hm_s11",cust_rec[languageID].cust_id)
  LET arg_str = append_arg_str(arg_str, "hm_s12",cust_rec[languageID].cust_title)
  LET arg_str = append_arg_str(arg_str, "hm_s13",cust_rec[languageID].cust_fname)
  LET arg_str = append_arg_str(arg_str, "hm_s14",cust_rec[languageID].cust_lname)
  LET arg_str = append_arg_str(arg_str, "hm_s15",cust_rec[languageID].cust_country)
  LET arg_str = append_arg_str(arg_str, "hm_s16",cust_rec[languageID].cust_dob)
  LET arg_str = append_arg_str(arg_str, "hm_s17",cust_rec[languageID].cust_email)
  LET arg_str = append_arg_str(arg_str, "hm_s18",cust_rec[languageID].cust_url)
  LET arg_str = append_arg_str(arg_str, "hm_s19",cust_rec[languageID].cust_re)  -- not used
  LET arg_str = append_arg_str(arg_str, "hm_s20",cust_rec[languageID].cust_rp)  -- not used

  #LET arg_str = append_arg_str(arg_str, "hm_i01",fgl_get_property("gui", "system.file.cachename", cust_rec[language].cust_picture))
  # SeZa Apr 2014: workaround. Removing qx://applciation form contact image by choosing last 2 items in path. 
  LET clientTempFolderImage = "../"||os.Path.basename(os.Path.dirname(cust_rec[languageID].cust_picture))||"/"||os.Path.basename(cust_rec[languageID].cust_picture) 
  LET arg_str = append_arg_str(arg_str, "hm_i01",clientTempFolderImage)  

  LET arg_str = append_arg_str(arg_str, "hm_l01",cust_rec[languageID].cust_memo)
  
  LET tmp_template=get_html_path(get_print_html_template(2))
  LET tmp_html_output=get_html_path(get_html_print_output())
  
  # SeZa Apr 2014: in current structure, this function located in lib/tools_html_print.4gl at line : 36
  call print_html_simple(tmp_template, tmp_html_output, arg_str,"n")  -- take a html file and replace specified tokens with data
                                                                     -- should be located in the client's temp path
  
  LET client_path_file = "qx://application//",tmp_html_output
  #fgl_download(get_html_path(get_html_print_output()),get_client_temp_path(get_html_path(get_html_print_output())))          -- download generated html file to client
  
  CALL print_html(client_path_file)                                                                                      -- print this html file

  CALL set_classic_help_file(previous_help_file_id)
END FUNCTION

