#########################################################################################################
# GUI Demo Application to demonstrate the DDE interface with MS-Excel
# This application does some simple DDE operation
# 1. Run Excel (optionally transfer Excel document from BLOB or file server)
# 2. Creates a new document (by saving the empty-formated base sheet)
# 3. Transfers some sample data
# 4. Formats the cells in Excel
# 5. Saves the document
# 6. Prints the document
#
# Modification History:
# 13.05.05 HH - Created
# 12.06.06 HH - Added string handlers
#
# Current Limitations & Bugs:
#
#
#########################################################################################################


############################################################
# Globals
############################################################
GLOBALS "gd_globals.4gl"

#########################################################################################################
# FUNCTION dde_demo()  Main DDE demo function
######################################################################################################### 
FUNCTION dde_excel_demo()
  DEFINE on_error_continue, temp_rec SMALLINT
  LET on_error_continue = 0

  #initialise DDE variables
  CALL dde_init()

  CALL fgl_window_open("w_dde_demo",1,1, get_form_path("gd_f_dde_main"),0)

  LET dde_settings.f_exec_return =  dde_run_excel()
  IF  (dde_settings.f_exec_return = -2) OR  (dde_settings.f_exec_return = 1) THEN
    CALL fgl_window_close("w_dde_demo")
    RETURN
  END IF

  CALL wait_for_excel()  -- this function loops with a dde system connect until sucessful (max 10 seconds)


  IF dde_system_connect() != 1 THEN
    CALL fgl_window_close("w_dde_demo")
    RETURN
  END IF


  IF dde_save_document(1) != 1 THEN
    CALL fgl_window_close("w_dde_demo")
    RETURN
  END IF

  IF dde_document_connect() != 1 THEN
    CALL fgl_window_close("w_dde_demo")
    RETURN
  END IF

  IF dde_transfer_data() != 1 THEN
    CALL fgl_window_close("w_dde_demo")
    RETURN
  END IF

  IF dde_save_document(2) != 1 THEN
    CALL fgl_window_close("w_dde_demo")
    RETURN
  END IF

  IF dde_print_document() != 1 THEN
    CALL fgl_window_close("w_dde_demo")
    RETURN
  END IF

  call DDEFinishAll()

  CALL fgl_window_close("w_dde_demo")

END FUNCTION


#########################################################################################################
# FUNCTION dde_error_check(error_message)
######################################################################################################### 
FUNCTION dde_error_check(error_message)
  DEFINE error_message CHAR(40)

  IF dde_settings.f_dde_return = 0 THEN
    CALL fgl_winmessage("DDE Error: ","There was an error in DDE execution:\n" || error_message || "\nTerminating DDE Demo","stop")
  END IF
  
  #Update form with icon
  IF dde_settings.f_dde_return = 0 THEN
    DISPLAY get_icon16_path("gd_ic_break.ico") TO f_status
  ELSE
    DISPLAY get_icon16_path("gd_ic_accept.ico") TO f_status
  END IF

  RETURN dde_settings.f_dde_return

END FUNCTION

#########################################################################################################
# FUNCTION exec_error_check(error_message)
######################################################################################################### 
FUNCTION exec_error_check(error_message)
  DEFINE error_message CHAR(40)

  CASE dde_settings.f_dde_return
    WHEN 1
      CALL fgl_winmessage(get_strm(23), get_str(510) ||"\n" || error_message ,"stop")  --There was an error in the EXEC execution:

    WHEN -2
      CALL fgl_winmessage(get_strm(40), get_str(511) || "\n" || error_message,"info")   --You have chosen to abort:
  END CASE

  #Update form with icon
  IF dde_settings.f_exec_return = 1 THEN
    DISPLAY get_icon16_path("gd_ic_break.ico") TO f_status
  ELSE
    DISPLAY get_icon16_path("gd_ic_accept.ico") TO f_status
  END IF


  RETURN dde_settings.f_exec_return

END FUNCTION

