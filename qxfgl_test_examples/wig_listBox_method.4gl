##########################################################################################
# MAIN
# Demonstrating dynamic listBox methods
# -AddItem 
# -GetItemCount
# -GetItemName 
# -GetItemText 
# -GetTextOf 
# -RemoveItem 
# -SetSelectedItems
# -GetSelectedItems
#
##########################################################################################

DEFINE arrMethodDescription DYNAMIC ARRAY OF STRING


##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	DEFINE lbx,pLbxMethod ui.ListBox #Define a variable of dataType ui.ListBox
	DEFINE fListChoice STRING  --list of selected items (fListChoiceText is only a view field)
	DEFINE fListMethod SMALLINT  --Select method in listBox
	DEFINE tmpStr STRING
	DEFINE strMessage, strUserInput STRING
	DEFINE intUserInput SMALLINT
	DEFINE myDynamicListItemName, myDynamicListItemText STRING
	DEFINE i INT

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT

	CALL ui_init()	
	
	OPEN WINDOW myWin WITH FORM "form/wig_listBox_method"
  CALL fgl_settitle("ListBox Widget <Methods> Demo Example 2")
	CALL ui.Interface.setText("ListBox2")

	LET lbx = ui.ListBox.ForName("fListChoice") #Bind this variable to an ui element in the current window-form
	LET pLbxMethod = ui.ListBox.ForName("fListMethod") #Bind this variable to an ui element in the current window-form

	CALL populateListBox(lbx) #Call a function and pass the listBox variable
	CALL populateListBoxMethod(pLbxMethod)	#Populate the 2nd listBox with Methods()
	CALL initArrMethodDescription()	#init listBox methods description
	#Init	
	LET fListChoice = 1
	LET fListMethod = 1
	DISPLAY fListChoice TO fListChoiceText
	DISPLAY lbx.getItemName(fListChoice) TO getItemName
	DISPLAY lbx.getItemText(fListChoice) TO getItemText
	
	LET myDynamicListItemName = lbx.getItemName(fListChoice)		
	LET myDynamicListItemText = lbx.getItemText(fListChoice)		
	DISPLAY arrMethodDescription[fListMethod] TO methodDescription
	#End Init

	MENU
		ON ACTION "EDIT" #WHILE TRUE		
			DIALOG	ATTRIBUTE(UNBUFFERED)
			INPUT BY NAME fListChoice WITHOUT DEFAULTS
				BEFORE INPUT
					CALL dialog.setActionHidden("ACCEPT",TRUE)
					#CALL dialog.setActionHidden("CANCEL",TRUE)
					DISPLAY lbx.getItemCount() TO itemCount
	
				ON ACTION actMouseDoubleClick		
					LET tmpStr = "Mouse DoubleClick Event on List Item Value: ",fListChoice CLIPPED 
					CALL fgl_winmessage("DoubleClick", tmpStr, "info")
										
				ON ACTION updateField
					DISPLAY fListChoice TO fListChoiceText
				
				ON CHANGE fListChoice
					DISPLAY fListChoice TO fListChoiceText
					DISPLAY lbx.getItemName(fListChoice) TO getItemName
					DISPLAY lbx.getItemText(fListChoice) TO getItemText
					
					LET myDynamicListItemName = lbx.getItemName(fListChoice)		
					LET myDynamicListItemText = lbx.getItemText(fListChoice)		
					
				
				#Also works, but I'm not sure why/when this should be useful
				#ON ACTION getItemName2  
				#	LET strMessage = "Enter any number in the \nrange of 0 to ", trim(lbx.getItemCount()), "\nto retrieve it's NAME using .getItemName()"  
				#	LET intUserInput = fgl_winprompt(NULL,NULL,strMessage,"",2,1)
				#	LET strMessage = "The item ", trim(intUserInput), " has got the itemName =", lbx.getItemName(intUserInput)
				#	CALL fgl_winmessage("getItemName()",strMessage,"info")
	
		    ON ACTION "HELP"
		    	CALL onlineHelp(NULL,"LISTBOX")				

			END INPUT

			INPUT BY NAME fListMethod WITHOUT DEFAULTS
				ON CHANGE fListMethod
					DISPLAY arrMethodDescription[fListMethod] TO methodDescription
					
				ON ACTION "Call Method"
					CALL methodDemo(fListMethod, lbx, fListChoice)
			END INPUT

		
	    ON ACTION "HELP"
	    	CALL onlineHelp(NULL,"Listbox")	
		    				
			ON ACTION "CANCEL"
				EXIT DIALOG
			
		END DIALOG	-----------------------------------------------------------

		
    ON ACTION "Exit"
    	EXIT MENU
    			
    ON ACTION "HELP"
    	CALL onlineHelp(NULL,"LISTBOX")				
	END MENU
	
