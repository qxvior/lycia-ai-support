################################################################################
# Module Scope Variables
################################################################################
# define ui variables global to make it simpler for this demo
DEFINE ui_label ui.Label
DEFINE ui_textField ui.TextField
DEFINE ui_textArea ui.TextArea
DEFINE ui_FunctionFieldAbs ui.FunctionFieldAbs
DEFINE ui_spinner ui.spinner
DEFINE ui_calendar ui.spinner
DEFINE ui_button ui.button
DEFINE ui_checkbox ui.checkbox
DEFINE ui_combobox ui.combobox
DEFINE ui_listbox ui.listbox
DEFINE ui_radiogroup ui.radiogroup
DEFINE ui_timeEditField ui.timeEditField

DEFINE rec_simpleWidgets OF RECORD
		#w_label STRING,	--no input on labels
		w_textField STRING,
		w_textArea STRING,
		w_FunctionFieldAbs STRING,
		w_spinner INT,  -- 0-100
		w_calendar DATE,
		#w_button NOPE,
		w_CheckBox SMALLINT,
		w_comboBox SMALLINT,
		w_ListBox STRING,
		w_RadioGroup SMALLINT,
		w_timeEditField DATETIME HOUR TO MINUTE		
	END RECORD

DEFINE rec_property_values OF RECORD
		f_labelText STRING,
		f_text STRING,
		f_title STRING,
		f_tooltip STRING,
		f_comment STRING,
		f_helperText STRING,
		f_placeholderText STRING,		
		f_value STRING,
		f_textPicture STRING
	END RECORD




################################################################################
# MAIN
#
#
################################################################################
MAIN
	CALL ui_init()
	CALL init_data_rec_simpleWidgets()
	CALL init_rec_property_values()
	
	OPEN WINDOW win WITH FORM "form/ui_set_widgetProperties"
	
	
	LET ui_label = ui.Label.ForName("w_label")
	LET ui_textField = ui.TextField.ForName("w_textField")
	LET ui_textArea = ui.TextArea.ForName("w_textArea")
	LET ui_FunctionFieldAbs = ui.FunctionFieldAbs.ForName("w_FunctionFieldAbs")
	LET ui_spinner = ui.spinner.ForName("w_spinner")
	LET ui_calendar = ui.calendar.ForName("w_calendar")
	LET ui_button = ui.button.ForName("w_button")
	LET ui_checkbox = ui.checkbox.ForName("w_checkbox")
	LET ui_combobox = ui.combobox.ForName("w_combobox")
	LET ui_listbox = ui.listbox.ForName("w_listbox")
	LET ui_radiogroup = ui.radiogroup.ForName("w_radiogroup")
	LET ui_timeEditField = ui.timeEditField.ForName("w_timeEditField")

	
	
	DIALOG  ATTRIBUTE(UNBUFFERED)
		INPUT	BY NAME rec_property_values.* WITHOUT DEFAULTS
		
		END INPUT
		
		INPUT BY NAME rec_simpleWidgets.* WITHOUT DEFAULTS
		
		END INPUT

		ON ACTION "Clear/Init"
			CALL clear_data_rec_simpleWidgets()

		ON ACTION "Init"
			CALL init_data_rec_simpleWidgets()

		ON ACTION "setLabeltext"
			#CALL ui_label.SetLabelText(rec_property_values.f_labelText)	
			CALL ui_textField.SetLabelText(rec_property_values.f_labelText)	
			CALL ui_textArea.SetLabelText(rec_property_values.f_labelText)	
			#CALL ui_FunctionFieldAbs.SetLabelText(rec_property_values.f_labelText)	
			#CALL ui_spinner.SetLabelText(rec_property_values.f_labelText)
			#CALL ui_calendar.SetLabelText(rec_property_values.f_labelText)
			#CALL ui_button.SetLabelText(rec_property_values.f_labelText)
			#CALL ui_checkbox.SetLabelText(rec_property_values.f_labelText)
			CALL ui_combobox.SetLabelText(rec_property_values.f_labelText)
			#CALL ui_listbox.SetLabelText(rec_property_values.f_labelText)
			#CALL ui_radiogroup.SetLabelText(rec_property_values.f_labelText)
			CALL ui_timeEditField.SetLabelText(rec_property_values.f_labelText)

			CALL ui.interface.refresh()

		ON ACTION "set Tooltip"
			CALL ui_label.setTooltip(rec_property_values.f_labelText)	
			CALL ui_textField.setTooltip(rec_property_values.f_labelText)	
			CALL ui_textArea.setTooltip(rec_property_values.f_labelText)	
			CALL ui_FunctionFieldAbs.setTooltip(rec_property_values.f_labelText)	
			CALL ui_spinner.setTooltip(rec_property_values.f_labelText)
			# bang CALL ui_calendar.setTooltip(rec_property_values.f_labelText)
			CALL ui_button.setTooltip(rec_property_values.f_labelText)
			CALL ui_checkbox.setTooltip(rec_property_values.f_labelText)
			CALL ui_combobox.setTooltip(rec_property_values.f_labelText)
			CALL ui_listbox.setTooltip(rec_property_values.f_labelText)
			CALL ui_radiogroup.setTooltip(rec_property_values.f_labelText)
			CALL ui_timeEditField.setTooltip(rec_property_values.f_labelText)

			CALL ui.interface.refresh()

			

		ON ACTION "set placeholder text"
		#needs to clear fields prior

			CALL ui_textField.setPlaceholderText(rec_property_values.f_labelText)	
			CALL ui_textArea.setPlaceholderText(rec_property_values.f_labelText)	