#########################################################################################################
# FUNCTION dde_run_excel
######################################################################################################### 
FUNCTION dde_run_excel()
  DEFINE 
    temp_string VARCHAR(150),
    xls_file CHAR(1024),
    exec, temp_ret SMALLINT


  LET exec = 0
  LET dde_settings.f_exec_return = 1

  WHILE dde_settings.f_exec_return = 1

    LET temp_string = "0"

    CALL fgl_window_open("w_dde_excel_run",1,1,get_form_path("gd_f_dde_excel_run"),1) 

    DISPLAY "!" TO fb_next

    INPUT temp_string
      WITHOUT DEFAULTS
      FROM f_ex_location 

    
    CASE temp_string 

      WHEN "0" 
        LET dde_settings.f_exec_return = -1  --Excel is already running
        LET exec = 0

      WHEN "1"
        LET xls_file = copy_file_to_client(get_document_path("gd_document1.xls"))  -- returning l_file
        LET dde_settings.f_exec_return = WinShellExec(xls_file)  -- 1 = error 0= OK
        LET exec = 1

      WHEN "2"
        LET xls_file = copy_file_to_client(get_document_path("gd_document1.xls"))  -- returning l_file
        LET dde_settings.f_exec_return = WinShellExec(xls_file) -- 1 = error 0= OK
        LET exec = 1

      WHEN "3"
        LET dde_settings.f_exec_return = -2  --Exit DDE Demo
        LET exec = 0

      OTHERWISE
        CALL fgl_winmessage(get_strm(20), get_strm(21) || "dde_run_excel()\n" || get_strm(15)|| " - temp_string =" || temp_string, "stop")
        LET dde_settings.f_exec_return = -2  --Exit DDE Demo
        LET exec = 0

    END CASE


    CALL fgl_window_close("w_dde_excel_run") 


    IF exec = 1 THEN
    CASE dde_settings.f_exec_return

      WHEN 1  --server side Document - file copy
        LET dde_settings.f_entire_dde_statement = "WinExec(" || dde_settings.f_exec_program || ")"
        CALL prepare_dde()
        LET dde_settings.f_exec_return = WinExec(dde_settings.f_exec_program)
        SLEEP 10


      WHEN 2  -- BLOB Document
        LET dde_settings.f_entire_dde_statement = "WinExec(" || dde_settings.f_exec_program || ")"
        CALL prepare_dde()
        LET dde_settings.f_exec_return = WinExec(dde_settings.f_exec_program)
        SLEEP 10


    END CASE

    END IF

  END WHILE

  RETURN exec_error_check(get_str(512))  --Run MS-Excel via call filename.xls
  
END FUNCTION