END MAIN


##################################################################################
# FUNCTION methodDemo(fListMethod, pLbx, pFListChoice)
#
#
##################################################################################
FUNCTION methodDemo(fListMethod, pLbx, pFListChoice)
	DEFINE fListMethod INT
	DEFINE strMessage STRING
	DEFINE pFListChoice STRING
	DEFINE strUserInput STRING
	DEFINE intUserInput INT
	DEFINE pLbx,pLbxMethod ui.ListBox #Define a variable of dataType ui.ListBox

	CASE fListMethod
		#addItem
		WHEN 1
			LET strUserInput = fgl_winprompt(NULL,NULL,"Enter the label of the new listBox item","",20,0)
			CALL pLbx.addItem(pLbx.getItemCount()+1,strUserInput)
			DISPLAY pLbx.getItemCount() TO itemCount
			CALL ui.interface.refresh()

		#getItemName
		WHEN 2
			LET strMessage = "Enter the TEXT of the listBoxItem to retrieve it's NAME (ID) using .getItemName()"  
			LET strUserInput = fgl_winprompt(NULL,NULL,strMessage,"",20,0)
			#DISPLAY pLbx.getItemName(strUserInput)
			#DISPLAY pLbx.getItemName("LSD")
			
			LET strMessage = "The item ", trim(strUserInput), " has got the itemName =", pLbx.getItemName(trim(strUserInput))
			CALL fgl_winmessage("getItemName()",strMessage,"info")


		#getItemText
		WHEN 3
			LET strMessage = "Enter any number in the \nrange of 0 to ", trim(pLbx.getItemCount()), "\nto retrieve it's TEXT using .getItemText()",	"\nCurrently, item ", trim(pFListChoice), " - ", pLbx.getItemText(pFListChoice), " is selected"  
			LET intUserInput = fgl_winprompt(NULL,NULL,strMessage,pFListChoice,2,1)
			IF pLbx.getItemText(intUserInput) IS NOT NULL THEN
				LET strMessage = "The item ", trim(intUserInput), " has got the itemText: ", pLbx.getItemText(intUserInput)
			ELSE
				LET strMessage = "No item was found with this name:", trim(intUserInput)
			END IF
			CALL fgl_winmessage("getItemText()",strMessage,"info")
													
										
		#Remove list Item
		WHEN 4
		#DISPLAY "pLbx.getSelectedItems() =", pLbx.getSelectedItems() 
		#DISPLAY "pFListChoice=", pFListChoice
					IF pLbx.getSelectedItems() IS NOT NULL AND pFListChoice IS NOT NULL THEN
						CALL pLbx.removeItem(pFListChoice)
						DISPLAY pLbx.getItemCount() TO itemCount					
					ELSE
						IF pFListChoice IS NULL THEN
							LET strMessage = "You have not selected any list item"
						ELSE
							LET strMessage = "You have selected MULTIPLE list items!\n", trim(pFListChoice)
						END IF
						CALL fgl_winmessage(".removeItem()",strMessage,"info")			
					END IF

		#getSelectedItems
		WHEN 5
			IF pLbx.getSelectedItems() IS NOT NULL THEN
				LET strMessage = "Select Item is:\nName:", trim(pLbx.getSelectedItems()), "\nText:", trim(pLbx.getItemText(pLbx.getSelectedItems()))
			ELSE
				IF pFListChoice IS NULL THEN
					LET strMessage = "You have not selected any list item"
				ELSE
					LET strMessage = "You have selected MULTIPLE list items!\n", trim(pFListChoice)
				END IF
			END IF	
			CALL fgl_winmessage(".getSelectedItems()",strMessage,"info")
										
		OTHERWISE
			CALL fgl_winmessage("invalid case argument","invalid case argument","(error")
	END CASE

