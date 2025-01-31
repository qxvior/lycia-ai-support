###############################################################################################
# Module Scope
###############################################################################################	
DEFINE menu_list DYNAMIC ARRAY OF RECORD
		menu_option STRING,
		id, parentid STRING
		END RECORD	

DEFINE arr DYNAMIC ARRAY OF RECORD
		num INT,
		cust_name, cust_comp, cust_pos STRING
		END RECORD		
			
			
#############################################################################
# MAIN
#
#
#############################################################################
MAIN
	DEFINE i SMALLINT
	
	CALL ui_init()
	CALL hideNavigation()
	
	CALL initTreeMenuArray()  --populate array for tree menu (display array)
	CALL initCustomerDataArray()


	OPEN WINDOW wTree_menu WITH FORM "form/cnt_tree_menu"

	DISPLAY ARRAY menu_list TO tbTreeContents.* WITHOUT SCROLL	--initial treeMenuTable poulation (no scroll)
	END DISPLAY

	DIALOG ATTRIBUTE (UNBUFFERED)	
		
		DISPLAY ARRAY menu_list TO menu_tree.*
			BEFORE ROW
				LET i = arr_curr()
			
			ON ACTION "ACCEPT"
				CALL select_action(menu_list[i].menu_option)
		     			
			ON ACTION "HELP"
		  	CALL onlineHelp("TreeTable",NULL)		
		  		
		END DISPLAY
	
		DISPLAY ARRAY arr TO scr.* 
		END DISPLAY 
		
		ON ACTION "CANCEL"
			EXIT DIALOG


	END DIALOG

END MAIN



###############################################################################################
# FUNCTION select_action(i)
#
#
###############################################################################################
FUNCTION select_action(p_menuName)
DEFINE p_menuName STRING

LET p_menuName = p_menuName.toLowerCase()
CASE p_menuName

	WHEN "open"
		CALL fgl_winmessage("Open","This could open a document","info")
	
	WHEN "save"
		CALL fgl_winmessage("Save","This could save a document","info")
		
	WHEN "close"
		CALL fgl_winmessage("Close","This could close a document","info")
		
	WHEN "exit"
		CALL fgl_winmessage("Exit","This could exit your application","info")
	
	WHEN "copy"
		CALL fgl_winmessage("Copy","This could copy a document","info")
	
	WHEN "cut"
		CALL fgl_winmessage("Cut","This could cut something","info")
	
	WHEN "paste"
		CALL fgl_winmessage("Paste","This could paste something","info")
	
	WHEN "search"
		CALL fgl_winmessage("Search","This could search for something","info")
	
	WHEN "about"	
		CALL fgl_winmessage("Cut","This could show you the help about message box","info")
END CASE

END FUNCTION




###############################################################################################
# FUNCTION initTreeMenuArray()
#
#
###############################################################################################
FUNCTION initTreeMenuArray()  --tree 
	DEFINE id SMALLINT
	
	LET id = 1
	
	#LET menu_list[id].menu_option = "Main Menu"
	#LET menu_list[id].id = "1"
	#LET menu_list[id].parentid = NULL
	#LET id = id+1

	#File
	LET menu_list[id].menu_option = "File"
	LET menu_list[id].id = "1.1"
	LET menu_list[id].parentid = NULL--"1"
	LET id = id+1
		
	LET menu_list[id].menu_option = "Open"
	LET menu_list[id].id = "1.1.1"
	LET menu_list[id].parentid = "1.1"
	LET id = id+1
	
	LET menu_list[id].menu_option = "Save"
	LET menu_list[id].id = "1.1.2"
	LET menu_list[id].parentid = "1.1"
	LET id = id+1
	
	LET menu_list[id].menu_option = "Close"
	LET menu_list[id].id = "1.1.3"
	LET menu_list[id].parentid = "1.1"
	LET id = id+1
	
	LET menu_list[id].menu_option = "Exit"
	LET menu_list[id].id = "1.1.4"
	LET menu_list[id].parentid = "1.1"
	LET id = id+1

	#EDIT
	LET menu_list[id].menu_option = "Edit"
	LET menu_list[id].id = "1.2" 
	LET menu_list[id].parentid = NULL --"1"
	LET id = id+1

	LET menu_list[id].menu_option = "Copy"
	LET menu_list[id].id = "1.2.1"
	LET menu_list[id].parentid = "1.2"
	LET id = id+1
	
	LET menu_list[id].menu_option = "Cut"
	LET menu_list[id].id = "1.2.2"
	LET menu_list[id].parentid = "1.2"
	LET id = id+1
	
	LET menu_list[id].menu_option = "Paste"
	LET menu_list[id].id = "1.2.3"
	LET menu_list[id].parentid = "1.2"
	LET id = id+1
	
	#Help & Co
	LET menu_list[id].menu_option = "Help"
	LET menu_list[id].id = "1.3"
	LET menu_list[id].parentid = NULL --"1"
	LET id = id+1	
	
	LET menu_list[id].menu_option = "Search"
	LET menu_list[id].id = "1.3.1"
	LET menu_list[id].parentid = "1.3"
	LET id = id+1
	
	LET menu_list[id].menu_option = "About"
	LET menu_list[id].id = "1.3.2"
	LET menu_list[id].parentid = "1.3"
	LET id = id+1


END FUNCTION

###############################################################################################
# FUNCTION initCustomerDataArray()
#
#
###############################################################################################
FUNCTION initCustomerDataArray()
	
	LET arr[1].num=1
	LET arr[1].cust_name="Sam Vimes"
	LET arr[1].cust_comp="City Watch"
	LET arr[1].cust_pos="Commander"
	
	LET arr[2].num=2
	LET arr[2].cust_name="Carrot Ironfoundeson"
	LET arr[2].cust_comp="City Watch"
	LET arr[2].cust_pos="Capitan"
	
	LET arr[3].num=3
	LET arr[3].cust_name="Havelock Vetinari"
	LET arr[3].cust_comp="Government"
	LET arr[3].cust_pos="Patrician"
	
	LET arr[4].num=4
	LET arr[4].cust_name="Leonard da Quirm"
	LET arr[4].cust_comp="Goernment"
	LET arr[4].cust_pos="Inventor"
	
	LET arr[5].num=5
	LET arr[5].cust_name="Rincewind"
	LET arr[5].cust_comp="Unseen University"
	LET arr[5].cust_pos="Wizard"

END FUNCTION



