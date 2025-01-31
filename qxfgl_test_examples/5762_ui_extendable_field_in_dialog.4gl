MAIN
DEFINE values_list DYNAMIC ARRAY OF STRING
	DEFINE contact_text, 
	       tele_text, 
	       fax_text, 
	       email, 
	       comment_text STRING
	DEFINE i INT

	OPTIONS INPUT WRAP
	OPEN WINDOW w1 WITH FORM "5762/5762_ui_extendable_field_in_dialog" ATTRIBUTE(BORDER)

    #identify what field should become extendable
	CALL DefineExtendableField ("mobile_phone","addField","delField")

    CALL values_list.Resize(1)

	DIALOG
      INPUT ARRAY values_list WITHOUT DEFAULTS FROM extended_field.* ATTRIBUTE(AUTO APPEND = FALSE)
      END INPUT

      INPUT BY NAME contact_text, tele_text, fax_text,email,comment_text
      END INPUT

      ON ACTION delField
          CALL values_list.Resize(values_list.getLength() - 1)
          CALL ReduceField("mobile_phone")
          CALL fgl_dialog_update_screenarray("extended_field")
      ON ACTION addField
          CALL values_list.Resize(values_list.getLength() + 1)
          CALL ExtendField("mobile_phone")
          CALL fgl_dialog_update_screenarray("extended_field")
          CALL fgl_set_arr_curr(values_list.getLength())
      ON ACTION "show_vals"
          CALL fgl_dialog_update_data()
          FOR i = 1 to values_list.getLength()
              DISPLAY values_list[i]
          END FOR
      ON ACTION EXIT
          --CALL DefineExtendableField () #return actuions back
          EXIT DIALOG
   END DIALOG
	
	DISPLAY values_list
END MAIN


#############################################################################
#initialize extendable field 												#
FUNCTION DefineExtendableField(widget_id,AddActionName,DelActionName)		#
#############################################################################
	DEFINE widget_id,
	       AddActionName,
	       DelActionName STRING
	DEFINE container ui.GridPanel
	DEFINE gc   DYNAMIC ARRAY OF ui.GridColumnDefinition
	DEFINE tf_location,
	       ContainerWidgetLocation ui.GridItemLocation
	DEFINE gc_item ui.GridColumnDefinition
	DEFINE container_elements dynamic array of ui.AbstractUIElement
	DEFINE button_action ui.BackgroundServerEventHandler
	DEFINE bt_plus,
	       bt_minus ui.Button
	DEFINE img ui.Image
	DEFINE i INT
	
	CALL fgl_setactionlabel("Delete","")
	CALL fgl_setactionlabel("Append","")
	CALL fgl_setactionlabel("Find","")
	CALL fgl_setactionlabel("Insert","")

	CALL form_set_screenrecord("extended_field", widget_id)

	LET tf_location = ui.Textfield.ForName(widget_id).GetGridItemLocation()
	LET container = ui.Textfield.ForName(widget_id).GetContainer()
	LET gc = container.GetGridColumnDefinitions()

#add new grid column next to textfield location
	LET gc_item.GridLengthValue=""
    CALL gc.insert(tf_location.GridX+1,gc_item)
    CALL gc.insert(tf_location.GridX+2,gc_item)
 	CALL container.SetGridColumnDefinitions(gc)
 	   
#any element exists on new column? If yes - move all elements from new column and all elements from right side of new TO one column to right
#to avoid overlapping 
    LET container_elements = container.GetItems()
    FOR i=1 TO container_elements.GetLength()
		LET ContainerWidgetLocation = container_elements[i].GetGridItemLocation()
		IF ContainerWidgetLocation.GridX = tf_location.GridX+1 OR ContainerWidgetLocation.GridX = tf_location.GridX+2 THEN
			#change GridX location +1 for every widget from right side of new column
			LET ContainerWidgetLocation.GridX = ContainerWidgetLocation.GridX+2
			CALL container_elements[i].SetGridItemLocation(ContainerWidgetLocation)
		END IF
    END FOR

