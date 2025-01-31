#####################################################################################
# GLOBAL SCOPE VARIABLES and custom DataTypes
#####################################################################################
GLOBALS

	DEFINE glob_arr_widgetType DYNAMIC ARRAY OF STRING
	DEFINE glob_arr_rec_demoFormAll DYNAMIC ARRAY OF 
		RECORD
			widgetTypeID INT,
			demoForm STRING,
			demoDescription STRING
		END RECORD 

	DEFINE glob_arr_rec_demoForm DYNAMIC ARRAY OF #glob_arr_rec_demoFormAll 
		RECORD
			id INT,
			#widgetTypeID INT,
			demoForm STRING
			#demoDescription STRING
		END RECORD 


END GLOBALS


#####################################################################################
# FUNCTION widgetsMenu()
#
#
#####################################################################################
FUNCTION widgetsMenu()
	DEFINE l_i_type,l_i_demo SMALLINT
	DEFINE l_formName,l_formNameFull STRING
	DEFINE c CHAR
	DEFINE i SMALLINT
	
	OPEN WINDOW wMenu WITH FORM "per/per_widgets_menu" ATTRIBUTE(BORDER)

	CALL init_WidgetType()
	
	FOR i=1 TO 8
		CALL init_DemoForm(i)
	END FOR
	
	DIALOG ATTRIBUTE(UNBUFFERED)
	
		DISPLAY ARRAY glob_arr_widgetType TO scrWidgetType.*	#user can select the widget type
			BEFORE ROW
				LET l_i_type = arr_curr()
				
			ON ACTION ("DOUBLECLICK","ACCEPT")
				CALL glob_arr_rec_demoForm.clear()			
				IF l_i_type > 0 THEN
					CALL init_CurrentDemoFormArray(l_i_type)
				END IF
		END DISPLAY
		
		DISPLAY ARRAY glob_arr_rec_demoForm TO scrDemoForm.*
			BEFORE ROW
				LET l_i_demo = arr_curr()
				DISPLAY glob_arr_rec_demoFormAll[glob_arr_rec_demoForm[l_i_demo].id].demoDescription TO demoDescription

			ON ACTION "ACCEPT"
				IF l_i_demo > 0 THEN
					LET l_formName = glob_arr_rec_demoFormAll[glob_arr_rec_demoForm[l_i_demo].id].demoForm
					LET l_formNameFull = "per/", l_formName
					OPEN WINDOW wForm WITH FORM l_formNameFull

					MENU 
						COMMAND "DISPLAY" "Use the form in normal display mode"
							CALL formHandler(0,l_formName)
						COMMAND "INPUT" "Use the form in INPUT mode"
							CALL formHandler(1,l_formName)
						COMMAND "EXIT"
							EXIT MENU
					END MENU
								
					
					
					CLOSE WINDOW wForm
				END IF								
						
		END DISPLAY
	
		ON ACTION ("EXIT")
			EXIT DIALOG
			
	END DIALOG

	CLOSE WINDOW wMenu
END FUNCTION
#####################################################################################
# END FUNCTION widgetsMenu()
#####################################################################################


#####################################################################################
# FUNCTION init_CurrentDemoFormArray(p_widgetTypeID)
#
#
#####################################################################################
FUNCTION init_CurrentDemoFormArray(p_widgetTypeID)
	DEFINE p_widgetTypeID SMALLINT
	DEFINE i, t SMALLINT

	#CALL glob_arr_rec_demoForm.clear()
	LET t = 0
	
	FOR i = 1 TO glob_arr_rec_demoFormAll.getsize()
				IF glob_arr_rec_demoFormAll[i].widgetTypeID = p_widgetTypeID THEN
					LET t = t+1
					LET glob_arr_rec_demoForm[t].id = i				
					#LET glob_arr_rec_demoForm[t].widgetTypeID = glob_arr_rec_demoFormAll[i].widgetTypeID
					LET glob_arr_rec_demoForm[t].demoForm = glob_arr_rec_demoFormAll[i].demoForm
					#LET glob_arr_rec_demoForm[t].demoDescription = glob_arr_rec_demoFormAll[i].demoDescription
				END IF
	END FOR

	
END FUNCTION
#####################################################################################
# END FUNCTION
#####################################################################################