#			CALL ui_FunctionFieldAbs.setPlaceholderText(rec_property_values.f_labelText)	
#			CALL ui_spinner.setPlaceholderText(rec_property_values.f_labelText)
			# bang CALL ui_calendar.setPlaceholderText(rec_property_values.f_labelText)
#			CALL ui_combobox.setPlaceholderText(rec_property_values.f_labelText)

			CALL ui_timeEditField.setPlaceholderText(rec_property_values.f_labelText)

			CALL ui.interface.refresh()

		ON ACTION "SetText"
			CALL ui_label.setText(rec_property_values.f_text)	
			CALL ui_textField.setText(rec_property_values.f_text)	
			CALL ui_textArea.setText(rec_property_values.f_text)		
			#CALL ui_FunctionFieldAbs.setText(rec_property_values.f_text)	
			#CALL ui_spinner.setText(rec_property_values.f_text)
			#CALL ui_calendar.setText(rec_property_values.f_text)
			CALL ui_button.setText(rec_property_values.f_text)
			#CALL ui_checkbox.setText(rec_property_values.f_text)
			CALL ui_combobox.setText(rec_property_values.f_text)
			#CALL ui_listbox.setText(rec_property_values.f_text)
			#CALL ui_radiogroup.setText(rec_property_values.f_text)
			CALL ui_timeEditField.setText(rec_property_values.f_text)
			
			CALL ui.interface.refresh()
														
		ON ACTION "SetTitle"
			#CALL ui_label.setTitle(rec_property_values.f_title)	
			#CALL ui_textField.setTitle(rec_property_values.f_title)	
			#CALL ui_textArea.setTitle(rec_property_values.f_title)		
			#CALL ui_FunctionFieldAbs.setTitle(rec_property_values.f_title)	
			#CALL ui_spinner.setTitle(rec_property_values.f_title)
			#CALL ui_calendar.setTitle(rec_property_values.f_title)
			#CALL ui_button.setTitle(rec_property_values.f_title)
			CALL ui_checkbox.setTitle(rec_property_values.f_title)
			#CALL ui_combobox.setTitle(rec_property_values.f_title)
			#CALL ui_listbox.setTitle(rec_property_values.f_title)
			#CALL ui_radiogroup.setTitle(rec_property_values.f_title)
			#CALL ui_timeEditField.setTitle(rec_property_values.f_title)
			
			CALL ui.interface.refresh()

		ON ACTION "SetToolTip"
			CALL ui_label.setTooltip(rec_property_values.f_tooltip)	
			CALL ui_textField.setTooltip(rec_property_values.f_tooltip)	
			CALL ui_textArea.setTooltip(rec_property_values.f_tooltip)		
			CALL ui_FunctionFieldAbs.setTooltip(rec_property_values.f_tooltip)
			CALL ui_spinner.setTooltip(rec_property_values.f_tooltip)
