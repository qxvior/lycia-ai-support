MAIN
DEFINE i INT
  DEFINE act_arr DYNAMIC ARRAY OF RECORD
    f1,
    f2,
    f3,
    f4 VARCHAR(20)
  END RECORD

	FOR i=1 to 300
		LET act_arr[i].f2="item",trim(i)
	END FOR 
	OPEN WINDOW w WITH FORM "5601/5601_table_key_navigation_lock"
	INPUT ARRAY act_arr WITHOUT DEFAULTS FROM sc_rec.* HELP 1
		BEFORE INPUT
			CALL fgl_dialog_setkeylabel("ACCEPT","","")
			CALL fgl_dialog_setkeylabel("CANCEL","","")
			CALL fgl_dialog_setkeylabel("F5","edit","png",11,1)
			CALL fgl_dialog_setkeylabel("F6","editgrid","png",12,1)
		ON ACTION "exit"
			EXIT INPUT
	END INPUT
END MAIN