#Create button with + image and action to multiply the field
    LET bt_plus = ui.Button.Create("plus_button")
#button action
	LET button_action = ui.BackgroundServerEventHandler.Create()
 	CALL button_action.SetCallBackAction(AddActionName)
	CALL bt_plus.SetOninvoke(button_action)
#button image
    CALL img.SetImageUrl("qx://application/5762/add_circle_outline-24px.svg")
    CALL bt_plus.SetImage(img)
#button alignment
    CALL bt_plus.SetVerticalAlignment("Center")
    CALL bt_plus.SetHorizontalAlignment("Center")
#button location in grid
    LET tf_location.GridX = tf_location.GridX+1
    CALL bt_plus.SetGridItemLocation(tf_location)
#add button to container
    CALL container_elements.append(bt_plus)
    CALL container.SetItems(container_elements)
    
#Create button with + image and action to multiply the field
    LET bt_minus = ui.Button.Create("minus_button")
#button action
	LET button_action = ui.BackgroundServerEventHandler.Create()
 	CALL button_action.SetCallBackAction(DelActionName)
	CALL bt_minus.SetOninvoke(button_action)
#button image
    CALL img.SetImageUrl("qx://application/5762/remove_circle_outline-24px.svg")
    CALL bt_minus.SetImage(img)
#button alignment
    CALL bt_minus.SetVerticalAlignment("Center")
    CALL bt_minus.SetHorizontalAlignment("Center")
    CALL bt_minus.SetVisible(FALSE)
#button location in grid
    LET tf_location.GridX = tf_location.GridX+1
    CALL bt_minus.SetGridItemLocation(tf_location)
#add button to container
    CALL container_elements.append(bt_minus)
    CALL container.SetItems(container_elements)    
END FUNCTION


#############################################################################
#add field																	#
FUNCTION ExtendField(widget_id)												#
#############################################################################
	DEFINE widget_id STRING
	DEFINE new_tf ui.Textfield
	DEFINE tf_location,
	       bt_location,
	       current_widget_location,
	       ContainerWidgetLocation ui.GridItemLocation
	DEFINE container ui.GridPanel
	DEFINE gr   DYNAMIC ARRAY OF ui.GridRowDefinition
	DEFINE gr_item ui.GridRowDefinition
	DEFINE max_num SMALLINT
	DEFINE i,addedWidgetCnt INT
	DEFINE bt ui.Button
	DEFINE container_elements dynamic array of ui.AbstractUIElement

#search for the latest added field by lowest Y position
	LET container = ui.Textfield.ForName(widget_id).GetContainer()
    LET container_elements = container.GetItems()
	FOR i=1 TO container_elements.getLength()
		IF container_elements[i].GetIdentifier() = widget_id THEN
			LET addedWidgetCnt=addedWidgetCnt+1
			LET current_widget_location = container_elements[i].GetGridItemLocation()
			IF tf_location.GridY < current_widget_location.GridY THEN
				LET tf_location.* = current_widget_location.*
			END IF
		END IF
    END FOR	
	#if first adding then make minus button visible
	IF addedWidgetCnt=1 THEN
		CALL ui.Button.Forname("minus_button").setVisible(TRUE)
	END IF
	
#if more than 9 widgets added - do nothing, or rewrite code part above
IF max_num = 9 THEN RETURN END IF

#add new grid row below the textfield 
	LET gr = container.GetGridRowDefinitions()	
	LET gr_item.GridLengthValue=""
    CALL gr.insert(tf_location.GridY+1,gr_item)
 	CALL container.SetGridRowDefinitions(gr)	
 	
 	
#any element exists on new row? If yes - move all elements from new column and all elements below the new row to one row down
#to avoid overlapping 
    FOR i=1 TO container_elements.GetLength()
    	#check location of every widget from container
		LET ContainerWidgetLocation = container_elements[i].GetGridItemLocation()
		IF ContainerWidgetLocation.GridY >= tf_location.GridY+1 THEN
		    #change GridY location +1 for every widget below the new column
			LET ContainerWidgetLocation.GridY = ContainerWidgetLocation.GridY+1
			CALL container_elements[i].SetGridItemLocation(ContainerWidgetLocation)
		END IF
    END FOR 	

