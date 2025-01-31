MAIN

	#Only makes sense for SDI and the mdi parent (not for mdi-child applications)
	#We are wrapping a HTML Header/Footer arround the application screen
	IF fgl_getenv("qx_child") THEN
		CALL fgl_winmessage("Not Child-App Compatible","This program can not be run as a mdi-child application\nThis application will be terminated","error")
		EXIT PROGRAM
	END IF

  CALL ui.Interface.setType("container")
  CALL ui.Application.GetCurrent().setMenuType("Tree")

  CALL ui.interface.frontcall("html5","scriptImport",["qx://application/js/footer-header.js"],[])  -- i.e. add additonal header and satusbar elements and their styles
  CALL ui.interface.frontcall("sample","changeFrameTemplate",[],[])  --change the viewports/template i.e. header area and statusbar attachment
  
  MENU
	COMMAND "Header1"
	  CALL ui.interface.frontcall("html5","eval",["window.top.document.querySelector('#sample-header').innerHTML='Header1'"],[])			    
	COMMAND "Header2"
	  CALL ui.interface.frontcall("html5","eval",["window.top.document.querySelector('#sample-header').innerHTML='Header2'"],[])			    
	  
	COMMAND "Footer1"
		CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserName').text('Victor Masibasi')"],[])
		CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserDepartment').text('Research and Marketing')"],[])
		CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserLoginTime').text('14:28')"],[])
		CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserBirthDate').text('24.12.1968')"],[])

	COMMAND "Footer2"
		CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserName').text('John Smith')"],[])
		CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserDepartment').text('Customer Service')"],[])
		CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserLoginTime').text('08:12')"],[])
		CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserBirthDate').text('09.07.1984')"],[])
				
    COMMAND "exit"
			EXIT MENU
        
  END MENU
END MAIN
