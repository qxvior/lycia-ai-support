#########################################################################################################
# GUI Demo Application to demonstrate GUI Clients
#
# Modification History:
# 15.05.04 DS - Created
# 29.05.05 HH - Changed Form and Layout to make it company based
# 15.05.05 DS - Favourits URL in combo box
# Current Limitations & Bugs:
#
#
#########################################################################################################

############################################################
#! Globals
############################################################
GLOBALS "gd_globals.4gl"

	DEFINE test_rec 
		OF RECORD
			t01_tf_01 STRING,  #!textField
			t01_tf_02 STRING,  #!functionField
			t01_tf_03 DATE,    #!calendar
			t01_tf_04 STRING,  #!comboBox
			t01_tf_05 SMALLINT,#!spinner
			t01_tf_06 DATETIME HOUR TO SECOND,  #!timeEditField
			t01_tf_07 SMALLINT, #!slider
			t01_tf_08 SMALLINT, #!scrollBar
			t01_tf_09 SMALLINT,	#!progressbar
			t01_tf_10 BOOLEAN, 
			t01_tf_11 SMALLINT, #!special radioButton 
			t01_tf_12 SMALLINT,	#!radioButton
			t01_tf_20 STRING, 
			t01_tf_21 INTEGER
			#t01_tf_21 CANVAS, t01_tf_22 BROWSER, t01_tf_23 WEBCOMPONET
			#t01_table_01 TABLE, t01_table_02 TABLE , t01_table_03 TREETABLE

		END RECORD

	DEFINE test_arr_rec1_01 DYNAMIC ARRAY OF
		RECORD
			t01_table_01_01 STRING,
			t01_table_01_02 STRING,
			t01_table_01_03 STRING
		END RECORD

	DEFINE test_arr_rec1_02 DYNAMIC ARRAY OF
		RECORD
			t01_table_02_01 STRING,
			t01_table_02_02 STRING,
			t01_table_02_03 STRING
		END RECORD

	DEFINE test_arr_rec1_03 DYNAMIC ARRAY OF
		RECORD
			t01_table_03_01 STRING,
			t01_table_03_02 BOOLEAN,
			t01_table_03_03 STRING
		END RECORD


	DEFINE test_arr_rec1_04 DYNAMIC ARRAY OF
		RECORD
			t01_table_04_01 STRING,
			t01_table_04_02 BOOLEAN,
			t01_table_04_03 STRING
		END RECORD
		
	DEFINE treeArray DYNAMIC ARRAY OF RECORD
        nodeName 	CHAR(15), 
        nodeDescr char(15),
        id 				STRING, 
        parentId 	STRING,
        isexpand STRING,
        treeColImage			STRING
        END RECORD

#LET treeArray[1].nodename = "name-1"
#LET treeArray[1].nodeDescr = "descr-1"
#LET treeArray[1].id = 1
#LET treeArray[1].parentId = NULL
        
