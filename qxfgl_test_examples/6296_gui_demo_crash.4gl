GLOBALS "gd_globals.4gl"

MAIN
  DEFINE
    menu_str_arr1 ARRAY[15] OF VARCHAR(20), --i.e. used for rinmenu strings
    menu_str_arr2 ARRAY[15] OF VARCHAR(100) --i.e. used for rinmenu strings

	OPEN FORM f_guidemo FROM "6296/gd_f_guidemo_2_2"
	DISPLAY FORM f_guidemo
        LET menu_str_arr1[1] = get_str(51)
        LET menu_str_arr2[1] = get_str(52)
        LET menu_str_arr1[2] = get_str(53)
        LET menu_str_arr2[2] = get_str(54)
        LET menu_str_arr1[3] = get_str(55)
        LET menu_str_arr2[3] = get_str(56)
        LET menu_str_arr1[4] = get_str(57)
        LET menu_str_arr2[4] = get_str(58)
        LET menu_str_arr1[5] = get_str(59)
        LET menu_str_arr2[5] = get_str(60)
        LET menu_str_arr1[6] = get_str(61)
        LET menu_str_arr2[6] = get_str(62)
        LET menu_str_arr1[7] = get_str(63)
        LET menu_str_arr2[7] = get_str(64)
        LET menu_str_arr1[8] = get_str(65)
        LET menu_str_arr2[8] = get_str(66)
        LET menu_str_arr1[9] = get_str(67)
        LET menu_str_arr2[9] = get_str(68)
        LET menu_str_arr1[10] = get_str(69)
        LET menu_str_arr2[10] = get_str(70)
        LET menu_str_arr1[11] = get_str(71)
        LET menu_str_arr2[11] = get_str(72)
        LET menu_str_arr1[12] = get_str(73)
        LET menu_str_arr2[12] = get_str(74)
        LET menu_str_arr1[13] = get_str(75)
        LET menu_str_arr2[13] = get_str(76)
CALL theme_demo()



  MENU "GUI-Demo"
   	ON ACTION ("actExit","actExitTm")
  	ON ACTION "actGuiDemoEnglish"  --selection menu for what contact to display / countries
  	ON ACTION "actGuiDemoSpanish"  --selection menu for what contact to display / countries
  	ON ACTION "actGuiDemoGerman"  --selection menu for what contact to display / countries
  	ON ACTION "actGuiDemoFrench"  --selection menu for what contact to display / countries
  	ON ACTION "actGuiDemoArabic"  --selection menu for what contact to display / countries
  	ON ACTION "actGuiDemoItalian"  --selection menu for what contact to display / countries
  	ON ACTION "actGuiDemoOther"  --selection menu for what contact to display / countries
  	ON ACTION ("actControlDemo","actControlDemoTm")
      CALL control_demo()    
  	ON ACTION ("actDialogBoxes","actDialogBoxesTm")
      CALL msgbox_form()
  	ON ACTION ("actBlobDemo","actBlobDemoTm") 
      CALL document_form()
  	ON ACTION ("actThemeDemo","actThemeDemoTm")  
      CALL theme_demo()
  	ON ACTION ("actAttributesDemo","actAttributesDemoTm")  
      CALL color_demo(0)
  	ON ACTION ("actAttributesDemoChartTm")
      CALL color_demo(1)
  	ON ACTION ("actAttributesDemoDisplayTm")
      CALL color_demo(2)
  	ON ACTION ("actAttributesDemoDetailedTm")
      CALL color_demo(3)                  
  	ON ACTION ("actOnlineDemo","actOnlineDemoTm") 
      CALL web_demo("")
 
 
 		#Settings Menu 
  	ON ACTION ("actSettingsMenu","actSettingsMenuTm")
      CALL settings_menu(30)  --30 is the horizontal location

  	ON ACTION ("actSettingsGeneralTm")
      CALL settings_general(TRUE)

  	ON ACTION ("actSettingsToolbarTm")
  	ON ACTION ("actSettingsLanguageTm")
  	ON ACTION ("actHelpClassic","actHelpClassicTm")
   	ON ACTION ("actHelpHtml","actHelpHtmlTm")
  END MENU


END MAIN