#########################################################################################################
# FUNCTION dde_save_document(save_type)
######################################################################################################### 
FUNCTION dde_save_document(save_type)  --0 = save as  1=normal save
  DEFINE
    save_type SMALLINT,
    local_debug SMALLINT,
    base_path, file_name VARCHAR(250)

  LET local_debug = 0

   sleep 3
   LET dde_settings.f_file_target = trim(unique_doc_name("GuiDemo","xls"))  --this simply adds the current date-time to the file name to make it unique

   CASE save_type
     WHEN 1  --Save as...

      LET dde_settings.f_file_target = client_temp_directory, "/", dde_settings.f_file_target  --set default path and file name
      
      IF local_debug = 1 THEN
        DISPLAY "1:", dde_settings.f_file_target
      END IF
      
      LET file_name = fgl_basename(dde_settings.f_file_target)

      #Offer the user to rename the file using a file dialog box
      LET dde_settings.f_file_target = fgl_file_dialog("save", "0", get_str(513),client_temp_directory,file_name,"Excel *.xls | *.xls ||")  
      
      IF local_debug = 1 THEN
        DISPLAY "2:", dde_settings.f_file_target
      END IF

      #User can not specify invalid/empty path
      WHILE dde_settings.f_file_target IS NULL  
        CALL fgl_winmessage(get_strm(19),get_str(514),"error")
        LET dde_settings.f_file_target = fgl_file_dialog("save", "0", get_str(515),client_temp_directory,file_name,"Excel *.xls | *.xls ||") 
      END WHILE

      LET dde_settings.f_file_target = trim(dde_settings.f_file_target)
       
      IF local_debug = 1 THEN
        DISPLAY "3:", dde_settings.f_file_target
      END IF

      LET base_path = fgl_dirname(dde_settings.f_file_target)
      LET file_name = fgl_basename(dde_settings.f_file_target)

      IF local_debug = 1 THEN
        DISPLAY "4:Base_path: ", base_path , " File Name:", file_name
      END IF

      # DDE Word does not like spaces in a path - let's shorten it to 8.3 format
      LET base_path = fgl_get_property("gui", "system.file.shortname", base_path) 

      IF local_debug = 1 THEN
        DISPLAY "5:Base_path: ", base_path , " File Name:", file_name
      END IF      

      #join the shortened base path with the document file name
      LET dde_settings.f_file_target = base_path, "\\", file_name

      IF local_debug = 1 THEN
        DISPLAY "6:", dde_settings.f_file_target
        CALL fgl_winmessage(dde_settings.f_file_target ,dde_settings.f_file_target ,"info")
      END IF

      CALL form_update()

      #Save the document using SAVE AS with the new specified file name and path
      LET dde_settings.f_dde_command = "[Save.As(\"" || trim(dde_settings.f_file_target) || "\")]"

      IF local_debug = 1 THEN
        CALL fgl_winmessage(1,dde_settings.f_dde_command,"info")
      END IF

      LET dde_settings.f_entire_dde_statement = "DDEExecute(" || dde_settings.f_dde_program || "," || dde_settings.f_dde_document || "," || dde_settings.f_dde_command || ")"
      CALL prepare_dde()  --prepare/format DDE command string

      IF local_debug = 1 THEN
        DISPLAY "7: ", dde_settings.f_entire_dde_statement
        CALL fgl_winmessage(2,dde_settings.f_entire_dde_statement,"info")
      END IF

      LET dde_settings.f_dde_return = DDEExecute(dde_settings.f_dde_program,dde_settings.f_dde_document,dde_settings.f_dde_command)	--Saves active sheet as "c:\text.xls"
      CALL form_update()
  
      IF local_debug = 1 THEN
        DISPLAY "8: ", dde_settings.f_dde_return
        CALL fgl_winmessage(3,dde_settings.f_dde_return,"info")
      END IF

      #Assign this file name to f_dde_document - is required to connect to document (not document to system)
      LET dde_settings.f_dde_document = file_name  --dde_settings.f_file_target
      CALL form_update()

      IF local_debug = 1 THEN
        DISPLAY "9: ", dde_settings.f_dde_document
        CALL fgl_winmessage(4,dde_settings.f_dde_document,"info")
      END IF

      LET dde_settings.f_entire_dde_statement = "DDEConnect(" || dde_settings.f_dde_program || "," || dde_settings.f_dde_document || ")"
      CALL prepare_dde()

      IF local_debug = 1 THEN
        DISPLAY "10: ", dde_settings.f_entire_dde_statement
        CALL fgl_winmessage(5,dde_settings.f_entire_dde_statement,"info")
      END IF

      #Now, we connect to the document to work with it via DDE
      #Note: with a system DDE connection, you can only do generic work -
      #      with a document DDE connection, you can manipulate the document

      LET dde_settings.f_dde_return = DDEConnect(dde_settings.f_dde_program,dde_settings.f_dde_document)
      CALL form_update()

      IF local_debug = 1 THEN
        DISPLAY "11: ", dde_settings.f_dde_return
        CALL fgl_winmessage(6,dde_settings.f_dde_return,"info")
      END IF

    WHEN 2  -- Normal Save
      LET dde_settings.f_dde_command = "[SAVE()]"
      LET dde_settings.f_entire_dde_statement = "DDEExecute(" || dde_settings.f_dde_program || "," || dde_settings.f_dde_document || "," || dde_settings.f_dde_command || ")"
      CALL prepare_dde()
      LET dde_settings.f_dde_return = DDEExecute(dde_settings.f_dde_program,dde_settings.f_dde_document,dde_settings.f_dde_command)
      CALL form_update()

    OTHERWISE
      CALL fgl_winmessage(get_strm(16),get_strm(21) || " dde_save_document(save_type) = " || save_type, "stop")

  END CASE

  RETURN dde_error_check("Save Document")


END FUNCTION

