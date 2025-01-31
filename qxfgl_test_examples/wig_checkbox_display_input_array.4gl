DEFINE t_rec_checkBox TYPE AS
 RECORD
 		cb1_char_null CHAR,
 		cb1_char CHAR,
 		cb1_boolen BOOLEAN,
 		cb1_int SMALLINT,
 		cb2_char_null CHAR,
 		cb2_char CHAR,
 		cb2_boolen BOOLEAN,
 		cb2_int SMALLINT

  END RECORD

DEFINE m_arr_rec_checkBox DYNAMIC ARRAY OF t_rec_checkBox


######################################################################
# MAIN
#
#
######################################################################
MAIN
	DEFINE i SMALLINT
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT
	
	CALL ui_init()
	

		
	OPEN WINDOW wContact WITH FORM "form/wig_checkbox_display_input_array"
  CALL fgl_settitle("CheckBox widget Array")
	CALL ui.Interface.setText("CheckBox Array")
	
	CALL init_data()

	MENU
		ON ACTION "DISPLAY"
			DISPLAY ARRAY m_arr_rec_checkBox TO scr_checkbox.*
				ON ACTION "HELP"
			    CALL onlineHelp("Checkbox",NULL)
			END DISPLAY
		ON ACTION "INPUT"
			INPUT ARRAY m_arr_rec_checkBox WITHOUT DEFAULTS FROM scr_checkbox.*
				ON ACTION "HELP"
			    CALL onlineHelp("Checkbox",NULL)
			END INPUT
		ON ACTION "HELP"
	    CALL onlineHelp("Checkbox",NULL)
		ON ACTION "EXIT"
			EXIT MENU
	END MENU
END MAIN



######################################################################
# FUNCTION init_data()
#
#
######################################################################
FUNCTION init_data()
	DEFINE i SMALLINT
	DEFINE l_rec_checkBox OF t_rec_checkBox
	
  CALL fgl_channel_open_file("stream", "unl/wig_checkbox_display_input_array.unl", "r")
  CALL fgl_channel_set_delimiter("stream","|")

  LET i = 0

  WHILE fgl_channel_read("stream",l_rec_checkBox.*)
    LET i = i + 1
  	LET  m_arr_rec_checkBox[i].* = l_rec_checkBox.*
  	
  END WHILE

END FUNCTION