#needs checking runtime error			CALL ui_calendar.setTooltip(rec_property_values.f_tooltip)
			CALL ui_button.setTooltip(rec_property_values.f_tooltip)
			CALL ui_checkbox.setTooltip(rec_property_values.f_tooltip)
			CALL ui_combobox.setTooltip(rec_property_values.f_tooltip)
			CALL ui_listbox.setTooltip(rec_property_values.f_tooltip)
			CALL ui_radiogroup.setTooltip(rec_property_values.f_tooltip)
			CALL ui_timeEditField.setTooltip(rec_property_values.f_tooltip)


			CALL ui.interface.refresh()


		ON ACTION "SetComment"
			#CALL ui_label.setComment(rec_property_values.f_tooltip)	
			#CALL ui_textField.setComment(rec_property_values.f_tooltip)	
			#CALL ui_textArea.setComment(rec_property_values.f_tooltip)		
			#CALL ui_FunctionFieldAbs.setComment(rec_property_values.f_tooltip)
			#CALL ui_spinner.setComment(rec_property_values.f_tooltip)
			#CALL ui_calendar.setComment(rec_property_values.f_tooltip)
			#CALL ui_button.setComment(rec_property_values.f_tooltip)
			#CALL ui_checkbox.setComment(rec_property_values.f_tooltip)
			#CALL ui_combobox.setComment(rec_property_values.f_tooltip)
			#CALL ui_listbox.setComment(rec_property_values.f_tooltip)
			#CALL ui_radiogroup.setComment(rec_property_values.f_tooltip)
			#CALL ui_timeEditField.setComment(rec_property_values.f_tooltip)


			CALL ui.interface.refresh()
												
	
												
		ON ACTION "setHelpertext"
			#CALL ui_label.SetHelperText(rec_property_values.f_helperText)	
			CALL ui_textField.SetHelperText(rec_property_values.f_helperText)
	    CALL ui_textArea.SetHelperText(rec_property_values.f_helperText)
	    #CALL ui_FunctionFieldAbs.SetHelperText(rec_property_values.f_helperText)
	    #CALL ui_spinner.SetHelperText(rec_property_values.f_helperText)	    	
			#CALL ui_calendar.SetHelperText(rec_property_values.f_helperText)
			#CALL ui_button.SetHelperText(rec_property_values.f_helperText)
			#CALL ui_checkbox.SetHelperText(rec_property_values.f_helperText)
			CALL ui_combobox.SetHelperText(rec_property_values.f_helperText)
			CALL ui_listbox.SetHelperText(rec_property_values.f_helperText)
			#CALL ui_radiogroup.SetHelperText(rec_property_values.f_helperText)
			CALL ui_timeEditField.SetHelperText(rec_property_values.f_helperText)

			CALL ui.interface.refresh()
				
		ON ACTION "SetPlaceholderText"
			#CALL ui_label.setPlaceholderText(rec_property_values.f_placeholderText)	
			CALL ui_textField.setPlaceholderText(rec_property_values.f_placeholderText)	
			CALL ui_textArea.setPlaceholderText(rec_property_values.f_placeholderText)		
			#CALL ui_FunctionFieldAbs.setPlaceholderText(rec_property_values.f_placeholderText)		
			#CALL ui_spinner.setPlaceholderText(rec_property_values.f_placeholderText)						
			#CALL ui_calendar.setPlaceholderText(rec_property_values.f_placeholderText)
			#CALL ui_button.setPlaceholderText(rec_property_values.f_placeholderText)
			#CALL ui_checkbox.setPlaceholderText(rec_property_values.f_placeholderText)
			#CALL ui_combobox.setPlaceholderText(rec_property_values.f_placeholderText)
			#CALL ui_listbox.setPlaceholderText(rec_property_values.f_placeholderText)
			#CALL ui_radiogroup.setPlaceholderText(rec_property_values.f_placeholderText)
			CALL ui_timeEditField.setPlaceholderText(rec_property_values.f_value)

			CALL ui.interface.refresh()

		ON ACTION "setValue"
		#Only for radioButtons ?
			#CALL ui_label.setValue(rec_property_values.f_value)	
			#CALL ui_textField.setValue(rec_property_values.f_value)	
			#CALL ui_textArea.setValue(rec_property_values.f_value)		
			#CALL ui_FunctionFieldAbs.setValue(rec_property_values.f_value)		
			#CALL ui_spinner.setValue(rec_property_values.f_value)						
			#CALL ui_calendar.setValue(rec_property_values.f_value)
			#CALL ui_button.setValue(rec_property_values.f_value)
			#CALL ui_checkbox.setValue(rec_property_values.f_value)
			#CALL ui_combobox.setValue(rec_property_values.f_value)
			#CALL ui_listbox.setValue(rec_property_values.f_value)
			#CALL ui_radiogroup.setValue(rec_property_values.f_value)
			#CALL ui_timeEditField.setValue(rec_property_values.f_value)

			CALL ui.interface.refresh()

			
		ON ACTION "setTextPicture"
			CALL ui_label.setTextPicture(rec_property_values.f_placeholderText)	
			CALL ui_textField.setTextPicture(rec_property_values.f_placeholderText)	
			#CALL ui_textArea.setTextPicture(rec_property_values.f_placeholderText)		
			#CALL ui_FunctionFieldAbs.setTextPicture(rec_property_values.f_placeholderText)		
			#CALL ui_spinner.setTextPicture(rec_property_values.f_placeholderText)						
			#CALL ui_calendar.setTextPicture(rec_property_values.f_placeholderText)
			#CALL ui_button.setTextPicture(rec_property_values.f_placeholderText)
			#CALL ui_checkbox.setTextPicture(rec_property_values.f_placeholderText)
			#CALL ui_combobox.setTextPicture(rec_property_values.f_placeholderText)
			#CALL ui_listbox.setTextPicture(rec_property_values.f_placeholderText)
			#CALL ui_radiogroup.setTextPicture(rec_property_values.f_placeholderText)
			CALL ui_timeEditField.setTextPicture(rec_property_values.f_placeholderText)

			CALL ui.interface.refresh()

			
		ON ACTION "setVisibleOn"
			CALL ui_label.setVisible(TRUE)	
			CALL ui_textField.setVisible(TRUE)	
			CALL ui_textArea.setVisible(TRUE)		
			CALL ui_FunctionFieldAbs.setVisible(TRUE)		
			CALL ui_spinner.setVisible(TRUE)						
			#CALL ui_calendar.setVisible(TRUE)
			CALL ui_button.setVisible(TRUE)
			CALL ui_checkbox.setVisible(TRUE)
			CALL ui_combobox.setVisible(TRUE)
			CALL ui_listbox.setVisible(TRUE)
			CALL ui_radiogroup.setVisible(TRUE)
			CALL ui_timeEditField.setVisible(TRUE)

			CALL ui.interface.refresh()

		ON ACTION "setVisibleOff"
			CALL ui_label.setVisible(FALSE)	
			CALL ui_textField.setVisible(FALSE)	
			CALL ui_textArea.setVisible(FALSE)		
			CALL ui_FunctionFieldAbs.setVisible(FALSE)		
			CALL ui_spinner.setVisible(FALSE)						
			#CALL ui_calendar.setVisible(FALSE)
			CALL ui_button.setVisible(FALSE)
			CALL ui_checkbox.setVisible(FALSE)
			CALL ui_combobox.setVisible(FALSE)
			CALL ui_listbox.setVisible(FALSE)
			CALL ui_radiogroup.setVisible(FALSE)
			CALL ui_timeEditField.setVisible(FALSE)

			CALL ui.interface.refresh()

		ON ACTION "setCollapsedOn"
			CALL ui_label.setCollapsed(TRUE)	
			CALL ui_textField.setCollapsed(TRUE)	
			CALL ui_textArea.setCollapsed(TRUE)		
			CALL ui_FunctionFieldAbs.setCollapsed(TRUE)		
			CALL ui_spinner.setCollapsed(TRUE)						
			#CALL ui_calendar.setCollapsed(TRUE)
			CALL ui_button.setCollapsed(TRUE)
			CALL ui_checkbox.setCollapsed(TRUE)
			CALL ui_combobox.setCollapsed(TRUE)
			CALL ui_listbox.setCollapsed(TRUE)
			CALL ui_radiogroup.setCollapsed(TRUE)
			CALL ui_timeEditField.setCollapsed(TRUE)

			CALL ui.interface.refresh()																	

		ON ACTION "setCollapsedOff"
			CALL ui_label.setCollapsed(FALSE)	
			CALL ui_textField.setCollapsed(FALSE)	
			CALL ui_textArea.setCollapsed(FALSE)		
			CALL ui_FunctionFieldAbs.setCollapsed(FALSE)		
			CALL ui_spinner.setCollapsed(FALSE)						
			#CALL ui_calendar.setCollapsed(FALSE)
			CALL ui_button.setCollapsed(FALSE)
			CALL ui_checkbox.setCollapsed(FALSE)
			CALL ui_combobox.setCollapsed(FALSE)
			CALL ui_listbox.setCollapsed(FALSE)
			CALL ui_radiogroup.setCollapsed(FALSE)
			CALL ui_timeEditField.setCollapsed(FALSE)

			CALL ui.interface.refresh()		
		ON ACTION "Exit"
			EXIT DIALOG
			
	END DIALOG