#move button
	LET bt = ui.Button.ForName("plus_button")
	LET bt_location = bt.GetGridItemLocation()
	LET bt_location.GridY = bt_location.GridY+1 
    CALL bt.SetGridItemLocation(bt_location)
	LET bt = ui.Button.ForName("minus_button")
	LET bt_location = bt.GetGridItemLocation()
	LET bt_location.GridY = bt_location.GridY+1 
    CALL bt.SetGridItemLocation(bt_location)

#widget object copy does not work here LYC-5768
{	LET new_tf = ui.Textfield.create(widget_id)
    CALL new_tf.SetEnable(TRUE)
    call new_tf.SetElementRole("Input")
    call new_tf.SetFocusable(TRUE)
}
	LET new_tf = ui.Textfield.ForName(widget_id).CreateClone() #NEW METHOD
    LET ContainerWidgetLocation.* = tf_location.*
    LET ContainerWidgetLocation.GridY = tf_location.GridY+1
    CALL new_tf.SetGridItemLocation(ContainerWidgetLocation)
    CALL container_elements.append(new_tf)
    CALL container.SetItems(container_elements)

END FUNCTION

#############################################################################
#remove field																#
FUNCTION ReduceField(widget_id)												#
#############################################################################
	DEFINE widget_id STRING
	DEFINE tf_location,
	       bt_location,
	       current_widget_location,
	       ContainerWidgetLocation ui.GridItemLocation
	DEFINE container ui.GridPanel
	DEFINE gr   DYNAMIC ARRAY OF ui.GridRowDefinition
	DEFINE i,addedWidgetCnt,widgetToRemove INT
	DEFINE bt ui.Button
	DEFINE container_elements dynamic array of ui.AbstractUIElement

#search for the latest added field by lowest Y position
	LET container = ui.Textfield.ForName(widget_id).GetContainer()
    LET container_elements = container.GetItems()
	FOR i=1 TO container_elements.getLength()
		IF container_elements[i].GetIdentifier() = widget_id THEN
			LET addedWidgetCnt=addedWidgetCnt+1
			LET current_widget_location = container_elements[i].GetGridItemLocation()
			IF tf_location.GridY < current_widget_location.GridY THEN
			    LET widgetToRemove = i
				LET tf_location.* = current_widget_location.*
			END IF
		END IF
    END FOR	
    
	#if only 2 widgets found - make minus button invisible and then remove last widget
	IF addedWidgetCnt=2 THEN
		CALL ui.Button.Forname("minus_button").setVisible(FALSE)
	END IF
	
#remove current grid row and textfield 
	LET gr = container.GetGridRowDefinitions()
    CALL gr.deleteElement(tf_location.GridY)
 	CALL container.SetGridRowDefinitions(gr)
 	CALL container_elements.deleteElement(widgetToRemove)
 	CALL container.SetItems(container_elements)
 	
 	
#any element exists on CURRENT(DELETED) row or below  - move all elements up on one row
    FOR i=1 TO container_elements.GetLength()
    	#check location of every widget from container
		LET ContainerWidgetLocation = container_elements[i].GetGridItemLocation()
		IF ContainerWidgetLocation.GridY >= tf_location.GridY+1 THEN
			#change GridY location +1 for every widget below the new column
			LET ContainerWidgetLocation.GridY = ContainerWidgetLocation.GridY-1
			CALL container_elements[i].SetGridItemLocation(ContainerWidgetLocation)
		END IF
    END FOR 	

#move buttons up
	LET bt = ui.Button.ForName("plus_button")
	LET bt_location = bt.GetGridItemLocation()
	LET bt_location.GridY = bt_location.GridY-1
    CALL bt.SetGridItemLocation(bt_location)
	LET bt = ui.Button.ForName("minus_button")
	LET bt_location = bt.GetGridItemLocation()
	LET bt_location.GridY = bt_location.GridY-1 
    CALL bt.SetGridItemLocation(bt_location)

END FUNCTION