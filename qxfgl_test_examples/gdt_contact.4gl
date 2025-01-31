############################################################
# Globals
############################################################
GLOBALS "gdt_globals.4gl"


############################################################################
# FUNCTION viewContactDetails(p_currRecId,p_windowState)
#
#	Arguments
# p_currRecId INT			--contact record array ID
# p_windowState INT		--1 = open new window-form / 2= use existing window-form
#
# RETURN
#	VOID
#
# View contact list
############################################################################
FUNCTION viewContactDetails(p_currRecId,p_windowState)
	DEFINE p_currRecId INT    -- contact record array ID
	DEFINE p_windowState INT  --1 = open new window-form / 2= use existing window-form
	DEFINE w_contactDetails WINDOW	
	
	IF p_currRecId IS NULL THEN
		LET p_currRecId = 1
	END IF
	
	IF p_windowState IS NULL THEN
		LET p_windowState = 1
	END IF	
	
	IF p_windowState = 1 THEN
		CALL w_contactDetails.openWithForm("w_contactDetails", getFormPath("gdt_contact_details"), 1,1,"", "BORDER")
	END IF
	
	CALL fgl_settitle("Contact Details")
	
	CALL populate_contactDetails(p_currRecId)
	MENU
			
		ON ACTION (actPreviousRecord,actCtbNavPrevious)
			IF p_currRecId > 1 THEN
				LET p_currRecId = p_currRecId - 1
				CALL populate_contactDetails(p_currRecId)	
			END IF	
			
		ON ACTION (actNextRecord,actCtbNavNext)
			IF p_currRecId < globalMaxContId THEN		
				LET p_currRecId = p_currRecId + 1
				CALL populate_contactDetails(p_currRecId)	
			END IF

								
		ON ACTION (actEditContact,actCtbEdit)
			CALL editContactDetails(p_currRecId,0)

		ON ACTION actMessage
			MESSAGE "This is a demo dummy 4GL MESSAGE"
			
		ON ACTION actError
			ERROR "This is a demo dummy 4GL ERROR"
				
		ON ACTION (actExit, actCtbExit)
			EXIT MENU
	END MENU

	IF p_windowState = 1 THEN
		CALL w_contactDetails.close() 
	END IF	

	
END FUNCTION


############################################################################
# FUNCTION viewContactList()
#
#	Arguments
# none
#
# RETURN
#	VOID
#
# View contact list
############################################################################
FUNCTION viewContactList()
	DEFINE currRow INT
	DEFINE w_contactList WINDOW

	
	CALL w_contactList.openWithForm("w_contactList", getFormPath("gdt_contact_list"), 1,1,"", "BORDER")
	
	CALL fgl_settitle("Contact List")

	WHILE TRUE


		CALL cont_list.clear()
		CALL initContactList(contGroupIdList[globalContGroupId], globalNameOrder)	

		DISPLAY ARRAY cont_list TO scr1.*
			BEFORE ROW 
      	CALL fgl_dialog_setkeylabel("CANCEL","")
      	CALL fgl_dialog_setkeylabel("ACCEPT","")   
      	CALL fgl_dialog_setkeylabel("doubleClick","")         
      			
			ON ACTION doubleClick
				CALL viewContactDetails(arr_curr(), 1)

			ON ACTION actDoubleClick  --could als address the native build in event doubleClick
				CALL viewContactDetails(arr_curr(), 1)
										
			ON ACTION actFilter1
				LET globalContGroupId = 1
				#CALL cont_list.clear()		
				#CALL initContactList(contGroupIdList[globalContGroupId], globalNameOrder)
				EXIT DISPLAY

			
			ON ACTION actFilter2
				LET globalContGroupId = 2			
				#CALL cont_list.clear()		
				#CALL initContactList(contGroupIdList[globalContGroupId],globalNameOrder)
				EXIT DISPLAY
			
			
			ON ACTION actFilter3
				LET globalContGroupId = 3			
				#CALL cont_list.clear()		
				#CALL initContactList(contGroupIdList[globalContGroupId],globalNameOrder)
				EXIT DISPLAY
			
			ON ACTION actFilter4
				LET globalContGroupId = 4			
				#CALL cont_list.clear()		
				#CALL initContactList(contGroupIdList[globalContGroupId],globalNameOrder)
				EXIT DISPLAY
			
			ON ACTION actFilter5
				LET globalContGroupId = 5			
				#CALL cont_list.clear()		
				#CALL initContactList(contGroupIdList[globalContGroupId],globalNameOrder)
				EXIT DISPLAY
															
			ON ACTION actAddContact
				CALL newContact()
				#CALL cont_list.clear()		
				#CALL initContactList(contGroupIdList[globalContGroupId],globalNameOrder)
				EXIT DISPLAY
			
			ON ACTION actNameOrderToggle
				IF globalNameOrder = TRUE THEN
					LET globalNameOrder = FALSE
				ELSE
					LET globalNameOrder = TRUE			
				END IF
				EXIT DISPLAY
							
			ON ACTION ("actExit","actCtbExit")
				EXIT WHILE
				
				
		END DISPLAY
	
	END WHILE
	
	CALL w_contactList.close()  --CLOSE WINDOW w_contactList
END FUNCTION


############################################################################
# FUNCTION editContactDetails(p_id, p_windowState)
#
#	Arguments
# p_id INT           --contact ID
# p_windowState INT  --1 = open new window-form / 2= use existing window-form
#
# RETURN
#	VOID
#
# Edit contact details
############################################################################
FUNCTION editContactDetails(p_id, p_windowState)
	DEFINE p_id INT  --contact ID
	DEFINE p_windowState INT  --1 = open new window-form / 2= use existing window-form
	DEFINE w_contactDetails WINDOW
	
	IF p_windowState IS NULL THEN 
		LET p_windowState = 1
	ENd IF
	
	IF p_windowState = 1 THEN
		CALL w_contactDetails.openWithForm("w_contactDetails", getFormPath("gdt_contact_details"), 1,1,"", "BORDER")	
		CALL fgl_settitle("Edit Contact")
	END IF
	
	INPUT BY NAME cont_rec[p_id].* WITHOUT DEFAULTS
	
	IF p_windowState = 1 THEN
		CALL w_contactDetails.close()
	END IF
		

END FUNCTION


############################################################################
# FUNCTION populate_contactDetails(p_id)
#
#	Arguments
# p_id INT  *The contact ID
#
# RETURN
#	VOID
#
# Populates the form contactDetails with data
############################################################################
FUNCTION populate_contactDetails(p_id)
	DEFINE p_id INT
	
	DISPLAY BY NAME cont_rec[p_id].*
END FUNCTION



############################################################################
# FUNCTION newContact()
#
#	Arguments
# none
#
# RETURN
#	VOID
#
# Creates a new contact
############################################################################
FUNCTION newContact()
	DEFINE newContId INT
	DEFINE w_contactDetails WINDOW

	CALL w_contactDetails.openWithForm("w_contactDetails", getFormPath("gdt_contact_details"), 1,1,"", "BORDER")	
	CALL fgl_settitle("New Contact")		
	
	LET newContId = globalMaxContId + 1
	
	LET cont_rec[newContId].cont_id = newContId

	INPUT BY NAME cont_rec[newContId].* WITHOUT DEFAULTS	

	IF int_flag = FALSE THEN
		LET globalMaxContId = globalMaxContId + 1
	ELSE
		CALL cont_rec.delete(newContId)
		
	END IF
	
	CALL w_contactDetails.close() --CLOSE WINDOW w_contact	

	RETURN newContId
END FUNCTION
	