#########################################################################################################
# GUI Demo Application to demonstrate GUI Clients
#
# Modification History:
# 10.04.04 DS/HH - Created in Southampton
# 12.02.05 HH - V2 - Added custom script toolbar, and used all widgets - second color demo window
# 25.04.05 HH - V2 - Use window background property for background image (not user control)
# 26.04.05 HH - V2 - add memo box and few more script options, sub-demos are now displayed in their own windowed windows
# 15.09.06 HH - V3 - add new grid control and uses the export features + column header manipulation
# 16.09.06 HH - V3 - Dynamic Toolbar and context menu - New
# 17.09.06 HH - V3 - HTML-Blob view with auto generated HTML
# 18.09.06 HH - V3 - 3rd color-attributes demo window - one detailed test for each color
# 08.10.06 HH - V3 - Importing toolbar definition from a file
# 09.10.06 HH - V3 - Adding html help
# 10.10.06 HH - V3 - Re-designing forms to make their context fully dynamic (controlled in the 4gl code) and adding some widgets
# 19.10.06 HH - V3 - Created seperate 4gl modules for settings, initialisation, toolbar and html help file management
# 01.12.06 HH - V3 - Added Printing and E-Mail Support
#########################################################################################################

############################################################
#! Globals
############################################################
GLOBALS "gd_globals.4gl"


#########################################################################################################
#! MAIN
######################################################################################################### 
MAIN

  DEFER INTERRUPT

  OPTIONS
#    PROMPT LINE LAST,
    INPUT WRAP,
    HELP FILE "msg/gd_help.erm",
    HELP KEY F1,
    INSERT KEY F131,
    DELETE KEY F132,
    NEXT KEY F133,
    PREVIOUS KEY F134,
    ACCEPT KEY RETURN,
    ON CLOSE APPLICATION KEY F11
#    ,FORM LINE 2
#    , AUTOREFRESH 3
	CALL ui.Interface.setType("container")
	CALL ui.Interface.loadStartMenu("form/gd_f_menu.fm2")
	OPEN FORM f_guidemo FROM "form/gd_f_guidemo_2_2"
	DISPLAY FORM f_guidemo


  #This is a gui client demo only
#  IF NOT fgl_fglgui() THEN
#    CALL fgl_winmessage("","This is a GUI Client Demo!\nRun the application with Phoenix or Chimera.","eror")
#  END IF
  #I don't know how the date ist defined in the target system and I'm not allowed to change it....
  # so, I simply define it for the GUI-Demo only in the environment
  CALL fgl_putenv("DBDATE=dmy4.")

  #initialize variables and publish global default toolbar icons
  CALL init_data()
  CALL publish_toolbar("global",0)

  # set help file '1' define in congiruation & language   HELP FILE "msg/cm_context_help.erm",
  CALL set_classic_help_file(1)

  #Draw a box and write the application name and version number in it AND in the title bar
  #	CALL fgl_drawbox(5,53,9,14)
  #DISPLAY get_strm(17) 
  #  AT 11,15 
  #  ATTRIBUTE(BLUE, BOLD) 
  CALL fgl_settitle(get_strm(17)) 

  #display the main menu 
  CALL gd_main_menu()

END MAIN