#########################################################################################################
# FUNCTION control_form()
#!Doesn't use in project
######################################################################################################### 
FUNCTION control_demo()
  DEFINE 
    yes_no CHAR,
    inp_char CHAR
	define c char

	CALL fgl_window_open("w_widget_demo",1,1,get_form_path("gd_f_widgets_mixed_2_2"),FALSE) 

  CALL fgl_putenv("DBDATE=dmy4.")

	CALL initData()

	#open window w_fd2_widget_mixed_various_01 with form "form/fd2_widget_mixed_various_01" attribute(border)
	
	CALL displayUpdate()
	
	DIALOG 
        	
	INPUT BY NAME test_rec.* WITHOUT DEFAULTS
	#INPUT BY NAME test_rec.t01_tf_01, test_rec.t01_tf_02, test_rec.t01_tf_03, test_rec.t01_tf_04, test_rec.t01_tf_05, test_rec.t01_tf_06, test_rec.t01_tf_07, test_rec.t01_tf_08, test_rec.t01_tf_09, test_rec.t01_tf_10,  
			#test_rec.t01_tf_11,
 			#test_rec.t01_tf_12, 
 			#test_rec.t01_tf_20 
 			#test_rec.t01_tf_21
 		#WITHOUT DEFAULTS
	END INPUT	

	DISPLAY ARRAY test_arr_rec1_01 TO t01_table_01.* --WITHOUT SCROLL
	END DISPLAY

	INPUT ARRAY test_arr_rec1_02  WITHOUT DEFAULTS FROM t01_table_02.*
	END INPUT


	DISPLAY ARRAY test_arr_rec1_03 TO t01_table_03.* --WITHOUT SCROLL
	END DISPLAY

	INPUT ARRAY test_arr_rec1_04  WITHOUT DEFAULTS FROM t01_table_04.*
	END INPUT

	#CALL set_count(23)

	DISPLAY ARRAY treeArray TO treeTable.* --WITHOUT SCROLL
	END DISPLAY

 		#ON KEY(INTERRUPT)
		#	EXIT DIALOG

        		
		BEFORE DIALOG
        CALL publish_toolbar("control_w",0)	
			
		ON KEY (F1)
			CALL fgl_winmessage("Key Event F1","Key Event F1","info")

		ON KEY (F2)
			CALL fgl_winmessage("Key Event F2","Key Event F2","info")

		ON KEY (F3)
			CALL fgl_winmessage("Key Event F3","Key Event F3","info")
			
		ON KEY (F4)
			CALL fgl_winmessage("Key Event F4","Key Event F4","info")
			
		ON KEY (F5)
			CALL fgl_winmessage("Key Event F5","Key Event F5","info")
			
		ON KEY (F6)
			CALL fgl_winmessage("Key Event F6","Key Event F6","info")
			
		ON KEY (F7)
			CALL fgl_winmessage("Key Event F7","Key Event F7","info")
			
		ON KEY (F8)
			CALL fgl_winmessage("Key Event F8","Key Event F8","info")
			
		ON KEY (F9)
			CALL fgl_winmessage("Key Event F9","Key Event F9","info")
			#EXIT DISPLAY
			ACCEPT DIALOG			
			
		ON KEY (F10)
			CALL fgl_winmessage("Key Event F10","Key Event F10","info")
			EXIT DIALOG			
			
		ON KEY (F11)
			CALL fgl_winmessage("Key Event F11","Key Event F11-exit","info")
			EXIT DIALOG			
		ON KEY (F12)
			CALL fgl_winmessage("Key Event F12","Key Event F12","info")
			
		ON KEY (F13)
			CALL fgl_winmessage("Key Event F13","Key Event F13","info")
			
		ON KEY (F14)
			CALL fgl_winmessage("Key Event F14","Key Event F14","info")
			
		ON KEY (F15)
			CALL fgl_winmessage("Key Event F15","Key Event F15","info")
			
		ON KEY (F16)
			CALL fgl_winmessage("Key Event F16","Key Event F16","info")
			
		ON KEY (F17)
			CALL fgl_winmessage("Key Event F17","Key Event F17","info")
			
		ON KEY (F18)
			CALL fgl_winmessage("Key Event F18","Key Event F18","info")
			
		ON KEY (F19)
			CALL fgl_winmessage("Key Event F19","Key Event F19","info")
			
		ON KEY (F20)
			CALL fgl_winmessage("Key Event F20","Key Event F20","info")
			

			
		ON ACTION (Act_15)
			CALL fgl_winmessage("ACTION Event Act_15","ACTION Event Act_15","info")
			
			
		ON ACTION (actExitModule)
			EXIT DIALOG

	
  
	END DIALOG
			

  CALL fgl_window_close("w_widget_demo")

END FUNCTION

