##################################################################################
# Module Scope Variables
##################################################################################
DEFINE recData OF 
	RECORD
	windowType SMALLINT,
	rcWidth, rcHeight STRING,
	rcHorizontalAlign, rcVerticalAlign STRING,
	f1,f2,f3 STRING,
	f4 DATE,
	f5, f6 SMALLINT	
	END RECORD

DEFINE windowType SMALLINT	
DEFINE arrMenuSelect DYNAMIC ARRAY OF
	RECORD
		rcWidth, rcHeight, rcHorizontalAlign, rcVerticalAlign STRING
	END RECORD	


##################################################################################
# MAIN
#
#
##################################################################################	
MAIN
	DEFINE rowID SMALLINT
	CALL ui_init()

	DEFER INTERRUPT

	OPTIONS INPUT WRAP
OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	CALL initData()
	
	OPEN WINDOW wMenu WITH FORM "form/lay_gridPanel_01"
	CALL ui.Interface.setText("Layout gridPanel")
	
	CALL hideNavigation()
	LET rowID = 1
	DIALOG
		INPUT BY NAME windowType WITHOUT DEFAULTS
		END INPUT			

		DISPLAY ARRAY arrMenuSelect TO scMenuSelect.*  	 	 
			BEFORE ROW
			LET rowID = arr_curr()
		END DISPLAY

		ON ACTION "ACCEPT"
			CALL updateData(rowID)
			CALL openWindow(windowType,rowID)

		ON ACTION "CANCEL"
			EXIT DIALOG


	END DIALOG
	
END MAIN


##################################################################################
# FUNCTION openWindow(pScreen,pForm)
#
#
##################################################################################	
FUNCTION openWindow(pScreen,pForm)
	DEFINE pScreen SMALLINT
	DEFINE pForm SMALLINT
	DEFINE wAttribute STRING
	DEFINE w WINDOW
	DEFINE formPath, formSegment STRING
	#window type	
	IF pScreen = 0 THEN
		LET wAttribute = ""  --full screen window
	ELSE
		LET wAttribute = "BORDER, STYLE=\"CENTER\""  --dialog window
	END IF
	
	#form name
	LET formPath = "form/lay_gridPanel_01_ps_"
	
	LET formPath = formPath, trim(arrMenuSelect[pForm].rcWidth), "_"
	LET formPath = formPath, trim(arrMenuSelect[pForm].rcHeight), "_"
	LET formPath = formPath, "ha_", trim(arrMenuSelect[pForm].rcHorizontalAlign), "_"
	LET formPath = formPath, "va_", trim(arrMenuSelect[pForm].rcVerticalAlign), "_"
	LET formPath = formPath,"children_static" 
	
	#CALL w.openWithForm("wLayout",formPath,1,1,wAttribute)
	#CALL w.openWithForm("wLayout",formPath,1,1,"BORDER")
	IF pScreen = 0 THEN
		CALL fgl_window_open("wLayout", 1, 1, formPath, FALSE)

	ELSE
			CALL fgl_window_open("wLayout", 1, 1, formPath, TRUE)
	
	END IF		
	
	DISPLAY BY NAME formPath
	DISPLAY "This is the statusbar gridPanel container stretch/bottom" TO lbInfo2
	
	INPUT BY NAME recData.* WITHOUT DEFAULTS
		ON ACTION "Cancel"
			EXIT INPUT	
	END INPUT

	CALL fgl_window_close("wLayout")
	
END FUNCTION


##################################################################################
# FUNCTION updateData(id)
#
#
##################################################################################	
FUNCTION updateData(id)
	DEFINE id SMALLINT

	LET recData.windowType = windowType
	LET recData.rcWidth = arrMenuSelect[id].rcWidth
	LET recData.rcHeight = arrMenuSelect[id].rcHeight
	LET recData.rcHorizontalAlign = arrMenuSelect[id].rcHorizontalAlign
	LET recData.rcVerticalAlign = arrMenuSelect[id].rcVerticalAlign

END FUNCTION


##################################################################################
# FUNCTION initData()
#
#
##################################################################################	
FUNCTION initData()

	CALL arrMenuSelect.append([0,0,"stretch","stretch"])
	CALL arrMenuSelect.append([0,0,"left","top"])
	CALL arrMenuSelect.append([0,0,"stretch","top"])
	CALL arrMenuSelect.append([0,0,"left","stretch"])
	CALL arrMenuSelect.append([0,0,"center","center"])

	CALL arrMenuSelect.append(["50rem","50rem","stretch","stretch"])	
	CALL arrMenuSelect.append(["50rem","50rem","left","top"])
	CALL arrMenuSelect.append(["50rem","50rem","stretch","top"])
	CALL arrMenuSelect.append(["50rem","50rem","left","stretch"])
	CALL arrMenuSelect.append(["50rem","50rem","center","center"])

	LET recData.f1 = "Field F1"
	LET recData.f2 = "Field F2"
	LET recData.f3 = "Field F3"
	LET recData.f4 = DATE(TODAY)
	
	LET recData.f5 = 2
	LET recData.f6 = 1

END FUNCTION