#########################################################################################################
# FUNCTION gd_main_menu()
######################################################################################################### 
#! This main menu calls the different demonstration programs. It is done using the classic 4GL
#! ringmenu and a graphical toolbar to see the difference.
######################################################################################################### 
FUNCTION gd_main_menu()
  DEFINE
    inp_char CHAR,
    html_str CHAR(1000),
    menu_str_arr1 ARRAY[15] OF VARCHAR(20), --i.e. used for rinmenu strings
    menu_str_arr2 ARRAY[15] OF VARCHAR(100) --i.e. used for rinmenu strings


 --   BEFORE MENU
        #need to assign strings to temp_strings - MENU does not support functions for strings
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

      CALL set_help_id(1)

      #DDE does not work in text or Java clients because of platform independent aspects
      #fgl_getuitype() returns the client type - the windows client phoenix returns wtk
      #this is a D4GL function call
    --  HIDE OPTION "DDE"

    --  IF fgl_getuitype() = "WTK" THEN
     --   SHOW OPTION "DDE"
    --  END IF

      #Now we publish toolbar information for this ringmenu using our toolbar management functions
      #CALL publish_toolbar("guidemo",0)

      #CALL fgl_dialog_keydivider(100)
      #CALL fgl_dialog_keydivider(1028)

	OPEN FORM myForm FROM "form/gd_f_screen_2_2"
	DISPLAY FORM myForm


  MENU "GUI-Demo"
		#File menu   
	BEFORE MENU
    	CALL ui.Window.Forname("screen").SetVisible(TRUE)						
   	ON ACTION ("actExit","actExitTm")
      EXIT MENU 
      
    #COMMAND KEY (INTERRUPT)
    #	EXIT MENU
      
    #COMMAND KEY (F11)
    #	EXIT MENU    	    	
    	  
    #contact forms 
  	ON ACTION ("actGuiDemo","actGuiDemoTm")  --selection menu for what contact to display / countries
      CALL contact_demo(NULL)

      
  	ON ACTION "actGuiDemoEnglish"  --selection menu for what contact to display / countries
      CALL contact_demo(1)
      
  	ON ACTION "actGuiDemoSpanish"  --selection menu for what contact to display / countries
      CALL contact_demo(2)      
      
  	ON ACTION "actGuiDemoGerman"  --selection menu for what contact to display / countries
      CALL contact_demo(3)          
      
  	ON ACTION "actGuiDemoFrench"  --selection menu for what contact to display / countries
      CALL contact_demo(4)           
      
  	ON ACTION "actGuiDemoArabic"  --selection menu for what contact to display / countries
      CALL contact_demo(5)    
      
  	ON ACTION "actGuiDemoItalian"  --selection menu for what contact to display / countries
      CALL contact_demo(6)    
            
  	ON ACTION "actGuiDemoOther"  --selection menu for what contact to display / countries
      CALL contact_demo(7)      
           
		#Miscellaneous      
  	ON ACTION ("actControlDemo","actControlDemoTm")
      CALL control_demo()    

  	ON ACTION ("actDialogBoxes","actDialogBoxesTm")
      CALL msgbox_form()


  	ON ACTION ("actBlobDemo","actBlobDemoTm") 
      CALL document_form()
      

#  	ON ACTION ("actDDEDemo","actDDEDemoTm")  --toolbar menu
#      CALL dde_demo(0)

#  	ON ACTION ("actDDEDemoExcelTm")  --Excel demo
#      CALL dde_demo(1)


