##################################################################################
# MODULE SCOPE VARIABLES
##################################################################################
	DEFINE modu_line_id_start INTEGER
	DEFINE modu_rec_invoice 
		RECORD
			invoice_id INT ,
			ship_to_hdr STRING,
			del_address_dif BOOLEAN,
			invoice_date DATE,
			invoice_po STRING,
			currency_id CHAR(3),
			inv_net_total MONEY(10,2),
			inv_tax MONEY(10,2),
                        inv_total MONEY(10,2),
			for_total DECIMAL(10,2)
		END RECORD

	DEFINE modu_rec_group RECORD
			inv_net_total MONEY(10,2),
			inv_tax MONEY(10,2),
      inv_total MONEY(10,2)	
	END RECORD

##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	DEFINE rep_string STRING
	DEFINE l_report_file TEXT
	DEFINE l_server_file STRING
	DEFINE l_msg STRING
	
	CALL ui_init()
	
	LET modu_line_id_start = 100
	LET rep_string = "Some string for the report"

	#init
	LET modu_rec_group.inv_net_total = 0
	LET modu_rec_group.inv_tax = 0
	LET modu_rec_group.inv_total = 0	

	OPEN window wReport WITH FORM "form/rep_report_output"
	
	MENU "report_menu"
		BEFORE MENU
			CALL fgl_dialog_setkeylabel("TO SCREEN",			  "TO SCREEN",				"{CONTEXT}/public/querix/icon/svg/24/ic_screen_24px.svg",					11,TRUE,	"START REPORT invoice_report",										"top","iconLabel")			
			CALL fgl_dialog_setkeylabel("TO FILE",				  "TO FILE",					"{CONTEXT}/public/querix/icon/svg/24/ic_file_document_24px.svg",	13,TRUE,	"START REPORT TO FILE",														"top","iconLabel")
			CALL fgl_dialog_setkeylabel("WriteToPipe",		  ".writeToPipe()",		"{CONTEXT}/public/querix/icon/svg/24/ic_file_document_24px.svg",	13,TRUE,	"START REPORT TO FILE ui.Interface.writeToPipe()","top","iconLabel")
			CALL fgl_dialog_setkeylabel("File Editor",		  "File Editor",			"{CONTEXT}/public/querix/icon/svg/24/ic_process_24px.svg",				15,TRUE,	"Download the file and process it with it's default File Editor",				"top","iconLabel")	
			CALL fgl_dialog_setkeylabel("DOWNLOAD",				  "Download",					"{CONTEXT}/public/querix/icon/svg/24/ic_download_file_24px.svg",	17,TRUE,	"Download",						"top","iconLabel")	
			CALL fgl_dialog_setkeylabel("PRINT",					  "Print",						"{CONTEXT}/public/querix/icon/svg/24/ic_print_24px.svg",					19,TRUE,	"Print Report localy","top","iconLabel")	
			CALL fgl_dialog_setkeylabel("TAB",						  "Display in Tab",		"{CONTEXT}/public/querix/icon/svg/24/ic_tab_selected_24px.svg",		21,TRUE,	"Display in Tab",			"top","iconLabel")
			CALL fgl_dialog_setkeylabel("Report Viewer",	  "Report Viewer",		"{CONTEXT}/public/querix/icon/svg/24/ic_console_window_24px.svg",	23,TRUE,	"Report Viewer",			"top","iconLabel")	
			CALL fgl_dialog_setkeylabel("Default",				  "Default",					"{CONTEXT}/public/querix/icon/svg/24/ic_default_24px.svg",				25,TRUE,	"Default",						"top","iconLabel")		
			CALL fgl_dialog_setkeylabel("Inject",					  "Inject",						"{CONTEXT}/public/querix/icon/svg/24/ic_inject_24px.svg",					27,TRUE,	"Inject",							"top","iconLabel")	
			CALL fgl_dialog_setkeylabel("PIPE>FILE",			  "pipe->report.out",	"{CONTEXT}/public/querix/icon/svg/24/ic_report_24px.svg",					29,TRUE,	"Pipe the report to the file report.out",					"top","iconLabel")	
			CALL fgl_dialog_setkeylabel("XML PRINT", 			  "XML PRINT",				"{CONTEXT}/public/querix/icon/svg/24/ic_xml_1_24px.svg",					31,TRUE,	"PRINT in START REPORT invoice_report TO XML HANDLER om.XmlWriter.createFileWriter(\"xml/output.xml\")",	"top","iconLabel")
			CALL fgl_dialog_setkeylabel("XML PrintX",			  "XML PrintX",				"{CONTEXT}/public/querix/icon/svg/24/ic_xml_2_24px.svg",					33,TRUE,	"PrintX in START REPORT invoice_report TO XML HANDLER om.XmlWriter.createFileWriter(\"xml/output.xml\")",	"top","iconLabel")
			CALL fgl_dialog_setkeylabel("TO FILE .xls",		  "TO FILE .xls",			"{CONTEXT}/public/querix/icon/svg/24/ic_excel_01_24px.svg",	      34,TRUE,	"fgl_report_type(\"excel\",\"shell_open\") START REPORT TO FILE \"report/report_to_file.xls\"","top","iconLabel")
			CALL fgl_dialog_setkeylabel("TO PIPE .txt",			"TO PIPE .txt",			"{CONTEXT}/public/querix/icon/svg/24/ic_excel_02_24px.svg",	      35,TRUE,	"fgl_report_type(\"excel\",\"shell_open\") START REPORT TO PIPE \"report/report_to_file.xls\"","top","iconLabel")

		#TO SCREEN
		ON ACTION "TO SCREEN" #If you dont's specify a destination, it will invoke the report viewer by default
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*
			#CALL fgl_report_type("NOT USED","NOT USED")  # or q4gl_add_user_report_type()
			START REPORT invoice_report #NO DESTINATION
			CALL report_output(FALSE)
#			FOR i = modu_line_id_start TO 130
#				   OUTPUT TO REPORT invoice_report(i)
#			END FOR
			FINISH REPORT invoice_report