#########################################################################################################
# FUNCTION dde_transfer_data()
######################################################################################################### 
FUNCTION dde_transfer_data()
  DEFINE 
    td ARRAY[12] OF RECORD
      row SMALLINT,
      col SMALLINT,
      data VARCHAR(100),
      font SMALLINT
    END RECORD,
    i SMALLINT

  #Set Excel to work with R1C1 format:
  CALL DDEExecute("Excel","System","[A1.R1C1(0)]") 

  LET td[1].row = 10
  LET td[1].col = 3
  LET td[1].data = get_strm(30) || " - " || get_str(516)
  LET td[1].font = 1

  LET td[2].row = 11
  LET td[2].col = 3
  LET td[2].data = get_str(201)  --"Customer ID:"
  LET td[2].font = 2

  LET td[3].row = 11
  LET td[3].col = 4
  LET td[3].data = cust_rec[1].cust_id
  LET td[3].font = 3

  LET td[4].row = 12
  LET td[4].col = 3
  LET td[4].data = get_str(202)  --"Title:"
  LET td[4].font = 2

  LET td[5].row = 12
  LET td[5].col = 4
  LET td[5].data = cust_rec[1].cust_title
  LET td[5].font = 3

  LET td[6].row = 13
  LET td[6].col = 3
  LET td[6].data = get_str(203)  --"First Name:"
  LET td[6].font = 2

  LET td[7].row = 13
  LET td[7].col = 4
  LET td[7].data = cust_rec[1].cust_fname
  LET td[7].font = 3

  LET td[8].row = 14
  LET td[8].col = 3
  LET td[8].data = get_str(204)  --"Last Name:"
  LET td[8].font = 2

  LET td[9].row = 14
  LET td[9].col = 4
  LET td[9].data = cust_rec[1].cust_lname
  LET td[9].font = 3


  LET td[10].row = 15
  LET td[10].col = 3
  LET td[10].data = get_str(205)  --"Country:"
  LET td[10].font = 2

  LET td[11].row = 15
  LET td[11].col = 4
  LET td[11].data = cust_rec[1].cust_country
  LET td[11].font = 3

  LET td[12].row = 16
  LET td[12].col = 3
  LET td[12].data = get_str(517)--"Thank You for using this Small DDE example"
  LET td[12].font = 4

  FOR i = 1 TO 12 
    CALL dde_transfer_cell(td[i].row,td[i].col,td[i].data,td[i].font)
    IF dde_settings.f_dde_return = 0 THEN
      EXIT FOR
    END IF
  END FOR

  RETURN dde_error_check("Transfer Data")
END FUNCTION

#########################################################################################################
# FUNCTION dde_transfer_cell(r,c,value)
######################################################################################################### 
FUNCTION dde_transfer_cell(r,c,value,style)
  DEFINE 
    r,c,style SMALLINT,
    value VARCHAR(100)

  LET value = "\"" || value || "\""

  LET dde_settings.f_dde_row = r
  LET dde_settings.f_dde_column = c
  LET dde_settings.f_dde_cell = dde_settings.f_rl || dde_settings.f_dde_row || dde_settings.f_cl || dde_settings.f_dde_column

  CALL prepare_dde()
  LET dde_settings.f_entire_dde_statement = "DDEPoke(" || dde_settings.f_dde_program || "," ||dde_settings.f_dde_document || "," || dde_settings.f_dde_cell || ",\"" || value || "\")"
  LET dde_settings.f_dde_return = DDEPoke(dde_settings.f_dde_program, dde_settings.f_dde_document, dde_settings.f_dde_cell, value)

  CALL form_update()

  CALL dde_format_data(style)
  CALL form_update()


END FUNCTION