#Used by gd_widget_demo
FUNCTION initData()
	DEFINE i INT
	
	LET test_rec.t01_tf_01 = "01-Sample String-01"  --textField
	LET test_rec.t01_tf_02 = "02-Sample String-02"	--functionField
	LET test_rec.t01_tf_03 = "24/12/2013"	--calendar
	LET test_rec.t01_tf_04 = "combo_value3"  --comboBox
	LET test_rec.t01_tf_05 = 33		--spinner
	LET test_rec.t01_tf_06 = "10:11:12"	--timeEditField


	LET test_rec.t01_tf_07 = 50  --slider
	LET test_rec.t01_tf_08 = 60  --scrollBar
	LET test_rec.t01_tf_09 = 70  --progressBar
	LET test_rec.t01_tf_10 = TRUE  --checkBox

	LET test_rec.t01_tf_11 = 2  --RadioButton (group value)
	LET test_rec.t01_tf_12 = 3  --RadioButtonList

	LET test_rec.t01_tf_20 = "Text Area abcdefgh ijklmnop qrstuvwxyz Text Area \nabcdefgh ijklmnop qrstuvwxyz Text Area abcdefgh ijklmnop qrstuvwxyz Text Area abcdefgh ijklmnop qrstuvwxyz \nText Area abcdefgh \nijklmnop qrstuvwxyz Text Area abcdefgh ijklmnop qrstuvwxyz \nText Area abcdefgh \nijklmnop qrstuvwxyz Text Area abcdefgh ijklmnop \nqrstuvwxyz Text Area abcdefgh \nijklmnop qrstuvwxyz \nText Area abcdefgh \nijklmnop qrstuvwxyz "		--textyArea
	LET test_rec.t01_tf_21 = 5	--listBox
	#LET test_rec.t01_tf_22 = "qx://application/image/kite_Talon_std_1.svg"		--canvas
	#LET test_rec.t01_tf_23 = "www.google.com"

	FOR i=1 TO 10 #20
	
	LET test_arr_rec1_01[i].t01_table_01_01 = "R-",i CLIPPED,"-C1"
	LET test_arr_rec1_01[i].t01_table_01_02 = "R-",i CLIPPED,"-C2"
	LET test_arr_rec1_01[i].t01_table_01_03 = "R-",i CLIPPED,"-C3"

	LET test_arr_rec1_02[i].t01_table_02_01 = "R-",i CLIPPED,"-C1"
	LET test_arr_rec1_02[i].t01_table_02_02 = "R-",i CLIPPED,"-C2"
	LET test_arr_rec1_02[i].t01_table_02_03 = "R-",i CLIPPED,"-C3"

	LET test_arr_rec1_03[i].t01_table_03_01 = "value3" --"row-",i CLIPPED,"-col-1"
	LET test_arr_rec1_03[i].t01_table_03_02 = TRUE --"row-",i CLIPPED,"-col-1"
	LET test_arr_rec1_03[i].t01_table_03_03 = "R-",i CLIPPED,"-C3"	

	LET test_arr_rec1_04[i].t01_table_04_01 = "value3" --"row-",i CLIPPED,"-col-1"
	LET test_arr_rec1_04[i].t01_table_04_02 = TRUE --"row-",i CLIPPED,"-col-1"
	LET test_arr_rec1_04[i].t01_table_04_03 = "R-",i CLIPPED,"-C3"	
		
	END FOR


	#Initialise data for treeTable

LET treeArray[1].nodeName = "name-1"
LET treeArray[1].nodeDescr = "descr-1"
LET treeArray[1].id = 1
LET treeArray[1].parentId = NULL
LET treeArray[1].isexpand = 1
LET treeArray[1].treeColImage = "icon10/node01.ico"

LET treeArray[2].nodeName = "name-1.1"
LET treeArray[2].nodeDescr = "descr-1.1"
LET treeArray[2].id = "1.1"
LET treeArray[2].parentId = 1
LET treeArray[2].isexpand = 0
LET treeArray[2].treeColImage = "icon10/node02.ico"

LET treeArray[3].nodeName = "name-1.2"
LET treeArray[3].nodeDescr = "descr-1.2"
LET treeArray[3].id = "1.2"
LET treeArray[3].parentId = 1
LET treeArray[3].isexpand = 0
LET treeArray[3].treeColImage = "icon10/node02.ico"

LET treeArray[4].nodeName = "name-2"
LET treeArray[4].nodeDescr = "descr-2"
LET treeArray[4].id = 2
LET treeArray[4].parentId = null
LET treeArray[4].isexpand = 1
LET treeArray[4].treeColImage = "icon10/node01.ico"

LET treeArray[5].nodeName = "name-2.1"
LET treeArray[5].nodeDescr = "descr-2.1"
LET treeArray[5].id = "2.1"
LET treeArray[5].parentId = 2
LET treeArray[5].isexpand = 0
LET treeArray[5].treeColImage = "icon10/node02.ico"

LET treeArray[6].nodeName = "name-2.2"
LET treeArray[6].nodeDescr = "descr-2.2"
LET treeArray[6].id = "2.2"
LET treeArray[6].parentId = 2
LET treeArray[6].isexpand = 1
LET treeArray[6].treeColImage = "icon10/node02.ico"

LET treeArray[7].nodeName = "name-2.2.1"
LET treeArray[7].nodeDescr = "descr-2.2.1"
LET treeArray[7].id = "2.2.1"
LET treeArray[7].parentId = "2.2"
LET treeArray[7].isexpand = 0
LET treeArray[7].treeColImage = "icon10/node03.ico"

