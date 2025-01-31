main
	if arg_val(1)="i4gl" then call fgl_putenv("QX_COMPAT=Informix4GL") end if
		
	options message line 2
	menu "test"
		command "Exit" exit menu
		command  KEY (F1)
	        open window my_help at 2,2 with 4 rows , 76 columns attribute (border)
	        message "F1 - Help Option: SORRY - NO HELP AVAILABLE YET"
	        sleep 2
	        close window my_help
	end menu
end main