#  	ON ACTION ("actDDEDemoWordTm")  --MS-WORD demo
#      CALL dde_demo(2)

 		
  	ON ACTION ("actThemeDemo","actThemeDemoTm")  
   # COMMAND KEY ("F35") menu_str_arr1[5] menu_str_arr2[5] HELP 5  --"Theme" "Displays a range of windows with different Themes"
   #   CLEAR SCREEN
      CALL theme_demo()

      
  	ON ACTION ("actAttributesDemo","actAttributesDemoTm")  
      CALL color_demo(0)

      
  	ON ACTION ("actAttributesDemoChartTm")
      CALL color_demo(1)
      
      
  	ON ACTION ("actAttributesDemoDisplayTm")
      CALL color_demo(2)
      
      
  	ON ACTION ("actAttributesDemoDetailedTm")
      CALL color_demo(3)                  

      
  	#ON ACTION ("actDisplayATTm")
    #  CALL color_demo(4)
      
  	ON ACTION ("actOnlineDemo","actOnlineDemoTm") 
      CALL web_demo("")
 
 
 		#Settings Menu 
  	ON ACTION ("actSettingsMenu","actSettingsMenuTm")
      CALL settings_menu(30)  --30 is the horizontal location

  	ON ACTION ("actSettingsGeneralTm")
      CALL settings_general(TRUE)

  	ON ACTION ("actSettingsToolbarTm")
      CALL manage_toolbar_list(TRUE)
      
  	ON ACTION ("actSettingsLanguageTm")
      CALL lang_menu()
      
    
                  
 		#Help     
  	ON ACTION ("actHelpClassic","actHelpClassicTm")
      CALL showhelp(1) 
      
   	ON ACTION ("actHelpHtml","actHelpHtmlTm")
      # qx://clienttemp//help_html/uk/gui_demo.html
      # currenly active function located in 
      # tools_html_help_manager.4gl
      CALL html_help(get_help_url(1))      
  
      
          	
    #COMMAND KEY ("F31") menu_str_arr1[1] menu_str_arr2[1] HELP 1  --"GUI" "Example GUI Form using Extended 4GL and Script Files"
    #  CALL contact_demo()

    #COMMAND KEY ("F32") menu_str_arr1[2] menu_str_arr2[2] HELP 2 --"Control" "Demonstrates a Web Browser and Calendar Picker Control"
    #  CLEAR SCREEN
    #  CALL control_demo()

    #COMMAND KEY ("F33") menu_str_arr1[3] menu_str_arr2[3] HELP 3  --"Dialog" "Test different message box styles"
    #  CLEAR SCREEN
    #  CALL msgbox_form()

    #COMMAND KEY ("F34") menu_str_arr1[4] menu_str_arr2[4] HELP 4   --"Blob" "Display different document types from BLOB's"
    #  CLEAR SCREEN
    #  CALL document_form()

#    COMMAND KEY ("F35") menu_str_arr1[5] menu_str_arr2[5] HELP 5  --"Theme" "Displays a range of windows with different Themes"
#      CLEAR SCREEN
#      CALL theme_demo()

    #COMMAND KEY ("F36") menu_str_arr1[6]  menu_str_arr2[6]  HELP 6  --"DDE" "Transfer data to MS-Excel and MS-Word via DDE"
    #  CLEAR SCREEN
    #  CALL dde_demo()

    #COMMAND KEY ("F37") menu_str_arr1[7]  menu_str_arr2[7]  HELP 7   --"Attrib." "Displays a few sample attributes such as colors of the RGB Model" 
    #  CLEAR SCREEN
    #  CALL color_demo()

    #COMMAND KEY ("F38") menu_str_arr1[8] menu_str_arr2[8]  HELP 8   --"Online" "Showing a sample MacroMedia Captivate created Web Demo"
    #  CLEAR SCREEN
    #  CALL web_demo("http://www.querix.com/c/document_library/get_file?uuid=17549061-8735-4749-853a-ed3d2bb1de26&groupId=10128")

    #COMMAND KEY ("F39") menu_str_arr1[9] menu_str_arr2[9] Help 9
    #  CALL web_service_demo()

    #COMMAND KEY ("F9") menu_str_arr1[10] menu_str_arr2[10]   HELP 10    --Settings Menu
    #  CALL settings_menu(30)
      #CALL manage_toolbar_list()

    #COMMAND KEY ("F11") " " " "
    #  EXIT MENU

    #COMMAND KEY ("F12") menu_str_arr1[11]  menu_str_arr2[11]   HELP 11    --"    Exit" "Exit the application"
    #  EXIT MENU

    #COMMAND KEY (HELP) menu_str_arr1[12]  menu_str_arr2[12]   HELP 12   --"   Help" "Show Help in HTML format..."
    #  CALL showhelp(1)

    #COMMAND KEY ("F1024") menu_str_arr1[13]  menu_str_arr2[13]   HELP 13    --"Html-Help" "Show Help in HTML format..."
    #  CALL html_help(get_help_url(1))



  END MENU


END FUNCTION