END FUNCTION
##########################################################################################
# FUNCTION populateListBox()
#
# We are doing this in 3 Steps
# 1. Define a variable of dataType ui.ListBox
# 2. Bind this variable to an ui element in the current window-form
# 3. Use the function <listBoxVariable>.addItem() to populate it dynamically
##########################################################################################

FUNCTION populateListBox(pLbx)
	DEFINE pLbx ui.ListBox

	CALL pLbx.AddItem("1", "Antimatter")
	CALL pLbx.AddItem("2", "Californium 252")
	CALL pLbx.AddItem("3", "Painite")
	CALL pLbx.AddItem("4", "Diamonds")
	CALL pLbx.AddItem("5", "Tritium")
	CALL pLbx.AddItem("6", "Taaffeite")
	CALL pLbx.AddItem("7", "Plutonium")
	CALL pLbx.AddItem("8", "LSD")
	CALL pLbx.AddItem("9", "Methamphetamine")
	CALL pLbx.AddItem("10", "Heroin")
	CALL pLbx.AddItem("11", "Crème de la Mer")
	CALL pLbx.AddItem("12", "Rhino Horn")
	CALL pLbx.AddItem("13", "Platinum")
	CALL pLbx.AddItem("14", "Rhodium")
	CALL pLbx.AddItem("15", "Gold")
	CALL pLbx.AddItem("16", "Iranian Beluga Caviar")
	CALL pLbx.AddItem("17", "Saffron")
	CALL pLbx.AddItem("18", "White Truffles")

END FUNCTION


##################################################################################
# FUNCTION populateListBoxMethod(pLbxMethod)
#
#
##################################################################################
FUNCTION populateListBoxMethod(pLbxMethod)
	DEFINE pLbxMethod ui.ListBox

	CALL pLbxMethod.AddItem("1", "addItem")
	CALL pLbxMethod.AddItem("2", "getItemName")
	CALL pLbxMethod.AddItem("3", "getItemText")
	CALL pLbxMethod.AddItem("4", "removeItem")
	CALL pLbxMethod.AddItem("5", "getSelectedItems")
END FUNCTION


##################################################################################
# FUNCTION initArrMethodDescription()
#
#
##################################################################################
FUNCTION initArrMethodDescription()
	LET arrMethodDescription[1] = ".addItem()\n\nParameter: Type name,STRING textAdds \n\nListBoxItem with \"text\" for the Text property and \"name\" for the Value property"
	LET arrMethodDescription[2] = ".getItemName()\n\nParameter: INTEGER index \n\nReturns (Type) Value of the ListBoxItem specified byits index position as an argument"
	LET arrMethodDescription[3] = ".getItemText()\n\nParamter: INTEGER Index \n\nReturns (String) Text of ListBoxItem specifed by its index position as an argument"
	LET arrMethodDescription[4] = ".removeItem()\n\nParamter: Type name \n\nRemoves the First ListBoxItem matching the Value property and an argument passed to the method. If Value is not set, then the Text property value and an argument matching takes place"
	LET arrMethodDescription[5] = ".getSelectedItems() \n\nParamter: none\n\nComma separated list of selected items"
END FUNCTION