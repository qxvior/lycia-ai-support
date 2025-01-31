MAIN
DEFINE tem_f_message STRING
OPEN WINDOW w WITH FORM "3593/3593_error_looses_text"
  	INPUT BY NAME tem_f_message WITHOUT DEFAULTS
			ON KEY (F2)
				CALL fgl_dialog_update_data()
				LET tem_f_message = get_fldbuf(tem_f_message)
				ERROR tem_f_message   
		END INPUT
 
END MAIN