#########################################################################################################
# FUNCTION dde_format_data()
######################################################################################################### 
FUNCTION dde_format_data(style)
  DEFINE style VARCHAR(200)

  CASE style
    WHEN 1
      LET dde_font_properties = "FONT.PROPERTIES(\"Arial\",\"Bold\",\"20\",\"false\",\"false\",\"false\",\"false\",\"false\",\"2\",\"5\")"
    WHEN 2
      LET dde_font_properties = "FONT.PROPERTIES(\"Arial\",\"Bold\",\"16\",\"false\",\"false\",\"false\",\"false\",\"false\",\"1\",\"5\")"
    WHEN 3
      LET dde_font_properties = "FONT.PROPERTIES(\"Arial\",\"Bold\",\"16\",\"false\",\"false\",\"false\",\"false\",\"false\",\"1\",\"1\")"
    WHEN 4
      LET dde_font_properties = "FONT.PROPERTIES(\"Arial\",\"Bold\",\"20\",\"false\",\"false\",\"false\",\"false\",\"false\",\"3\",\"3\")"
    WHEN 5
      LET dde_font_properties = "FONT.PROPERTIES(\"Arial\",\"Bold\",\"20\",\"false\",\"false\",\"false\",\"false\",\"false\",\"3\",\"7\")"
    WHEN 6
      LET dde_font_properties = "FONT.PROPERTIES(\"Arial\",\"Bold\",\"20\",\"false\",\"false\",\"false\",\"false\",\"false\",\"3\",\"7\")"
    WHEN 7
      LET dde_font_properties = "FONT.PROPERTIES(\"Arial\",\"Bold\",\"20\",\"false\",\"false\",\"false\",\"false\",\"false\",\"3\",\"7\")"
    WHEN 8
      LET dde_font_properties = "FONT.PROPERTIES(\"Arial\",\"Bold\",\"20\",\"false\",\"false\",\"false\",\"false\",\"false\",\"1\",\"3\")"
    WHEN 9
      LET dde_font_properties = "FONT.PROPERTIES(\"Arial\",\"Bold\",\"20\",\"false\",\"false\",\"false\",\"false\",\"false\",\"1\",\"4\")"
    WHEN 10
      LET dde_font_properties = "FONT.PROPERTIES(\"Arial\",\"Bold\",\"20\",\"false\",\"false\",\"false\",\"false\",\"false\",\"1\",\"5\")"
    WHEN 11
      LET dde_font_properties = "FONT.PROPERTIES(\"Arial\",\"Bold\",\"20\",\"false\",\"false\",\"false\",\"false\",\"false\",\"2\",\"6\")"
    WHEN 12
      LET dde_font_properties = "FONT.PROPERTIES(\"Arial\",\"Bold\",\"20\",\"false\",\"false\",\"false\",\"false\",\"false\",\"3\",\"7\")"
{
1. font
2. bold
3. size
4. strike through
5. super (upper) script
6. lower script

#color
1 = black
2 = white
5 = blue
6 = Yellow
Please contact me if you have found any more references to Microsoft's OFFICE DDE Properties  I cant' find a book about this... - Hubert
.. but you can of course also use macros
}
    OTHERWISE
      CALL fgl_winmessage(get_strm(50),get_strm(21) || "dde_format_data(style) style=" || style, "stop")

  END CASE

      CALL prepare_dde()
      LET dde_settings.f_dde_command = "[SELECT(\"" || dde_settings.f_dde_cell || "\")][" || dde_font_properties || "]"

      LET dde_settings.f_entire_dde_statement = "DDEExecute(" || dde_settings.f_dde_program || "," || dde_settings.f_dde_document || "," || dde_settings.f_dde_command || ")"
      CALL prepare_dde()
      LET dde_settings.f_dde_return = DDEExecute(dde_settings.f_dde_program,dde_settings.f_dde_document,dde_settings.f_dde_command)

      CALL form_update()

END FUNCTION




#########################################################################################################
# FUNCTION dde_print_document()
######################################################################################################### 
FUNCTION dde_print_document()
DEFINE ret VARCHAR(20)

  LET ret = fgl_winbutton(get_str(20), get_str(520), "Yes", "Yes|No", "question", 1)  --Do you want to print the MS-Excel Document?
  
  IF ret = "Yes" THEN
      LET dde_settings.f_dde_command = "[PRINT]"
      LET dde_settings.f_entire_dde_statement = "DDEExecute(" || dde_settings.f_dde_program || "," || dde_settings.f_dde_document || "," || dde_settings.f_dde_command || ")"
      CALL prepare_dde()
      LET dde_settings.f_dde_return =  DDEExecute(dde_settings.f_dde_program,dde_settings.f_dde_document,dde_settings.f_dde_command)	--	Prints the current area
      CALL form_update()
  END IF

  RETURN dde_error_check("Print Document")

END FUNCTION