LET treeArray[8].nodeName = "name-2.3"
LET treeArray[8].nodeDescr = "descr-2.3"
LET treeArray[8].id = "2.3"
LET treeArray[8].parentId = 2
LET treeArray[8].isexpand = 0
LET treeArray[8].treeColImage = "icon10/node02.ico"

END FUNCTION



#!Doesn't use in project
FUNCTION displayUpdate()
	DISPLAY BY NAME test_rec.t01_tf_01
	DISPLAY BY NAME test_rec.t01_tf_02
	DISPLAY BY NAME test_rec.t01_tf_03
	DISPLAY BY NAME test_rec.t01_tf_04
	DISPLAY BY NAME test_rec.t01_tf_05
	DISPLAY BY NAME test_rec.t01_tf_06
	DISPLAY BY NAME test_rec.t01_tf_07
	DISPLAY BY NAME test_rec.t01_tf_08
	DISPLAY BY NAME test_rec.t01_tf_09
	DISPLAY BY NAME test_rec.t01_tf_10
	#DISPLAY BY NAME test_rec.t01_tf_11
	DISPLAY BY NAME test_rec.t01_tf_12
	#DISPLAY BY NAME test_rec.t01_tf_13
	#DISPLAY BY NAME test_rec.t01_tf_14
	#DISPLAY BY NAME test_rec.t01_tf_15
	#DISPLAY BY NAME test_rec.t01_tf_16
	#DISPLAY BY NAME test_rec.t01_tf_17
	#DISPLAY BY NAME test_rec.t01_tf_18
	#DISPLAY BY NAME test_rec.t01_tf_19
	DISPLAY BY NAME test_rec.t01_tf_20
	#DISPLAY BY NAME test_rec.t01_tf_21  --BUG in tool
	#DISPLAY BY NAME test_rec.t01_tf_22
	#DISPLAY BY NAME test_rec.t01_tf_23
	#DISPLAY BY NAME test_rec.t01_tf_24
	#DISPLAY BY NAME test_rec.t01_tf_25

	

END FUNCTION

#########################################################################################################
# FUNCTION control_logic()
#! Doesn't use in project
######################################################################################################### 
FUNCTION control_logic()
  DISPLAY "!" TO fb_cancel
  DISPLAY "!" TO fb_help
  DISPLAY "!" TO fi_logo

  INPUT BY NAME comp_rec.* 
                WITHOUT DEFAULTS
                HELP 2

    #ON KEY("F82")
    ON ACTION ("help_about")
      CALL fgl_winmessage(get_strm(6),get_strm(7) || "\n" || get_strm(8) || "\n" || get_strm(9),"info") 

    AFTER FIELD f_favourites
      IF FIELD_TOUCHED(f_favourites) THEN
        LET comp_rec.temp_url = get_favourite_url(comp_rec.f_favourites)
        LET comp_rec.comp_url = comp_rec.temp_url
        DISPLAY BY NAME comp_rec.temp_url
        DISPLAY BY NAME comp_rec.comp_url
      END IF

    AFTER FIELD temp_url
      IF FIELD_TOUCHED(temp_url) THEN
        LET comp_rec.comp_url = comp_rec.temp_url
        DISPLAY BY NAME comp_rec.comp_url
      END IF

    ON KEY(F11)
      EXIT INPUT
  END INPUT
             

  CLEAR SCREEN
END FUNCTION

############################################################################################
# FUNCTION get_favourite_url(favourites)
#! Doesn't use in project
############################################################################################
FUNCTION get_favourite_url(favourites)
  DEFINE favourites, ret_value CHAR(100)

  CASE favourites

    WHEN "Querix"
      LET ret_value =  get_strm(3)
      LET comp_rec.comp_url = get_strm(3)
      LET comp_rec.temp_url = get_strm(3)

    WHEN "F1"
      LET ret_value =  get_strm(10)
      LET comp_rec.comp_url =  get_strm(10)
      LET comp_rec.temp_url =  get_strm(10)
      DISPLAY  get_strm(10) TO comp_url
      DISPLAY  get_strm(10) TO temp_url

    WHEN "Asix"
      LET ret_value = get_strm(11)

    WHEN "Provia"
      LET ret_value =  get_strm(12)

    WHEN "Millogiciel"
      LET ret_value =  get_strm(13)

    OTHERWISE
      CALL fgl_winmessage(get_strm(20), get_str(22) || "get_favourite_url(favourites)\nfavourites = " || favourites,"stop")
      LET ret_value =  get_strm(14)
  END CASE

  RETURN ret_value

END FUNCTION