END MAIN


################################################################################
# FUNCTION init_data_rec_simpleWidgets()
#
#
################################################################################
FUNCTION init_data_rec_simpleWidgets()
	#LET rec_simpleWidgets.w_label
	LET rec_simpleWidgets.w_textField = "Mike Johnson"
	LET rec_simpleWidgets.w_textArea = "Mike is a nice person.\nLast year, he went to Paris and invited everybody for a french bread stick with a cup of coffee. He also played with every child on the street. A really nice guy."
	LET rec_simpleWidgets.w_FunctionFieldAbs = "Mike@johnson.de"	
	LET rec_simpleWidgets.w_spinner = 50	
	LET rec_simpleWidgets.w_calendar = "12/12/2018"	
	#LET rec_simpleWidgets.w_button = "Mike Johnson"	
	LET rec_simpleWidgets.w_CheckBox = "1"	
	LET rec_simpleWidgets.w_ComboBox = "1"	
	LET rec_simpleWidgets.w_ListBox = "1"
	LET rec_simpleWidgets.w_RadioGroup = "1"		
	LET rec_simpleWidgets.w_timeEditField = "12:12"	
	
	
END FUNCTION

################################################################################
# FUNCTION clear_data_rec_simpleWidgets()
#
#
################################################################################
FUNCTION clear_data_rec_simpleWidgets()
	#LET rec_simpleWidgets.w_label
	LET rec_simpleWidgets.w_textField = ""
	LET rec_simpleWidgets.w_textArea = ""
	LET rec_simpleWidgets.w_FunctionFieldAbs = ""	
	LET rec_simpleWidgets.w_spinner = NULL	
	LET rec_simpleWidgets.w_calendar = NULL	
	#LET rec_simpleWidgets.w_button = NULL
	LET rec_simpleWidgets.w_CheckBox = NULL
	LET rec_simpleWidgets.w_ComboBox = NULL	
	LET rec_simpleWidgets.w_ListBox = NULL
	LET rec_simpleWidgets.w_RadioGroup = NULL
	LET rec_simpleWidgets.w_timeEditField = NULL
	
	
END FUNCTION #clear_data_rec_simpleWidgets


################################################################################
# FUNCTION init_rec_property_values()
#
#
################################################################################
FUNCTION init_rec_property_values()
	LET rec_property_values.f_labelText  = "000000000000000000"
	LET rec_property_values.f_text    = "AAAAAAAAAAAAAAAA"
	LET rec_property_values.f_tooltip = "CCCCCCCCCCCCCCCC"
		
	LET rec_property_values.f_title   = "BBBBBBBBBBBBBBBB"

	LET rec_property_values.f_comment = "DDDDDDDDDDDDDDDD"
	LET rec_property_values.f_value   = "EEEEEEEEEEEEEEEE"
	LET rec_property_values.f_helperText   = "HHHHHHHHHHHHHHHHH"
	LET rec_property_values.f_placeholderText   = "IIIIIIIIIIIIIII"
	LET rec_property_values.f_value   = "1"
	LET rec_property_values.f_textPicture = "###-###-####x#####"
END FUNCTION