FUNCTION get_str(id)
  DEFINE id SMALLINT
  DEFINE
    tl_multi_lingual_prog_str ARRAY[2500] OF 
      RECORD
        txt_en VARCHAR(100)
      END RECORD

      RETURN trim(tl_multi_lingual_prog_str[id].txt_en)

END FUNCTION

FUNCTION theme_demo()
  DEFINE local_debug SMALLINT
	DEFINE windowObject WINDOW
	DEFINE windowName STRING
	DEFINE formName STRING
	DEFINE themeName STRING
	DEFINE loopState BOOLEAN
	DEFINE inp_char CHAR
DEFINE app_info record width smallint end record
	
	OPEN WINDOW wTheme_01 WITh FORM "6296/gd_f_contact_english_2_2"
    PROMPT "" FOR CHAR inp_char HELP 100
      ON ACTION ("actWindowInformation")
        CALL get_4gl_window_information()
      ON ACTION ("actExit")
        LET loopState = FALSE
      ON ACTION ("Zzz")
        LET loopState = FALSE
      ON ACTION ("Zzz2")
        LET loopState = FALSE
      ON ACTION ("Zzz3")
        LET loopState = FALSE
      ON ACTION ("Zzz4")
        LET loopState = FALSE
      ON ACTION ("Zzz5")
        LET loopState = FALSE
      ON ACTION ("Zzz6")
        LET loopState = FALSE
      ON ACTION ("Zzz7")
        LET loopState = FALSE
      ON ACTION ("Zzz8")
        LET loopState = FALSE

      ON ACTION ("Zzz21")
        LET loopState = FALSE
      ON ACTION ("Zzz31")
        LET loopState = FALSE
      ON ACTION ("Zzz41")
        LET loopState = FALSE
      ON ACTION ("Zzz51")
        LET loopState = FALSE
      ON ACTION ("Zzz61")
        LET loopState = FALSE
      ON ACTION ("Zzz71")
        LET loopState = FALSE
      ON ACTION ("Zzz81")
        LET loopState = FALSE

      ON ACTION ("Zzz22")
      ON ACTION ("Zzz32")
      ON ACTION ("Zzz42")
      ON ACTION ("Zzz52")
      ON ACTION ("Zzz62")
      ON ACTION ("Zzz72")
      ON ACTION ("Zzz82")
      ON KEY(F81)
        CALL image_selection()  --click the persons picture

      ON KEY (F86)
        CALL send_email()

      ON KEY(F91)    -- DISPLAY Data Update
        CALL populate_form() 

      ON KEY(F101)
        CALL example_error()

      ON KEY(F102)
        CALL example_message()

    END PROMPT
	

END FUNCTION
FUNCTION get_4gl_window_information()
  DEFINE inp_temp char(1)

  CALL gwinfo_retrieve_application_information()
  sleep 2
  OPEN WINDOW w_gwinfo
    AT 2,2
    WITH 22 ROWS, 78 COLUMNS
    ATTRIBUTE (BORDER)
  CALL gwinfo_retrieve_application_information()


  WHILE TRUE
    PROMPT get_str(84) FOR CHAR inp_temp HELP 100  --"Press F3 key to close window"
      ON KEY(F2)
        EXIT WHILE
    END PROMPT
  END WHILE

  CLOSE WINDOW w_gwinfo
END FUNCTION