{
######################################################################################################
# FUNCTION win_prompt_1()
######################################################################################################
FUNCTION win_prompt_1(str_title, str_label1, str_field1)
  DEFINE str_title, str_label1, str_field1 VARCHAR(200)

  OPEN WINDOW w_win_prompt_1 
    AT 5,1 
    WITH FORM "form/gd_f_dde_dialog1"  
    ATTRIBUTE(BORDER)

  DISPLAY "!" TO fb_done

  LET prompt_rec1.fl_title = str_title
  LET prompt_rec1.fl_1 = str_label1
  LET prompt_rec1.f1 = str_field1


  INPUT BY NAME prompt_rec1.* WITHOUT DEFAULTS

  CLOSE WINDOW w_win_prompt_1
END FUNCTION
}
######################################################################################################
# FUNCTION prepare_dde()
######################################################################################################
FUNCTION prepare_dde()


  LET dde_settings.f_dde_cell = dde_settings.f_rl || dde_settings.f_dde_row || dde_settings.f_cl || dde_settings.f_dde_column
  LET dde_settings.f_dde_end_cell = dde_settings.f_rl || dde_settings.f_dde_end_row || dde_settings.f_cl || dde_settings.f_dde_end_column

  DISPLAY BY NAME dde_settings.f_dde_cell
  DISPLAY BY NAME dde_settings.f_dde_end_cell

  DISPLAY BY NAME dde_settings.f_entire_dde_statement
  DISPLAY BY NAME dde_settings.f_dde_command

END FUNCTION

######################################################################################################
# FUNCTION INIT()
######################################################################################################
FUNCTION dde_init()
  DEFINE c, r SMALLINT

    
    LET dde_cell.f_dde_row = 1
    LET dde_cell.f_dde_column  = 1

    LET dde_cell_range.f_dde_end_row  = 2
    LET dde_cell_range.f_dde_end_column  = 2
    LET dde_cell_range.f_dde_start_row  = 1
    LET dde_cell_range.f_dde_start_column  = 1

#    LET dde_cell.f_dde_end_row = 1
 #   LET dde_cell.f_dde_end_column = 1
    #LET dde_cell.f_dde_end_cell = 1

    LET dde_settings.f_exec_program = "" --fgl_get_property("system.registry","HKEY_CLASSES_ROOT\\Excel.Sheet.8\\shell\\New\\command\\")
    LET dde_settings.f_exec_return = -1
    LET dde_settings.f_dde_program = "Excel"

     
    LET dde_settings.f_dde_document = "" --unique_doc_name("querix")
    LET dde_settings.f_dde_sheet = "Sheet3"
    LET dde_settings.f_dde_command = "enter your command here"
    LET dde_settings.f_file_source = "" --unique_doc_name("querix")
    LET dde_settings.f_file_target = "" --unique_doc_name("querix")
    LET dde_settings.f_rl = "R"   --row letter i.e. in german excel, it would be 'Z', in english 'R'
    LET dde_settings.f_cl = "C"   --row letter i.e. in german excel, it would be 'S', in english 'C'
    LET dde_settings.f_dde_row = 1
    LET dde_settings.f_dde_column = 1
    LET dde_settings.f_dde_end_row = 2
    LET dde_settings.f_dde_end_column = 2
    LET dde_settings.f_dde_cell = "R1C1"
    LET dde_settings.f_dde_end_cell = "R2C2"
    LET dde_settings.f_dde_cell_range = "R1C1:R2C2"
    LET dde_settings.f_dde_return = 0
    LET dde_settings.f_dde_error = "No Error retrieved yet"

    LET dde_settings.f_entire_dde_statement = ""

{
  # graphical update for dde status success feedback
  IF dde_settings.f_dde_return = 0 THEN
    DISPLAY "icon16/gd_ic_break.ico" TO f_status
  ELSE
    DISPLAY "icon16/gd_ic_accept.ico" TO f_status
  END IF

  IF dde_settings.f_exec_return = 1 THEN
    DISPLAY "icon16/gd_ic_break.ico" TO f_es
  ELSE
    DISPLAY "icon16/gd_ic_accept.ico" TO f_es
  END IF

}
  LET dde_settings.f_dde_cell_range = dde_settings.f_dde_cell || ":" || dde_settings.f_dde_end_cell

END FUNCTION


