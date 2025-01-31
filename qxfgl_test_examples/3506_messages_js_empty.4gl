
MAIN 
DEFINE f7,f8,f9,f10,f11 CHAR(20)
OPTIONS INPUT WRAP
CALL ui.interface.frontcall("html5","scriptImport",["qx://application/scripts/messages.js"],[])
	OPEN WINDOW mywin with form "3506/3506_messages_js_empty"

INPUT BY NAME f7,f8,f9,f10,f11 without defaults
		AFTER FIELD f7
			MESSAGE "AFTER FIELD MESSAGE f7"
		AFTER FIELD f8
			MESSAGE "AFTER FIELD MESSAGE f8"
			
		BEFORE FIELD f10
			MESSAGE "BEFORE FIELD MESSAGE f10"
		BEFORE FIELD f11
			MESSAGE "BEFORE FIELD MESSAGE f11"

		ON ACTION "CANCEL"
			Exit INPUT

	END INPUT
	
END MAIN			