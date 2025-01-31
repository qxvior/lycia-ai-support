################################################################################
# Module Scope Variables
################################################################################
DEFINE modu_rec_contact RECORD
		firstName STRING, 
		lastName STRING, 
		email STRING, 
		url STRING
	END RECORD

################################################################################
# MAIN
#
#
################################################################################
MAIN
	DEFINE l_ui_cntTitle ui.GridPanel
	DEFINE l_ui_cntToolbar ui.StackPanel
	DEFINE l_ui_gridLength   ui.gridLength
	
	DEFINE l_ui_gridRowDef   ui.gridRowDefinition	
	DEFINE l_ui_gridColDef ui.GridColumnDefinition

	DEFINE l_arr_ui_l_ui_gridRowDef   DYNAMIC ARRAY OF ui.gridRowDefinition
	DEFINE l_arr_ui_l_ui_gridColDef   DYNAMIC ARRAY OF ui.GridColumnDefinition

  DEFINE l_ui_gridPanelLocation ui.GridItemLocation
  
	DEFINE btAccept ui.Button 
	DEFINE btCancel ui.Button 
	DEFINE btEdit   ui.Button 
	DEFINE btHelp   ui.Button

	CALL ui_init() --just import some example javascript to redirect error/message text to tooltip kind popups
	CALL initData() --just some dummy data for the input statement
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
				
	#open the window with the form which we are going to manipulate
	OPEN WINDOW w1 WITH FORM "form/ui_add_buttons_to_title_gridPanel"
	CALL ui.interface.refresh()
	
	#for demo purpose, we show, how the form/window looks prior to manipulating it
	#CALL fgl_winmessage("Demo Description","Please look at the form\nbefore we are adding a stackPanel and 3 buttons\n(to see the difference)\nPress the OK to proceed","info")

	INPUT BY NAME modu_rec_contact.* WITHOUT DEFAULTS
		BEFORE INPUT
			MESSAGE "Please accept/cancel this input to proceed"
			CALL fgl_winmessage("Demo Description","Please look at the form before \nwe are adding a stackPanel \nand 3 buttons\n(to see the difference)\nPress OK in this dialog box\nfollowed by OK in the toolbar to proceed","info")

	END INPUT
	
	
	#Assign the existing gridPanel with the identifier l_ui_cntTitle (in the currently displayed form) to the variable l_ui_cntTitle 
 	LET l_ui_cntTitle = ui.GridPanel.ForName("cntTitle")

	
	#Create a new StackPanel within the existing gridPanel l_ui_cntTitle 
	LET l_ui_cntToolbar = ui.stackpanel.Create("cntToolbar","cntTitle")
	#Set some properties of this StackPanel inc. the location, where it should be added to (location of the l_ui_cntTitle container gridPanel)
	CALL l_ui_cntToolbar.SetOrientation("Horizontal")
	
	LET l_ui_gridPanelLocation.GridHeight=1  #Location within it's parent container
  LET l_ui_gridPanelLocation.GridWidth=1
  LET l_ui_gridPanelLocation.GridX=2
  LET l_ui_gridPanelLocation.GridY=0

	CALL l_ui_cntToolbar.SetGridItemLocation(l_ui_gridPanelLocation)
	CALL l_ui_cntToolbar.SetHorizontalAlignment("Right")  #Set it to right aligned

	#We need to retrieve the current gridLayout properties of l_ui_cntTitle and append 1 column inc. the layout properties for this column
	LET  l_arr_ui_l_ui_gridColDef = l_ui_cntTitle.GetGridColumnDefinitions()
	LET l_ui_gridLength.gridLengthValue=""

	#CALL l_ui_gridLength.Setl_ui_gridLengthType("Auto")  
	#CALL l_ui_gridColDef.Setl_ui_gridLength(l_ui_gridLength)
	CALL l_arr_ui_l_ui_gridColDef.append(l_ui_gridColDef)
	CALL l_ui_cntTitle.SetGridColumnDefinitions(l_arr_ui_l_ui_gridColDef)

	#Add buttons to the stackPanel  (beauty of the stackPanel is, that we can simply add elements without adding any additional location properties
	LET btEdit = ui.Button.Create("btEdit","cntToolbar")
	#CALL btEdit.SetPreferredSize(["124px","24px"])  #we don't need a size this time.. will be done in css based on the classname inc. adding an image
	#CALL btEdit.SetText("My Super Button")  #we don'T need a button label this time... will be done in css based on the classname
	CALL btEdit.SetEnable(True)
	CALL btEdit.SetInvokeAction("EDIT")	
	CALL btEdit.SetClassNames("fcls_button_edit")

	LET btAccept = ui.Button.Create("btAccept","cntToolbar")
	CALL btAccept.SetEnable(True)
	CALL btAccept.SetInvokeAction("ACCEPT")	
	CALL btAccept.SetClassNames("fcls_button_done")

	LET btCancel = ui.Button.Create("btCancel","cntToolbar")
	CALL btCancel.SetEnable(True)
	CALL btCancel.SetInvokeAction("CANCEL")	
	CALL btCancel.SetClassNames("fcls_button_cancel")

	LET btHelp = ui.Button.Create("btHelp","cntToolbar")
	CALL btHelp.SetEnable(True)
	CALL btHelp.SetInvokeAction("HELP")	
	CALL btHelp.SetClassNames("fcls_button_help")

	CALL ui.interface.refresh()
	
	#Some ui user interaction to see the form with the new buttons 	
	WHILE TRUE
		INPUT BY NAME modu_rec_contact.* WITHOUT DEFAULTS
		
			ON ACTION "ACCEPT"
				CALL fgl_winmessage("ACCEPT","Accept","info")
				EXIT WHILE
				
			ON ACTION "CANCEL"
				CALL fgl_winmessage("Cancel","Cancel","info")

				
			ON ACTION "HELP"
				CALL fgl_winmessage("HELP","Help","info")
														
			ON ACTION "EDIT"
				CALL fgl_winmessage("EDIT","Edit","info")
				
		END INPUT

	END WHILE
		
END MAIN
################################################################################
# END MAIN
################################################################################


################################################################################
# FUNCTION initData()
#
#
################################################################################
FUNCTION initData()

	LET modu_rec_contact.firstName = "Hubert"
	LET modu_rec_contact.lastName = "Hölzl"
	LET modu_rec_contact.email = "h.hoelzl@querix.com"
	LET modu_rec_contact.url = "www.querix.com"
	
END FUNCTION
################################################################################
# END FUNCTION initData()
################################################################################