######################################################################################################
# FUNCTION wait_for_excel()
######################################################################################################
FUNCTION wait_for_excel()
  DEFINE count, status SMALLINT

  LET count = 1
  LET status = 0 

  WHILE dde_settings.f_dde_return = 0


    LET dde_settings.f_dde_document = "System"
    LET dde_settings.f_entire_dde_statement = "DDEConnect(" || dde_settings.f_dde_program || ",\"System\")"
    CALL prepare_dde()
    LET dde_settings.f_dde_return = DDEConnect(dde_settings.f_dde_program,dde_settings.f_dde_document)

    CALL form_update()
    call DDEFinishAll()

    LET count = count + 1
    IF count > 20 THEN
      EXIT WHILE
    END IF

    SLEEP 1
  END WHILE



END FUNCTION

######################################################################################################
# FUNCTION dde_system_connect()
######################################################################################################
FUNCTION dde_system_connect()
  DEFINE looper SMALLINT

  LET dde_settings.f_dde_document = "System"
  LET dde_settings.f_entire_dde_statement = "DDEConnect(" || dde_settings.f_dde_program || ",\"System\")"
  CALL prepare_dde()

  LET looper = 1
  LET dde_settings.f_dde_return = 0
  WHILE looper < 20
    LET dde_settings.f_dde_return = DDEConnect(dde_settings.f_dde_program,dde_settings.f_dde_document)

    IF dde_settings.f_dde_return = 1 THEN
      EXIT WHILE
    END IF
  
  END WHILE

  CALL form_update()

  RETURN dde_error_check("System Connect")

END FUNCTION

######################################################################################################
# FUNCTION dde_document_connect()
######################################################################################################
FUNCTION dde_document_connect()
  DEFINE looper SMALLINT


  LET dde_settings.f_entire_dde_statement = "DDEConnect(" || dde_settings.f_dde_program || "," || dde_settings.f_dde_document || ")"
  CALL prepare_dde()

  LET dde_settings.f_dde_return = 0
  LET looper = 1
  WHILE looper < 20

    LET dde_settings.f_dde_return = DDEConnect(dde_settings.f_dde_program,dde_settings.f_dde_document)
    IF dde_settings.f_dde_return = 1 THEN
      EXIT WHILE
    END IF
  
  END WHILE
  CALL form_update()

  RETURN dde_error_check("Document Connect")

END FUNCTION

######################################################################################################
# FUNCTION form_update()
######################################################################################################
FUNCTION form_update()

  LET dde_settings.f_dde_error = DDEGetError()

  LET dde_settings.f_dde_cell_range = dde_settings.f_dde_cell || ":" || dde_settings.f_dde_end_cell

  DISPLAY BY NAME dde_settings.f_dde_cell
  DISPLAY BY NAME dde_settings.f_dde_row
  DISPLAY BY NAME dde_settings.f_dde_column

  DISPLAY BY NAME dde_settings.f_dde_end_cell
  DISPLAY BY NAME dde_settings.f_dde_end_row
  DISPLAY BY NAME dde_settings.f_dde_end_column

  DISPLAY BY NAME dde_settings.f_dde_return
  DISPLAY BY NAME dde_settings.f_dde_error
  DISPLAY BY NAME dde_settings.f_entire_dde_statement
  DISPLAY BY NAME dde_settings.f_dde_command
  DISPLAY BY NAME dde_settings.f_dde_document

  # graphical update for dde status success feedback
  IF dde_settings.f_dde_return = 0 THEN
    DISPLAY get_icon16_path("gd_ic_break.ico") TO f_status
  ELSE
    DISPLAY get_icon16_path("gd_ic_accept.ico") TO f_status
  END IF

END FUNCTION


######################################################################################################
# FUNCTION copy_file_to_client(p_document)
######################################################################################################
FUNCTION copy_file_to_client(p_document)  -- returning l_file
  DEFINE 
    p_document 	VARCHAR(64),
    l_file 	CHAR(1024),
    temp_path VARCHAR(200)

    LET temp_path = client_temp_directory  --should not use/need the temp_path - use global....

  CALL fgl_file_to_client(p_document,  temp_path || "/blob-" || p_document)
    RETURNING l_file

  RETURN l_file

END FUNCTION