#####################################################################################
# FUNCTION init_WidgetType()
#
#
#####################################################################################
FUNCTION init_WidgetType()
	LET glob_arr_widgetType[1] = "Label"
	LET glob_arr_widgetType[2] = "TextField"
	LET glob_arr_widgetType[3] = "TextArea"
	LET glob_arr_widgetType[4] = "Browser"
	LET glob_arr_widgetType[5] = "ComboBox"
	LET glob_arr_widgetType[6] = "FunctionField"
	LET glob_arr_widgetType[7] = "Calendar"
	LET glob_arr_widgetType[8] = "CheckBox"
	LET glob_arr_widgetType[9] = "RadioGroup"
	LET glob_arr_widgetType[10] = "Button"

END FUNCTION
#####################################################################################
# END FUNCTION init_WidgetType()
#####################################################################################


#####################################################################################
# FUNCTION init_DemoForm()
#
#
#####################################################################################
FUNCTION init_DemoForm(p_typeID)
	DEFINE p_typeID SMALLINT
	DEFINE i, l_idx SMALLINT
	
	CASE p_typeID
		WHEN 1
			LET l_idx = 1
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 1 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_01" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic Integer based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 1 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_02" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic CHAR(3) based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 1 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_03" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic DECIMAL) based ComboBoxes" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 1 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_04" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 1 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_05" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 1 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_06" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 1 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_07" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 1 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_08" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 

		WHEN 2
			LET l_idx = 1
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 2 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_01" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic Integer based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 2 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_02" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic CHAR(3) based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 2 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_03" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic DECIMAL) based ComboBoxes" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 2 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_04" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 2 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_05" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 2 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_06" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 2 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_07" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 2 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_08" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 

		WHEN 3
			LET l_idx = 1
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 3 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_01" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic Integer based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 3 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_02" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic CHAR(3) based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 3 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_03" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic DECIMAL) based ComboBoxes" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 3 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_04" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 3 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_05" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 3 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_06" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 3 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_07" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 3 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_08" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 

		WHEN 4
			LET l_idx = 1
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 4 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_01" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic Integer based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 4 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_02" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic CHAR(3) based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 4 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_03" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic DECIMAL) based ComboBoxes" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 4 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_04" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 4 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_05" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 4 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_06" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 4 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_07" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 4 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_label_08" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 

	
		WHEN 5
			LET l_idx = 1
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 5 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_01" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic Integer based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 5 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_02" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic CHAR(3) based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 5 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_03" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic DECIMAL) based ComboBoxes" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 5 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_04" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 5 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_05" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 5 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_06" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 5 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_07" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 5 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_08" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 

	
		WHEN 6
			LET l_idx = 1
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 6 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_01" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic Integer based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 6 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_02" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic CHAR(3) based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 6 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_03" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic DECIMAL) based ComboBoxes" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 6 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_04" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 6 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_05" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 6 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_06" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 6 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_07" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 6 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_08" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 

		WHEN 7
			LET l_idx = 1
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 7 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_01" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic Integer based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 7 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_02" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic CHAR(3) based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 7 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_03" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic DECIMAL) based ComboBoxes" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 7 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_04" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 7 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_05" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 7 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_06" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 7 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_07" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 7 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_08" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 


		WHEN 8
			LET l_idx = 1
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 8 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_01" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic Integer based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 8 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_02" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic CHAR(3) based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 8 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_03" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic DECIMAL) based ComboBoxes" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 8 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_04" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 8 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_05" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 8 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_06" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 8 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_07" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 8 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_08" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 



		WHEN 9
			LET l_idx = 1
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 9 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_01" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic Integer based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 9 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_02" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic CHAR(3) based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 9 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_03" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic DECIMAL) based ComboBoxes" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 9 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_04" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 9 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_05" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 9 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_06" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 9 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_07" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 9 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_08" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 



		WHEN 10
			LET l_idx = 1
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 10 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_01" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic Integer based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 10 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_02" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic CHAR(3) based ComboBoxes" --comboBox 
		
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 10 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_03" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "4 Generic DECIMAL) based ComboBoxes" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 10 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_04" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 10 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_05" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 10 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_06" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 10 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_07" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 
			
			LET l_idx = l_idx + 1	
			LET glob_arr_rec_demoFormAll[l_idx].widgetTypeID = 10 --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoForm = "per_widgets_comboListBox_08" --comboBox 
			LET glob_arr_rec_demoFormAll[l_idx].demoDescription = "Feel free to add some information describing this form" --comboBox 



	END CASE
END FUNCTION
#####################################################################################
# END FUNCTION init_DemoForm()
#####################################################################################