#			LOCATE l_report_file in file "report/report_to_file.txt"
#			DISPLAY l_report_file TO report_output
				   
			CALL clearInsructions()  --clear instructions from form	   
	
			DISPLAY "NONE" TO fLastOption			   
			DISPLAY "
			OUPUT TO FILE (and fgl_report_type() is not used.\n
			In our example, we specified the output file extension \"report/report_to_file.txt\"
			" TO fDescription	   
			DISPLAY "			
			START REPORT invoice_report TO FILE \"report/report_to_file.txt\"\n
			OUTPUT TO REPORT invoice_report(inv_line)\n
			FINISH REPORT invoice_report\n
			" TO f4gl
				
			DISPLAY "" TO fTheme			



		#TO FILE
		ON ACTION "TO FILE" --"shell_open"
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*
			#CALL fgl_report_type("NOT USED","NOT USED")  # or q4gl_add_user_report_type()
			START REPORT invoice_report TO FILE "report/report_to_file.txt"
			CALL report_output(FALSE)
#			FOR i = modu_line_id_start TO 130
#				   OUTPUT TO REPORT invoice_report(i)
#			END FOR
			FINISH REPORT invoice_report
			LOCATE l_report_file in file "report/report_to_file.txt"
			DISPLAY l_report_file TO report_output
				   
			CALL clearInsructions()  --clear instructions from form	   
	
			DISPLAY "NONE" TO fLastOption			   
			DISPLAY "
			OUPUT TO FILE (and fgl_report_type() is not used.\n
			In our example, we specified the output file extension \"report/report_to_file.txt\"
			" TO fDescription	   
			DISPLAY "			
			START REPORT invoice_report TO FILE \"report/report_to_file.txt\"\n
			OUTPUT TO REPORT invoice_report(inv_line)\n
			FINISH REPORT invoice_report\n
			" TO f4gl
				
			DISPLAY "" TO fTheme				


		#TO FILE with  ui.Interface.writeToPipe()
		ON ACTION "WriteToPipe" --"shell_open"
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*

			START REPORT invoice_report TO FILE "report/report_to_file.txt"
			CALL report_output(FALSE)
			FINISH REPORT invoice_report

			LOCATE l_report_file in file "report/report_to_file.txt"
			DISPLAY l_report_file TO report_output

#@Victor @Vlad - wouldn'it be nice, if the developer could simply hook in some build in pipe-download functionality (no code / minimum code) from the report handler
#I know, we could use fgl_download() etc.. 
			CALL fgl_report_type("my_pipe","download")  # or q4gl_add_user_report_type("note","text")
			CALL ui.Interface.writeToPipe("my_pipe",l_report_file)
				   
			CALL clearInsructions()  --clear instructions from form	   
	
			DISPLAY "NONE" TO fLastOption			   
			DISPLAY "
			OUPUT TO FILE (and fgl_report_type() is not used.\n
			In our example, we specified the output file extension \"report/report_to_file.txt\"
			" TO fDescription	   
			DISPLAY "			
			START REPORT invoice_report TO FILE \"report/report_to_file.txt\"\n
			OUTPUT TO REPORT invoice_report(inv_line)\n
			FINISH REPORT invoice_report\n	
			LOCATE l_report_file in file \"report/report_to_file.txt\"\n
			CALL ui.Interface.writeToPipe(\"my_pipe\",l_report_file)
			" TO f4gl
				
			DISPLAY "" TO fTheme				
				
		#TO PIPE -> SHELL OPEN -------------------------------------------------------------------------------------------------
		ON ACTION "File Editor" --"shell_open"
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*
			CALL fgl_report_type("my_pipe","shell_open")  # or q4gl_add_user_report_type()
			START REPORT invoice_report TO PIPE "my_pipe"
			CALL report_output(FALSE)
			FINISH REPORT invoice_report
				   
			CALL clearInsructions()  --clear instructions from form	   
	
			DISPLAY "shell_open" TO fLastOption			   
			DISPLAY "
			\"shell_open\" uses the default associated editor/viewer from the OS\n
			In our example, we spedified the file extension .txt
			" TO fDescription	   
			DISPLAY "
			CALL fgl_report_type(\"my_pipe\",\"shell_open\")\n
			START REPORT invoice_report TO PIPE \"my_pipe\"\n
			OUTPUT TO REPORT invoice_report(inv_line)\n
			FINISH REPORT invoice_report\n
			" TO f4gl
				
			DISPLAY "
  <ElementFilter ElementName=\"ReportViewerConfig\">\n
    <StyleSheet>\n
      <ElementIdFilter Identifier=\"shell_open\">\n
        <StyleSheet>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>ViewerType</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>ShellOpen</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>Parameter</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>.txt</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
        </StyleSheet>\n
      </ElementIdFilter>\n
  </ElementFilter>\n

" TO fTheme				
	
		#DOWNLOAD -------------------------------------------------------------------------------------------------
		ON ACTION "download"
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*
			CALL fgl_report_type("my_pipe","download")  # or q4gl_add_user_report_type("note","text")
			START REPORT invoice_report TO PIPE "my_pipe"
			CALL report_output(FALSE)
			FINISH REPORT invoice_report
	
			CALL clearInsructions()  --clear instructions from form
	
			DISPLAY "shell_open" TO fLastOption			   
			DISPLAY "
			\"download\" uses the default file download method of your browser\n
			Only the file extension can be controlled (with the parameter properties i.e. .txt)\n
			The location can only be controlled in your browser setup a)download folder b)with fileDialog\n
			
			" TO fDescription	   
			DISPLAY "
			CALL fgl_report_type(\"my_pipe\",\"download\")\n
			START REPORT invoice_report TO PIPE \"my_pipe\"\n
			OUTPUT TO REPORT invoice_report(101)\n
			FINISH REPORT invoice_report\n
			" TO f4gl
				
			DISPLAY "
  <ElementFilter ElementName=\"ReportViewerConfig\">\n
    <StyleSheet>\n
      <ElementIdFilter Identifier=\"download\">\n
        <StyleSheet>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>ViewerType</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>download</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>Parameter</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>.txt</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
        </StyleSheet>\n
      </ElementIdFilter>\n
  </ElementFilter>\n

" TO fTheme				
	
	
		#PRINT -------------------------------------------------------------------------------------------------
		ON ACTION "PRINT"
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*
	
			CALL fgl_report_type("my_pipe","print")  # or q4gl_add_user_report_type("note","text")
			START REPORT invoice_report TO PIPE "my_pipe"
			CALL report_output(FALSE)
			FINISH REPORT invoice_report
	
			CALL clearInsructions()  --clear instructions from form
	
			DISPLAY "print" TO fLastOption			   
			DISPLAY "
			\"print\" uses the default print method of your browser\n

			
			" TO fDescription	   
			DISPLAY "
			CALL fgl_report_type(\"my_pipe\",\"print\")\n
			START REPORT invoice_report TO PIPE \"my_pipe\"\n
			OUTPUT TO REPORT invoice_report(101)\n
			FINISH REPORT invoice_report\n
			" TO f4gl
				
			DISPLAY "
  <ElementFilter ElementName=\"ReportViewerConfig\">\n
    <StyleSheet>\n
      <ElementIdFilter Identifier=\"print\">\n
        <StyleSheet>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>ViewerType</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>print</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>Parameter</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>.txt</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
        </StyleSheet>\n
      </ElementIdFilter>\n
  </ElementFilter>\n

" TO fTheme				
	
	
		#NEW WINDOW  -------------------------------------------------------------------------------------------------
		ON ACTION "Tab"  --"new_window"
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*

			CALL fgl_report_type("my_pipe","new_window")  # or q4gl_add_user_report_type("note","text")
			START REPORT invoice_report TO PIPE "my_pipe"
			CALL report_output(FALSE)
			FINISH REPORT invoice_report
	
			CALL clearInsructions()  --clear instructions from form
	
			DISPLAY "NewWindow" TO fLastOption			   
			DISPLAY "
			\"NewWindow\"\n
			In Browser: opens a new Tab in your browser\n
			In LD: opens a new window in your LyciaDesktop\n
			
			" TO fDescription	   
			DISPLAY "
			CALL fgl_report_type(\"my_pipe\",\"NewWindow\")\n
			START REPORT invoice_report TO PIPE \"my_pipe\"\n
			OUTPUT TO REPORT invoice_report(101)\n
			FINISH REPORT invoice_report\n
			" TO f4gl
				
			DISPLAY "
  <ElementFilter ElementName=\"ReportViewerConfig\">\n
    <StyleSheet>\n
      <ElementIdFilter Identifier=\"NewWindow\">\n
        <StyleSheet>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>ViewerType</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>NewWindow</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>Parameter</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>.txt</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
        </StyleSheet>\n
      </ElementIdFilter>\n
  </ElementFilter>\n

" TO fTheme				
			   
		#TEXT_VIEWER -------------------------------------------------------------------------------------------------
		ON ACTION "Report Viewer"  --"text_viewer"
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*

			CALL fgl_report_type("my_pipe","text_viewer")  # or q4gl_add_user_report_type("note","text")
			START REPORT invoice_report TO PIPE "my_pipe"
			CALL report_output(FALSE)
			FINISH REPORT invoice_report
	
			CALL clearInsructions()  --clear instructions from form
	
			DISPLAY "TextViewer" TO fLastOption			   
			DISPLAY "
			\"TextViewer\" Opens the qxReport Viewer and displays the report to it\n
			
			" TO fDescription	   
			DISPLAY "
			CALL fgl_report_type(\"my_pipe\",\"TextViewer\")\n
			START REPORT invoice_report TO PIPE \"my_pipe\"\n
			OUTPUT TO REPORT invoice_report(101)\n
			FINISH REPORT invoice_report\n
			" TO f4gl
				
			DISPLAY "
  <ElementFilter ElementName=\"ReportViewerConfig\">\n
    <StyleSheet>\n
      <ElementIdFilter Identifier=\"TextViewer\">\n
        <StyleSheet>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>ViewerType</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>TextViewer</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>Parameter</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>.txt</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
        </StyleSheet>\n
      </ElementIdFilter>\n
  </ElementFilter>\n

" TO fTheme				
			   
			   			   
		#DEFAULT -------------------------------------------------------------------------------------------------
		ON ACTION "default"
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*

			CALL fgl_report_type("my_pipe","default")  # or q4gl_add_user_report_type("note","text")
			START REPORT invoice_report TO PIPE "my_pipe"
			CALL report_output(FALSE)
			FINISH REPORT invoice_report
	
			CALL clearInsructions()  --clear instructions from form
	
			DISPLAY "default" TO fLastOption			   
			DISPLAY "
			\"default\" Uses the default method of showing reports\n
			
			" TO fDescription	   
			DISPLAY "
			CALL fgl_report_type(\"my_pipe\",\"default\")\n
			START REPORT invoice_report TO PIPE \"my_pipe\"\n
			OUTPUT TO REPORT invoice_report(101)\n
			FINISH REPORT invoice_report\n
			" TO f4gl
				
			DISPLAY "
  <ElementFilter ElementName=\"ReportViewerConfig\">\n
      <ElementIdFilter Identifier=\"default\">
        <StyleSheet>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>ViewerType</PropertyName>\n
              </PropertyPath>\n
            </SetProperty>\n
          </DoStyleAction>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>Parameter</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>.txt</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
        </StyleSheet>\n
      </ElementIdFilter>\n
  </ElementFilter>\n

" TO fTheme				
			   
			   				   
		#INJECT -------------------------------------------------------------------------------------------------
		ON ACTION "inject"
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*

			CALL fgl_report_type("my_pipe","inject")  # or q4gl_add_user_report_type("note","text")
			START REPORT invoice_report TO PIPE "my_pipe"
			CALL report_output(FALSE)
			FINISH REPORT invoice_report
	
			CALL clearInsructions()  --clear instructions from form
	
			DISPLAY "inject" TO fLastOption			   
			DISPLAY "
			\"inject\" Displays a report to a textArea Widget in the currently displayed/active form\n
			
			" TO fDescription	   
			DISPLAY "
			CALL fgl_report_type(\"my_pipe\",\"inject\")\n
			START REPORT invoice_report TO PIPE \"my_pipe\"\n
			OUTPUT TO REPORT invoice_report(101)\n
			FINISH REPORT invoice_report\n
			" TO f4gl
				
			DISPLAY "
  <ElementFilter ElementName=\"ReportViewerConfig\">\n
    <StyleSheet>\n
      <ElementIdFilter Identifier=\"inject\">\n
        <StyleSheet>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>ViewerType</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>inject</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>Parameter</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>.txt</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
        </StyleSheet>\n
      </ElementIdFilter>\n
  </ElementFilter>\n

" TO fTheme				
	
	
		#PIPE>FILE -------------------------------------------------------------------------------------------------
		ON ACTION "PIPE>FILE"
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*

			START REPORT invoice_report TO PIPE "more > report.out"
			CALL report_output(FALSE)
			FINISH REPORT invoice_report
	
			CALL clearInsructions()  --clear instructions from form
	
			DISPLAY "PIPE>FILE" TO fLastOption			   
			DISPLAY "
			\"PIPE>FILE\" Pipes a report to a file\n
			In our example, report.out
			
			" TO fDescription	   
			DISPLAY "
			START REPORT invoice_report TO PIPE \"more > report.out\"\n
		  OUTPUT TO REPORT invoice_report(101)\n
   		FINISH REPORT invoice_report\n	
			" TO f4gl
				
			DISPLAY "

" TO fTheme				


		#DOWNLOAD -------------------------------------------------------------------------------------------------
		ON ACTION "XML PRINT"
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*
			CALL fgl_report_type("my_pipe","download")  # or q4gl_add_user_report_type("note","text")
			
#			START REPORT invoice_report TO PIPE "my_pipe"
			
			START REPORT invoice_report TO XML HANDLER om.XmlWriter.createFileWriter("xml/output.xml")
			
			CALL report_output(FALSE)
#			FOR i = modu_line_id_start TO 130
#				   OUTPUT TO REPORT invoice_report(i)
#			END FOR
			FINISH REPORT invoice_report

	
			CALL clearInsructions()  --clear instructions from form
	
			DISPLAY "shell_open" TO fLastOption			   
			DISPLAY "
			\"download\" uses the default file download method of your browser\n
			Only the file extension can be controlled (with the parameter properties i.e. .txt)\n
			The location can only be controlled in your browser setup a)download folder b)with fileDialog\n
			
			" TO fDescription	   
			DISPLAY "
			CALL fgl_report_type(\"my_pipe\",\"download\")\n
			START REPORT invoice_report TO PIPE \"my_pipe\"\n
			OUTPUT TO REPORT invoice_report(101)\n
			FINISH REPORT invoice_report\n
			" TO f4gl
				
			DISPLAY "
  <ElementFilter ElementName=\"ReportViewerConfig\">\n
    <StyleSheet>\n
      <ElementIdFilter Identifier=\"download\">\n
        <StyleSheet>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>ViewerType</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>download</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>Parameter</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>.txt</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
        </StyleSheet>\n
      </ElementIdFilter>\n
  </ElementFilter>\n

" TO fTheme				


		#DOWNLOAD -------------------------------------------------------------------------------------------------
		ON ACTION "XML PrintX"
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*
			CALL fgl_report_type("my_pipe","download")  # or q4gl_add_user_report_type("note","text")
			
#			START REPORT invoice_report TO PIPE "my_pipe"
			
			START REPORT invoice_report_printx TO XML HANDLER om.XmlWriter.createFileWriter("xml/output.xml")
			
			CALL report_output(TRUE)
#			FOR i = modu_line_id_start TO 130
#				   OUTPUT TO REPORT invoice_report(i)
#			END FOR
			FINISH REPORT invoice_report_printx

	
			CALL clearInsructions()  --clear instructions from form
	
			DISPLAY "shell_open" TO fLastOption			   
			DISPLAY "
			\"download\" uses the default file download method of your browser\n
			Only the file extension can be controlled (with the parameter properties i.e. .txt)\n
			The location can only be controlled in your browser setup a)download folder b)with fileDialog\n
			
			" TO fDescription	   
			DISPLAY "
			CALL fgl_report_type(\"my_pipe\",\"download\")\n
			START REPORT invoice_report TO PIPE \"my_pipe\"\n
			OUTPUT TO REPORT invoice_report(101)\n
			FINISH REPORT invoice_report\n
			" TO f4gl
				
			DISPLAY "
  <ElementFilter ElementName=\"ReportViewerConfig\">\n
    <StyleSheet>\n
      <ElementIdFilter Identifier=\"download\">\n
        <StyleSheet>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>ViewerType</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>download</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
          <DoStyleAction>\n
            <SetProperty>\n
              <PropertyPath>\n
                <PropertyName>Parameter</PropertyName>\n
              </PropertyPath>\n
              <PropertyValue>.txt</PropertyValue>\n
            </SetProperty>\n
          </DoStyleAction>\n
        </StyleSheet>\n
      </ElementIdFilter>\n
  </ElementFilter>\n

" TO fTheme				


		#TO FILE
		ON ACTION "TO FILE .xls" --with fgl_download()
			LET l_server_file = "report/report_to_file.xls"
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*

			START REPORT invoice_report TO FILE l_server_file
			CALL report_output(FALSE)
			FINISH REPORT invoice_report
			LOCATE l_report_file in file l_server_file
			DISPLAY l_server_file
			DISPLAY os.Path.basename(l_server_file)
			IF fgl_download(l_server_file, os.Path.basename(l_server_file)) THEN
				LET l_msg = "Server/Cloud File ", trim(l_server_file), " was downloaded to client as", trim(os.Path.basename(l_server_file))
				MESSAGE l_msg
			ELSE
				LET l_msg = "Server/Cloud File ", trim(l_server_file), " could NOT be downloaded to client as", trim(os.Path.basename(l_server_file))
				ERROR l_msg
			END IF
							
			DISPLAY l_report_file TO report_output
				   
			CALL clearInsructions()  --clear instructions from form	   
	
			DISPLAY "NONE" TO fLastOption			   
			DISPLAY "
			OUTPUT TO FILE (and fgl_download(\"source server file\",\"target client file\") is used.\n
			In our example, we specified the output file extension \"report/report_to_file.xls\"
			" TO fDescription	   
			DISPLAY "	
				LET l_server_file = \"report/report_to_file.xls\" 		
				START REPORT invoice_report TO FILE l_server_file\n
				OUTPUT TO REPORT invoice_report(inv_line)\n
				FINISH REPORT invoice_report\n
				CALL fgl_download(l_server_file, os.Path.basename(l_server_file))
				" TO f4gl
				
			DISPLAY "" TO fTheme				

		ON ACTION "TO PIPE .txt" --with CALL ui.Interface.writeToPipe("my_pipe",l_report_file)
			LET l_server_file = "report/report_to_file.xls"
			CALL get_invoice(15007) RETURNING modu_rec_invoice.*

			START REPORT invoice_report TO PIPE "l_server_file"
			CALL report_output(FALSE)
			FINISH REPORT invoice_report
			LOCATE l_report_file in file l_server_file
			CALL ui.Interface.writeToPipe("my_pipe",l_report_file)
			DISPLAY l_report_file TO report_output
				   
			CALL clearInsructions()  --clear instructions from form	   
	
			DISPLAY "NONE" TO fLastOption			   
			DISPLAY "
			OUTPUT TO FILE (and ui.Interface.writeToPipe(\"my_pipe\",l_report_file) is used.\n
			IF the file is send to the client via a pipe (without any special .qxtheme options,\n 
			the file extension will be .txt and file name will be random\n
			" TO fDescription	   
			DISPLAY "	
				LET l_server_file = \"report/report_to_file.xls\" 		
				START REPORT invoice_report TO FILE l_server_file\n
				OUTPUT TO REPORT invoice_report(inv_line)\n
				FINISH REPORT invoice_report\n
				CALL fgl_download(l_server_file, os.Path.basename(l_server_file))
				" TO f4gl
				
			DISPLAY "" TO fTheme				


	
	####
	#####
				   				   			   			   
		ON ACTION "Exit"
			EXIT MENU
		
	END MENU

END MAIN
#####################################################################################
# END MAIN
#####################################################################################


#####################################################################################
# FUNCTION report_output(p_report_xml)
#
# REPORT OUTPUT
#####################################################################################
FUNCTION report_output(p_report_xml)
	DEFINE p_report_xml BOOLEAN
	DEFINE i SMALLINT
	DEFINE l_last_group SMALLINT
	DEFINE l_rec_inv_line RECORD
		invoice_id INT, #VARCHAR(20),
		stock_group_id SMALLINT,
		stock_id SMALLINT, #  VARCHAR(20),
		quantity SMALLINT,
  	item_desc STRING,
  	item_cost MONEY(8,2),
  	line_total_net MONEY(8,2),
  	tax_rate DECIMAL(4,2),
  	line_tax MONEY(8,2),
  	line_total MONEY(8,2)
	END RECORD
	
  DEFINE l_rec_stock_item
  	RECORD
  		stock_id SMALLINT, #string,
			stock_group_id SMALLINT,
  		item_desc STRING,
  		rate_id CHAR(3),
  		item_cost MONEY(10,2)
  	END RECORD 

	DEFINE l_rec_inv_line_parameter 
		RECORD
			invoice_id INT, #VARCHAR(20),
			stock_id SMALLINT, #  VARCHAR(20),
			quantity SMALLINT
		END RECORD

	DEFINE l_tax_rates 
		RECORD
			rate_id VARCHAR(3),
			tax_rate DECIMAL(4,2)
		END RECORD

			FOR i = 0 TO 30 #we only prepared 30 sample products (for 30 invoice lines)
    		CALL get_next_generated_invoice_line_parameter_rec(i) RETURNING l_rec_inv_line_parameter.*
	      CALL get_stock_item(l_rec_inv_line_parameter.stock_id) RETURNING l_rec_stock_item.*
	      CALL get_tax_rate_rec(l_rec_stock_item.rate_id) RETURNING l_tax_rates.*
	

				LET l_rec_inv_line.invoice_id = modu_rec_invoice.invoice_id
				LET l_rec_inv_line.stock_id = l_rec_stock_item.stock_id
				LET l_rec_inv_line.stock_group_id = l_rec_stock_item.stock_group_id
				LET l_rec_inv_line.quantity = l_rec_inv_line_parameter.quantity
				LET l_rec_inv_line.item_desc = l_rec_stock_item.item_desc
				LET l_rec_inv_line.item_cost = l_rec_stock_item.item_cost
				LET l_rec_inv_line.line_total_net = l_rec_inv_line_parameter.quantity * l_rec_inv_line.item_cost
				LET l_rec_inv_line.tax_rate = l_tax_rates.tax_rate
				LET l_rec_inv_line.line_tax = l_rec_inv_line.line_total_net * l_rec_inv_line.tax_rate / 100
				LET l_rec_inv_line.line_total = l_rec_inv_line.line_total_net  + l_rec_inv_line.line_tax
	
				LET modu_rec_invoice.inv_tax = modu_rec_invoice.inv_tax + l_rec_inv_line.line_tax
				LET modu_rec_invoice.inv_net_total = modu_rec_invoice.inv_net_total + l_rec_inv_line.line_total_net
				LET modu_rec_invoice.inv_total = modu_rec_invoice.inv_total + l_rec_inv_line.line_total

				IF l_last_group = l_rec_inv_line.stock_group_id THEN
					LET modu_rec_group.inv_net_total = modu_rec_group.inv_net_total + l_rec_inv_line.line_total_net
					LET modu_rec_group.inv_tax = modu_rec_group.inv_tax + l_rec_inv_line.line_tax
					LET modu_rec_group.inv_total = modu_rec_group.inv_total + l_rec_inv_line.line_total
				END IF
			
				LET l_last_group = l_rec_inv_line.stock_group_id
				
				IF p_report_xml THEN
					OUTPUT TO REPORT invoice_report_printX(i,l_rec_inv_line.*)
				ELSE
					OUTPUT TO REPORT invoice_report(i,l_rec_inv_line.*)
				END IF
			END FOR

END FUNCTION
#####################################################################################
# END FUNCTION report_output(p_report_xml)
#####################################################################################


#####################################################################################
# FUNCTION clearInsructions()
#
#
#####################################################################################
FUNCTION clearInsructions()
		DISPLAY "" TO fLastOption			   
		DISPLAY "" TO fDescription	   
		DISPLAY "" TO f4gl			
		DISPLAY "" TO fTheme				
END FUNCTION
#####################################################################################
# END FUNCTION clearInsructions()
#####################################################################################


#####################################################################################
# FUNCTION get_next_generated_invoice_line_parameter_rec()
#
# use some random functions to generate the inv line line quantity
# Note: dummy demo report only deals with ONE invoice
#####################################################################################
FUNCTION get_next_generated_invoice_line_parameter_rec(p_id)
	DEFINE p_id SMALLINT	
	DEFINE l_stock_id SMALLINT	
	DEFINE l_rec_inv_line_parameter 
		RECORD
			invoice_id SMALLINT, #VARCHAR(20),
			stock_id SMALLINT, #VARCHAR(20),
			quantity SMALLINT
		END RECORD

	LET l_stock_id = p_id + 100 #just a dummy formular.. we only have stock items 100 - 130

	LET l_rec_inv_line_parameter.invoice_id = 15007	
	LET l_rec_inv_line_parameter.stock_id = l_stock_id
	LET l_rec_inv_line_parameter.quantity = fgl_random(1, 100)

	RETURN l_rec_inv_line_parameter.*
END FUNCTION 
#####################################################################################
# END FUNCTION get_next_generated_invoice_line_parameter_rec()
#####################################################################################


#####################################################################################
# REPORT invoice_report(p_inv_line,p_rec_inv_line)
#
# Report definition for invoice
#
# RETURN NONE
#####################################################################################
REPORT invoice_report(p_inv_line,p_rec_inv_line)
	DEFINE p_inv_line INT 
	DEFINE p_rec_inv_line RECORD
		invoice_id INT, #VARCHAR(20),
		stock_group_id SMALLINT, #  VARCHAR(20),
		stock_id SMALLINT, #  VARCHAR(20),	
		quantity SMALLINT,
  	item_desc STRING,
  	item_cost MONEY(8,2),
  	line_total_net MONEY(8,2),
  	tax_rate DECIMAL(4,2),
  	line_tax MONEY(8,2),
  	line_total MONEY(8,2)
	END RECORD

  DEFINE ship_to_hdr      VARCHAR(20)
  DEFINE l_rec_del_address RECORD
		address1 STRING,
  	address2 STRING,
  	address3 STRING
  END RECORD

	DEFINE l_rec_contact 
		RECORD
			cont_fname  STRING,
			cont_lname STRING,
			cont_phone STRING,
			cont_fax STRING,
			cont_mobile STRING		
		END RECORD

	DEFINE l_rec_company 
		RECORD
			comp_id VARCHAR(10),
        comp_name STRING,
        comp_addr1 STRING,
        comp_addr2 STRING,
        comp_city STRING,
        comp_zip STRING,
        comp_country STRING
		END RECORD

	OUTPUT
		page length = 66
		TOP MARGIN = 2
		LEFT MARGIN = 3
		RIGHT MARGIN = 132
		BOTTOM MARGIN = 1
		
  FORMAT
  	####################################################
    FIRST PAGE HEADER
    ####################################################

  	########################################################
		# START of main report block
  	########################################################

	CALL get_company("SUP-01") RETURNING l_rec_company.*

  IF modu_rec_invoice.del_address_dif THEN
    LET ship_to_hdr = "Ship To:"
    LET l_rec_del_address.address1 = "Ahornweg 22"
    LET l_rec_del_address.address2 = "Neufinsing"
    LET l_rec_del_address.address3 = "85464 Finisng"
  END IF

	LET l_rec_contact.cont_fname = "Rüdiger"
	LET l_rec_contact.cont_lname = "Dornfelder"
	LET l_rec_contact.cont_phone = "089 22888300"
	LET l_rec_contact.cont_fax = "089 22888362"
	      
      PRINT "Sales Order Invoice " #, CURRENT YEAR TO MINUTE  --"Sales Order Invoice "
      SKIP 1 LINE

      PRINT "Billing Address:", 
        COLUMN 35, -"Contact:",
        COLUMN 60, ship_to_hdr
      SKIP 1 LINE

      PRINT l_rec_company.comp_name CLIPPED, 
        COLUMN 35, l_rec_contact.cont_fname CLIPPED, " ", l_rec_contact.cont_lname,
        COLUMN 60, l_rec_company.comp_name
      PRINT l_rec_company.comp_addr1 CLIPPED, 
        COLUMN 35, "Tel:",
        COLUMN 43, l_rec_contact.cont_phone CLIPPED,
        COLUMN 60, l_rec_del_address.address1
      PRINT l_rec_company.comp_addr2 CLIPPED, 
        COLUMN 35, "Fax:",  --"Fax:", 
        COLUMN 43, l_rec_contact.cont_fax CLIPPED,
        COLUMN 60, l_rec_del_address.address2
      PRINT l_rec_company.comp_city CLIPPED, 
        COLUMN 35, "Mobile:",  --"Mobile:", 
        COLUMN 43, l_rec_contact.cont_mobile CLIPPED,
        COLUMN 60, l_rec_del_address.address3       

      PRINT l_rec_company.comp_country
      PRINT l_rec_company.comp_zip
      SKIP 3 LINES

      PRINT "Invoice date: ", COLUMN 30, modu_rec_invoice.invoice_date  --"Invoice date: ",
      PRINT "Invoice P.O. Number:", COLUMN 30, modu_rec_invoice.invoice_po  --Invoice P.O. Number:
      PRINT "Invoice", COLUMN 30, modu_rec_invoice.invoice_id USING "<<<<<<&&"
      

      
      SKIP 1 LINE

  	########################################################
		# END of main report block
  	########################################################

		####################################################
		PAGE HEADER
		####################################################
      PRINT "Invoice date: ", COLUMN 16, modu_rec_invoice.invoice_date,  --"Invoice date: ",
      COLUMN 30, "Invoice P.O. Number:", COLUMN 50, modu_rec_invoice.invoice_po,  --Invoice P.O. Number:
      COLUMN 60, "Invoice", COLUMN 75, modu_rec_invoice.invoice_id USING "<<<<<<&&"
      PRINT "----------------------------------------------------------------------------------"
      SKIP 1 LINE


    BEFORE GROUP OF p_rec_inv_line.stock_group_id
      NEED 5 LINES
      SKIP 1 LINE
      PRINT "----------------------------------------------------------------------------------"
      PRINT "Group", COLUMN 11, p_rec_inv_line.stock_group_id
      PRINT "Item ID", COLUMN 11, "Qty",      --"Item ID"  --Qty
                       COLUMN 16, "Item Description",  --Item Description
                       COLUMN 50, "Item cost" ,  --"Item cost" 
                       COLUMN 66, "Tax",  --"Tax" 
                       COLUMN 73, "Line total"  --Line total
      PRINT "----------------------------------------------------------------------------------"

    AFTER GROUP OF p_rec_inv_line.stock_group_id
      PRINT "----------------------------------------------------------------------------------"
      PRINT COLUMN 01, "Group Net",		COLUMN 11, "$",modu_rec_group.inv_net_total USING "<<<,<<<,<<&.&&",
      			COLUMN 27, "Group Tax",		COLUMN 38, "$",modu_rec_group.inv_tax				USING "<<<,<<<,<<&.&&",
      			COLUMN 54, "Group Tot",		COLUMN 65, "$",modu_rec_group.inv_total			USING "<<<,<<<,<<&.&&"
      PRINT "----------------------------------------------------------------------------------"
      SKIP 1 LINE

			#Initialize Group summary for next/NEW group            
			LET modu_rec_group.inv_net_total = 0
			LET modu_rec_group.inv_tax = 0
			LET modu_rec_group.inv_total = 0				
      
    ON EVERY ROW
	      PRINT p_rec_inv_line.stock_id, 
	            COLUMN 11, p_rec_inv_line.quantity USING "<<<&&",
	            COLUMN 16, p_rec_inv_line.item_desc WORDWRAP RIGHT MARGIN 50
	
	      PRINT COLUMN 50, p_rec_inv_line.item_cost,
	            COLUMN 64, p_rec_inv_line.tax_rate USING "#&.&&%",
	            COLUMN 72, p_rec_inv_line.line_total

  PAGE TRAILER
      NEED 2 LINES
    PRINT "----------------------------------------------------------------------------------"  
    PRINT COLUMN 35, "Page ", PAGENO USING "<<<<&"  --Page
      SKIP 1 LINE
			
		ON LAST ROW
#			PRINT "----------------------------------------------------------------------------------"
			SKIP 1 LINES
				     
			PRINT COLUMN 01, "Total Net Amount:", COLUMN 25, "$", modu_rec_invoice.inv_tax         USING "<<<,<<<,<<&.&&"  --"Total Amount Due:"
			PRINT COLUMN 01, "Total Tax Amount:", COLUMN 25, "$", modu_rec_invoice.inv_net_total   USING "<<<,<<<,<<&.&&"  --"Total Amount Due:"
			PRINT COLUMN 01, "Total Amount Due:", COLUMN 25, "$", modu_rec_invoice.inv_total       USING "<<<,<<<,<<&.&&"  --"Total Amount Due:"
	
			LET modu_rec_invoice.for_total = modu_rec_invoice.inv_net_total * 1.33 #just a dummy foreign currency exchange rate

     IF modu_rec_invoice.for_total IS NOT NULL THEN 
       PRINT "Foreign Currency", COLUMN 25, modu_rec_invoice.for_total USING "<<<<<<<<&.&&", " ", get_currency_name(modu_rec_invoice.currency_id) #l_currency_name
       PRINT "Exchange rate:",   COLUMN 25, "1.132"  --Exchange rate: get_xchg_rate(modu_rec_invoice.currency_id) USING "<&.&&&"
     ELSE 
       PRINT ""
     END IF
	

END REPORT
#####################################################################################
# END REPORT invoice_report(p_inv_line,p_rec_inv_line)
#####################################################################################


#####################################################################################
# REPORT invoice_report_printX(p_inv_line,p_rec_inv_line)
#
# Report definition for invoice using printX
# The PRINTX statement is similar to PRINT, except that when XML is produced by the report, 
# the XML print element will be named as specified. If the NAME clause is omitted or the 
# report is run in non-XML mode, then PRINTX does exactly the same as PRINT.
# RETURN NONE
#####################################################################################
REPORT invoice_report_printX(p_inv_line,p_rec_inv_line)
	DEFINE p_inv_line INT 
	DEFINE p_rec_inv_line RECORD
		invoice_id INT, #VARCHAR(20),
		stock_group_id SMALLINT, #  VARCHAR(20),
		stock_id SMALLINT, #  VARCHAR(20),	
		quantity SMALLINT,
  	item_desc STRING,
  	item_cost MONEY(8,2),
  	line_total_net MONEY(8,2),
  	tax_rate DECIMAL(4,2),
  	line_tax MONEY(8,2),
  	line_total MONEY(8,2)
	END RECORD

  DEFINE ship_to_hdr      VARCHAR(20)
  DEFINE l_rec_del_address RECORD
		address1 STRING,
  	address2 STRING,
  	address3 STRING
  END RECORD

	DEFINE l_rec_contact 
		RECORD
			cont_fname  STRING,
			cont_lname STRING,
			cont_phone STRING,
			cont_fax STRING,
			cont_mobile STRING		
		END RECORD

	DEFINE l_rec_company 
		RECORD
			comp_id VARCHAR(10),
        comp_name STRING,
        comp_addr1 STRING,
        comp_addr2 STRING,
        comp_city STRING,
        comp_zip STRING,
        comp_country STRING
		END RECORD

#	OUTPUT
#		page length = 66
#		TOP MARGIN = 2
#		LEFT MARGIN = 3
#		RIGHT MARGIN = 132
#		BOTTOM MARGIN = 1
		
  FORMAT
  	####################################################
    FIRST PAGE HEADER
    ####################################################

			CALL get_company("SUP-01") RETURNING l_rec_company.*
		
		  IF modu_rec_invoice.del_address_dif THEN
		    LET ship_to_hdr = "Ship To:"
		    LET l_rec_del_address.address1 = "Ahornweg 22"
		    LET l_rec_del_address.address2 = "Neufinsing"
		    LET l_rec_del_address.address3 = "85464 Finisng"
		  END IF
		
			LET l_rec_contact.cont_fname = "Rüdiger"
			LET l_rec_contact.cont_lname = "Dornfelder"
			LET l_rec_contact.cont_phone = "089 22888300"
			LET l_rec_contact.cont_fax = "089 22888362"
		  PRINTX name=HubertNode "Hubert Text"
		  DISPLAY "Why is my Page Header not processed for xml output file"
      PRINTX "Sales Order Invoice" #, CURRENT YEAR TO MINUTE  --"Sales Order Invoice "
      SKIP 1 LINE

      PRINTX name=xxx ship_to_hdr
      PRINTX name=company l_rec_company.*       
      PRINTX name=invoice modu_rec_invoice.*       
	
	  	########################################################
			# END of FIRST PAGE HEADER
	  	########################################################

		####################################################
		PAGE HEADER
		####################################################
		# Page Header information would be duplicated information / do not need it for my xml output.. but you could add it
			#PRINTX "Invoice date: ", COLUMN 16, modu_rec_invoice.invoice_date,  --"Invoice date: ",
			#COLUMN 30, "Invoice P.O. Number:", COLUMN 50, modu_rec_invoice.invoice_po,  --Invoice P.O. Number:
			#COLUMN 60, "Invoice", COLUMN 75, modu_rec_invoice.invoice_id USING "<<<<<<&&"
			#PRINTX "----------------------------------------------------------------------------------"
			#SKIP 1 LINE
			#BEFORE GROUP OF p_rec_inv_line.stock_group_id
			#PRINTX namep_rec_inv_line.stock_group_id

    AFTER GROUP OF p_rec_inv_line.stock_group_id
      PRINTX modu_rec_group.*

			#Initialize Group summary for next/NEW group            
			LET modu_rec_group.inv_net_total = 0
			LET modu_rec_group.inv_tax = 0
			LET modu_rec_group.inv_total = 0				
      
    ON EVERY ROW
	      PRINTX name=invoice_line p_rec_inv_line.* 
			
		ON LAST ROW
#			PRINTX "----------------------------------------------------------------------------------"
			SKIP 1 LINES
				     
			PRINTX name=invoice modu_rec_invoice.*


END REPORT
#####################################################################################
# END REPORT invoice_report(p_inv_line,p_rec_inv_line)
#####################################################################################


############################################################
# some dummy data return functions
############################################################


############################################################
# FUNCTION get_currency_name(p_currency_id)
#
#
############################################################
FUNCTION get_currency_name(p_currency_id)
	DEFINE p_currency_id CHAR(3)
	DEFINE l_ret_currency_name STRING
	DEFINE l_msg_str STRING

	IF 	p_currency_id > 2 OR p_currency_id < 1 THEN
		LET l_msg_str = "Invalid currency ID p_currency_id=", trim(p_currency_id) 
		CALL fgl_winmessage("Invalid currency",l_msg_str,"ERROR")
		EXIT PROGRAM
	END IF
	
	CASE p_currency_id
		WHEN "EUR"
			LET l_ret_currency_name = "€ Euro"
		WHEN "US$"
			LET l_ret_currency_name = "$ Dollar"
	END CASE
	
	RETURN l_ret_currency_name
END FUNCTION
############################################################
# END FUNCTION get_currency_name(p_currency_id)
############################################################


############################################################
# FUNCTION get_stock_item(p_stock_id)
#
#
############################################################
FUNCTION get_stock_item(p_stock_id)
	DEFINE p_stock_id SMALLINT #VARCHAR(20)
  DEFINE ret_rec_stock_item_inv_line
  	RECORD
  		stock_id SMALLINT, #string,
			stock_group_id SMALLINT,
  		item_desc STRING,
  		rate_id CHAR(3),
  		item_cost MONEY(10,2)
  	END RECORD 
			
	CASE p_stock_id #we have no database.. simulation of data....	
		WHEN 100
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 8inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 113.18
		WHEN 101
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 9 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 120.22
		WHEN 102
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 10 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 131.83
		WHEN 103
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 12 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 138.33

		WHEN 104
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 14 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 143.18

		WHEN 105
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 16 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 152.36

		WHEN 106
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 18 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 158.33

		WHEN 107
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 20 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 196.98

		WHEN 108
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 21 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 201.18

		WHEN 109
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 22 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 209.55

		WHEN 110
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 24 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 221.88

		WHEN 111
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 26 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 236.31

		WHEN 112
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 28 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 241.77

		WHEN 113
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 30 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 255.79

		WHEN 114
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 32 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 262.55

		WHEN 115
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 34 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 277.99

		WHEN 116
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 500
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 36 inch Flat Screen SA9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 285.11

		WHEN 117
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 501
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 08 inch Curved Flat Screen SC9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 313.18

		WHEN 118
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 501			
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 09 inch Curved Flat Screen SC9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 313.18

		WHEN 119
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 501	
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 10 inch Curved Flat Screen SC9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 313.18
		WHEN 120
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 501	
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 12 inch Curved Flat Screen SC9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 313.18
		WHEN 121
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 501	
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 14 inch Curved Flat Screen SC9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 313.18
		WHEN 122
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 501	
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 16 inch Curved 26 Flat Screen SC9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 313.18
		WHEN 123
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 501	
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 18 inch Curved Flat Screen SC9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 313.18
		WHEN 124
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 501	
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 20 inch Curved Flat Screen SC9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 313.18
		WHEN 125
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 501	
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 21 inch Curved Flat Screen SC9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 313.18
		WHEN 126
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 501	
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 22 inch Curved Flat Screen SC9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 313.18
		WHEN 127
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 501	
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 24 inch Curved Flat Screen SC9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 313.18
		WHEN 128
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 501	
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 26 inch Curved Flat Screen SC9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 313.18
		WHEN 129
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 501	
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 28 inch Curved Flat Screen SC9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 313.18
		WHEN 130
			LET ret_rec_stock_item_inv_line.stock_id = p_stock_id
			LET ret_rec_stock_item_inv_line.stock_group_id = 501	
			LET ret_rec_stock_item_inv_line.item_desc = "Samsung PC Monitor 30 inch Curved Flat Screen SC9823D"
			LET ret_rec_stock_item_inv_line.rate_id = 2
			LET ret_rec_stock_item_inv_line.item_cost = 313.18
	END CASE
	
	RETURN ret_rec_stock_item_inv_line.*
END FUNCTION
############################################################
# END FUNCTION get_stock_item(p_stock_id)
############################################################


############################################################
# FUNCTION get_tax_rate_rec(p_rate_id)
#
#
############################################################
FUNCTION get_tax_rate_rec(p_rate_id)
	DEFINE p_rate_id VARCHAR(3)
	DEFINE l_rec_tax_rates 
		RECORD
			rate_id VARCHAR(3),
			tax_rate DECIMAL(4,2)
		END RECORD

	CASE p_rate_id
		WHEN 0
			LET l_rec_tax_rates.rate_id = p_rate_id
			LET l_rec_tax_rates.tax_rate = 0
		WHEN 1
			LET l_rec_tax_rates.rate_id = p_rate_id
			LET l_rec_tax_rates.tax_rate = 7
		WHEN 2
			LET l_rec_tax_rates.rate_id = p_rate_id
			LET l_rec_tax_rates.tax_rate = 19
		WHEN 3
			LET l_rec_tax_rates.rate_id = p_rate_id
			LET l_rec_tax_rates.tax_rate = 25
	END CASE
	
	RETURN l_rec_tax_rates.*
END FUNCTION
############################################################
# END FUNCTION get_tax_rate_rec(p_rate_id)
############################################################


############################################################
# FUNCTION get_invoice(p_invoice_id)
#
#
############################################################
FUNCTION get_invoice(p_invoice_id)
	DEFINE p_invoice_id SMALLINT #VARCHAR(4)
	DEFINE ret_rec_invoice 
		RECORD
			invoice_id INT ,
			ship_to_hdr STRING,
			del_address_dif BOOLEAN,
			invoice_date DATE,
			invoice_po STRING,
			currency_id CHAR(3),
			inv_net_total MONEY(10,2),
			inv_tax MONEY(10,2),
      inv_total MONEY(10,2),
			for_total DECIMAL(10,2)
		END RECORD   
    
	LET ret_rec_invoice.invoice_id = p_invoice_id
	LET ret_rec_invoice.ship_to_hdr = "Marienplatz"
	LET ret_rec_invoice.del_address_dif = TRUE
	LET ret_rec_invoice.invoice_date = "12/12/2020"
	LET ret_rec_invoice.invoice_po = "EFGH"
	LET ret_rec_invoice.currency_id = "EUR"
	LET ret_rec_invoice.for_total = 1234.12
	LET ret_rec_invoice.inv_total = 5678.63
	#some changes because we have no database and just try to simlulate a bunch of data
	LET ret_rec_invoice.for_total = 0
	LET ret_rec_invoice.inv_tax = 0
	LET ret_rec_invoice.inv_net_total = 0
	LET ret_rec_invoice.inv_total = 0
    
     	RETURN ret_rec_invoice.*
END FUNCTION      
############################################################
# END FUNCTION get_invoice(p_invoice_id)
############################################################


############################################################
# FUNCTION get_company(p_comp_id)
#
#
############################################################
FUNCTION get_company(p_comp_id)
	DEFINE p_comp_id VARCHAR(10)
	DEFINE l_rec_company 
		RECORD
			comp_id VARCHAR(10),		
        comp_name STRING,
        comp_addr1 STRING,
        comp_addr2 STRING,
        comp_city STRING,
        comp_zip STRING,
        comp_country STRING
		END RECORD
		
	LET l_rec_company.comp_id = p_comp_id	
	LET l_rec_company.comp_name = "Supernova Plc"
	LET l_rec_company.comp_addr1 = "Queens Drive"
	LET l_rec_company.comp_addr2 = "Business Center"
	LET l_rec_company.comp_city = "Hamburg"
	LET l_rec_company.comp_zip = "28193"
	LET l_rec_company.comp_country = "Germany"

	RETURN l_rec_company.*
END FUNCTION	
############################################################
# END FUNCTION get_company(p_comp_id)
############################################################