FUNCTION gwinfo_retrieve_application_information()
# This record is used by the fgl_window_getoption() information function
  DEFINE app_info RECORD
    name VarChar(60),       --Returns the name of the current window.
    x SmallInt,             --Returns the X position of the current window.
    y SmallINT,             --Returns the Y position of the current window.
    width SmallInt,         --Returns the width of the current window.
    height SmallInt,        --Returns the height of the current window.
    border SmallInt,        --Returns TRUE if the current window has a border; otherwise returns FALSE.
    formline SmallInt,      --Returns the form line of the current window.
    menuline  SmallInt,     --Returns the menu line of the current window.
    commentline  SmallInt,  --Returns the comment line of the current window.
    messageline  SmallInt,  --Returns the message line of the current window.
    errorline  SmallInt,    --Returns the error line of the current window.
    insertkey  SmallInt,    --Returns the value of insertkey (value as with the fgl_getkey function).
    deletekey   SmallInt,   --Returns the value of deletekey (value as with the fgl_getkey function).
    nextkey   SmallInt,     --Returns the value of nextkey (value as with the fgl_getkey function).
    previouskey  SmallInt,  --Returns the value of previouskey (value as with the fgl_getkey function).
    acceptkey   SmallInt,   --Returns the value of acceptkey (value as with thefgl_getkey function).
    helpkey   SmallInt,     --Returns the value of helpkey (value as with the fgl_getkey function).
    abortkey  SmallInt,     --Returns the value of abortkey (value as with the fgl_getkey function).
    inputwrap  SmallInt,    --Returns TRUE if the inputwrap option is on; otherwise returns FALSE.
    fieldorder  SmallInt    --Returns TRUE if the fieldorder option is constraint; otherwise returns FALSE.
  END RECORD

  CALL fgl_window_getoption ("name") returning app_info.name 
  CALL fgl_window_getoption ("x") returning app_info.x 
  CALL fgl_window_getoption ("y") returning app_info.y  
  CALL fgl_window_getoption ("width") returning app_info.width  
  CALL fgl_window_getoption ("height") returning app_info.height  
  CALL fgl_window_getoption ("border") returning app_info.border  
  CALL fgl_window_getoption ("formline") returning app_info.formline  
  CALL fgl_window_getoption ("menuline") returning app_info.menuline  
  CALL fgl_window_getoption ("commentline") returning app_info.commentline  
  CALL fgl_window_getoption ("messageline") returning app_info.messageline 
  CALL fgl_window_getoption ("errorline") returning app_info.errorline
  CALL fgl_window_getoption ("insertkey") returning app_info.insertkey
  CALL fgl_window_getoption ("deletekey") returning app_info.deletekey 
  CALL fgl_window_getoption ("nextkey") returning app_info.nextkey 
  CALL fgl_window_getoption ("previouskey") returning app_info.previouskey
  CALL fgl_window_getoption ("acceptkey") returning app_info.acceptkey 
  CALL fgl_window_getoption ("helpkey") returning app_info.helpkey  
  CALL fgl_window_getoption ("abortkey") returning app_info.abortkey 
  CALL fgl_window_getoption ("inputwrap") returning app_info.inputwrap 
  CALL fgl_window_getoption ("fieldorder") returning app_info.fieldorder


  DISPLAY "fgl_window_getoption (\"name\"):",app_info.name  AT 2, 3
  DISPLAY "fgl_window_getoption (\"x\"):",app_info.x  AT 3 ,3
  DISPLAY "fgl_window_getoption (\"y\"):",app_info.y  AT 4,3
  DISPLAY "fgl_window_getoption (\"width\"):",app_info.width  AT 5,3
  DISPLAY "fgl_window_getoption (\"height\"):",app_info.height  AT 6,3
  DISPLAY "fgl_window_getoption (\"border\"):",app_info.border  AT 7,3
  DISPLAY "fgl_window_getoption (\"formline\"):",app_info.formline  AT 8,3
  DISPLAY "fgl_window_getoption (\"menuline\"):",app_info.menuline  AT 9,3
  DISPLAY "fgl_window_getoption (\"commentline\"):",app_info.commentline  AT 10,3
  DISPLAY "fgl_window_getoption (\"messageline\"):",app_info.messageline  AT 11,3
  DISPLAY "fgl_window_getoption (\"errorline\"):",app_info.errorline  AT 12,3
  DISPLAY "fgl_window_getoption (\"insertkey\"):",app_info.insertkey  AT 13,3
  DISPLAY "fgl_window_getoption (\"deletekey\"):",app_info.deletekey  AT 14,3
  DISPLAY "fgl_window_getoption (\"nextkey\"):",app_info.nextkey  AT 15,3
  DISPLAY "fgl_window_getoption (\"previouskey\"):",app_info.previouskey  AT 16,3
  DISPLAY "fgl_window_getoption (\"acceptkey\"):",app_info.acceptkey  AT 17,3
  DISPLAY "fgl_window_getoption (\"helpkey\"):",app_info.helpkey  AT 18,3
  DISPLAY "fgl_window_getoption (\"inputwrap\"):",app_info.name  AT 19,3

END FUNCTION