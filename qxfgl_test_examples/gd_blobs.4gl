#########################################################################################################
# BLOB & fgl_download() Demo
#
#
# Modification History:
# 10.03.04 DS - V2 - Created
# 21.11.06 HH - V3 - Added fgl_download
#########################################################################################################
##########################################################################################
#! The BYTE datatype is a type-less arbitrarily sized object which is capable of 
#! storing binary data. 
#!
#! The TEXT datatype is an arbitrarily sized object which is capabable of storing
#! character data. The size limit of the BYTE and TEXT datatypes depends purely upon
#! physical characteristics of the system. 
#!
#! To use a BYTE/TEXT datatype, it is essential to first 'LOCATE' the value. The action 
#! of locating will clear any data associated with the variable, and allocate a new storage
#! unit for the variable in question. 
#!
#! Care should be taken when performing assignement with TEXT/BYTE types, as they are the only
#! 4GL value to be passed by reference. 
#!
#! Once you are finished with a BYTE or TEXT variable, you can release the resources associated
#! with the object by using the FREE statement. Therefore the typical lifespan of a BYTE/TEXT variable
#! will be: 
#!
#! DEFINE x BYTE
#! LOCATE x IN <locator>
#! <manipualte variable> 
#! FREE x
###########################################################################################
############################################################
#! Globals
############################################################
GLOBALS "gd_globals.4gl"
#####################################################################
#! FUNCTION document_form() Display different document types from BLOB's
#####################################################################
FUNCTION document_form()
  DEFINE 
    l_text1, l_text2, l_text3, l_text4    TEXT,
    l_byte1, l_byte2, l_byte3, l_byte4    BYTE,
    f_text 		                  TEXT,
    f_byte 		                  BYTE,
    f_html                                VARCHAR(200),
    image1, image2, image3, 
    image4, image_dummy                   VARCHAR(40),
    temp_file                             VARCHAR(100)
  DEFINE rb_action SMALLINT
  
  DEFINE s STRING
  LET image1 = get_image_path("gd_animal_cheetah.jpg")
  LET image2 = get_image_path("gd_animal_elephant.gif")
  LET image3 = get_image_path("gd_animal_giraffe.jpg")
  LET image4 = get_image_path("gd_animal_zebra.png")
#  OPTIONS
#    FORM LINE 1
  CALL fgl_window_open("w_blobs",2,2,get_form_path("gd_f_document_2_2"),FALSE)
  #Enable/Disable the buttons
{  DISPLAY "!" TO fb_image1
  DISPLAY "!" TO fb_image2
  DISPLAY "!" TO fb_image3
  DISPLAY "!" TO fb_image4
  DISPLAY "!" TO fb_text1
  DISPLAY "!" TO fb_text2
  DISPLAY "!" TO fb_text3
  DISPLAY "!" TO fb_text4
  DISPLAY "!" TO fi_word
  DISPLAY "!" TO fi_excel
  DISPLAY "!" TO fi_acrobat
  DISPLAY "!" TO fb_html1
  DISPLAY "!" TO fb_html2
  DISPLAY "!" TO fb_html3
  DISPLAY "!" TO fb_html4
  DISPLAY "!" TO fb_close
}
  #Locate memory for the blob/files
  LOCATE l_byte1 IN FILE image1
  LOCATE l_byte2 IN FILE image2
  LOCATE l_byte3 IN FILE image3
  LOCATE l_byte4 IN FILE image4
  LET temp_file = get_document_path("gd_text1.txt")
  LOCATE l_text1 IN FILE temp_file
  LET temp_file = get_document_path("gd_text2.txt")
  LOCATE l_text2 IN FILE temp_file
  LET temp_file = get_document_path("gd_text3.txt")
  LOCATE l_text3 IN FILE temp_file
  LET temp_file = get_document_path("gd_text4.txt")
  LOCATE l_text4 IN FILE temp_file
  LOCATE f_text IN MEMORY
  LOCATE f_byte IN MEMORY
# because we have LOCATEd the blobs in the physical files, we perform the input on a 
# dummy blob, to prevent any user changes being written to the file. 
LET f_byte = l_byte1
LET f_text = l_text1
  INPUT BY NAME f_byte, f_text, rb_action, f_html
    WITHOUT DEFAULTS ATTRIBUTES(UNBUFFERED)
    HELP 1
    BEFORE INPUT
      CALL publish_toolbar("blob_demo",0)
      #DISPLAY l_text1 TO f_text
      #DISPLAY l_byte1 TO f_byte
      CALL show_html_document(get_html_path("gd_html4.html"),"")  --initialise browser window with welcome text
        RETURNING f_html
      #CALL show_html_document(get_html_path("gd_html4.html"),"")  --static html file
    # Tab focus events
	#	ON ACTION actTabImagesSelected  -- (F401) 
      #DISPLAY l_byte1 TO f_byte
     # NEXT FIELD f_byte
	#	ON ACTION actTabDocumentsSelected  -- (F402)
    #  DISPLAY l_text1 TO f_text
   #   NEXT FIELD f_text
	#	ON ACTION actTabFilesSelected  -- (F403)
   #   NEXT FIELD rb_action
	#	ON ACTION actTabHtmlSelected  -- (F404)
  #    NEXT FIELD f_html
    # User events  to update corresponding TabPage contents ###################################
		#Images Tab view
    ON ACTION actTabImagesDisplayL_byte1  -- (F301)
      #DISPLAY l_byte1 TO f_byte
			LET f_byte = l_byte1
		#	NEXT FIELD CURRENT
		#	sleep 2
    #  NEXT FIELD f_byte
    ON ACTION "actTabImagesDisplayL_byte2"  -- (F302)
      #DISPLAY l_byte2 TO f_byte
			LET f_byte = l_byte2
		#	NEXT FIELD CURRENT
		#	sleep 2			
    #  NEXT FIELD f_byte
      			
    ON ACTION actTabImagesDisplayL_byte3  -- (F303)
      #DISPLAY l_byte3 TO f_byte
			LET f_byte = l_byte3
			#NEXT FIELD CURRENT      
      #NEXT FIELD f_byte
      
    ON ACTION actTabImagesDisplayL_byte4  -- (F304)
      #DISPLAY l_byte4 TO f_byte
      #NEXT FIELD f_byte
			LET f_byte = l_byte4
			#NEXT FIELD CURRENT      
      #NEXT FIELD f_byte
		#Documents Tab view
    ON ACTION actTabDocumentsDisplayL_text1  -- (F311)
      LET f_text = l_text1
    ON ACTION actTabDocumentsDisplayL_text2  -- (F312)
      LET f_text = l_text2
    ON ACTION actTabDocumentsDisplayL_text3  -- (F313)
      LET f_text = l_text3
    ON ACTION actTabDocumentsDisplayL_text4  -- (F314)
      LET f_text = l_text4
		#Files Tab view
    ON ACTION actTabFilesDisplayWordDoc  -- (F321)
      CALL fgl_dialog_update_data()
      CALL show_office_document("gd_document1.doc", rb_action)
    ON ACTION actTabFilesDisplayExcelXls  -- (F322)
      CALL fgl_dialog_update_data()
      CALL show_office_document("gd_document1.xls", rb_action)
    ON ACTION actTabFilesDisplayAdobePDF  -- (F323)
      CALL fgl_dialog_update_data()
      CALL show_office_document("gd_document1.pdf", rb_action)
#check this hubert 27.08.2014
		#Html Tab view
    ON ACTION actTabHtmlDisplayHtml1  -- (F331)
      DISPLAY "about:blank" to f_html
      LET f_html = show_html_document("",image1)  --dynamic
    ON ACTION actTabHtmlDisplayHtml2  -- (F332)
      DISPLAY "about:blank" to f_html
      LET f_html = show_html_document("",image2)  --dynamic
    ON ACTION actTabHtmlDisplayHtml3  -- (F333)
      #LET s = get_html_path("gd_html3.html")
      # html/gd_html3.html
      #call fgl_message_box(s)
      #LET s= show_html_document(s,"")
      # qx://clienttemp//html/gd_html3.html
      #call fgl_message_box(s)
      
      LET f_html = show_html_document(get_html_path("gd_html3.html"),"")  --static html file
    ON ACTION actTabHtmlDisplayHtml4  -- (F334)
      LET f_html = show_html_document(get_html_path("gd_html4.html"),"")  --static html file
		#Exit button/Key/Event
    ON KEY(F11)
      EXIT INPUT
      
    ON ACTION(actExit)
      EXIT INPUT
    AFTER INPUT
      CALL publish_toolbar("blob_demo",1)
  END INPUT
  CLEAR SCREEN
  CALL fgl_window_close("w_blobs")
  FREE l_byte1
  FREE l_byte2
  FREE l_byte3
  FREE l_byte4
  FREE f_byte
  FREE l_text1
  FREE l_text2
  FREE l_text3
  FREE l_text4
  FREE f_text
  #OPTIONS FORM LINE 3
END FUNCTION
#####################################################################
#! FUNCTION show_office_document(p_document) Opens wile in MS Office
#####################################################################
FUNCTION show_office_document(p_document, p_mode)
  DEFINE p_document 	VARCHAR(64)
  DEFINE l_file 	CHAR(1024)
  DEFINE p_mode SMALLINT
#@check this
  CALL fgl_download(get_document_path(p_document), get_client_temp_path(p_document))  --client_temp_directory || "/" || p_document)
    RETURNING l_file
  #we change the between  print and open
  IF p_mode THEN
    CALL fgl_set_property("gui","window.winshellexec.verb", "print")
  ELSE
    CALL fgl_set_property("gui","window.winshellexec.verb", "open")
  END IF
  CALL winshellexec(l_file)
END FUNCTION
#####################################################################
#! FUNCTION show_html_document(p_document,image) initialise browser window with welcome text
#####################################################################
FUNCTION show_html_document(p_document,image)
  DEFINE 
    p_document 	VARCHAR(220),
    l_file 	VARCHAR(255),
    inp_name VARCHAR(120),
    image_path VARCHAR(255),
    image VARCHAR(220),
    ret VARCHAR(200)
    #LET temp_path = get_temp_path()
  IF p_document IS NOT NULL THEN  --static html document which is included in the applications project directory and downloaded automatically
    LET p_document = fgl_download(p_document,get_client_temp_path(p_document))  --client_temp_directory || "/" || p_document)
  ELSE  -- html document with image - html file is created dynamically - on the fly
    #get some user text for the html contents
    LET inp_name = fgl_winprompt(5,5,get_str(600),get_str(601),"100",0)
    #download a image for the html for on the fly
    #LET ret = fgl_download(get_document_path(p_document), l_file)  --download image
    LET image_path = image  
    #LET ret = fgl_download(image, get_client_temp_path(image_path)) --client_temp_directory || "/" || image_path)
    -- check, if it could download the image - and call the function to create the html file with contents dynamically
    #IF ret IS NULL THEN
    #  CALL fgl_winmessage(get_str(35),get_str(36) || ":" || image || "\n" || get_str(37) || ":" || ret,"error")
      #CALL fgl_winmessage("fgl_download() return value","fgl_download() return value" || ret, "error")
    #ELSE
    LET p_document = write_html_page(image_path, inp_name)
      #DISPLAY p_document TO f_html
    #END IF
  END IF
  RETURN p_document
END FUNCTION
#########################################################################
#! FUNCTION write_html_page(image_path,inp_name) Creates html page
#########################################################################
FUNCTION write_html_page(image_path,inp_name)
  DEFINE 
    buffer, buffer_delimited CHAR(32000),
    input_pipe CHAR(20),
    inp_name VARCHAR(100),
    image_path CHAR(1024),
    out_file STRING
  LET buffer = ""
  LET buffer = trim(buffer), "<HTML>"
  LET buffer = trim(buffer), "<BODY>"
  LET buffer = trim(buffer), "<table border=\"1\" width=\"100%\" id=\"table1\">"
  LET buffer = trim(buffer), "<tr>"
  LET buffer = trim(buffer), "<td width=\"340\"><STRONG><FONT color=blue size=4>Hello Mr./Mrs. "
  LET buffer = trim(buffer), inp_name , "</FONT></STRONG><P><STRONG><FONT size=4 color=\"blue\"><FONT color=brown>"
  LET buffer = trim(buffer), "This html page is created<br>dynamically in 4gl</FONT> </FONT></STRONG></P>"
  LET buffer = trim(buffer), "<br><br>The image to the right was downloaded<br>from the Server (BLOB)<br>and referenced in the html.<br></FONT> </FONT></STRONG></P>"
  LET buffer = trim(buffer), "<A HREF=\"http://www.querix.com\">The Querix Website</A><P>"
  LET buffer = trim(buffer), "<A HREF=\"mailto:info@querix.com\">Email Querix</A></td>"
  LET buffer = trim(buffer), "<td>"
  LET buffer = trim(buffer), "<img src=\"../", trim(image_path) 
  LET buffer = trim(buffer), "\" alt=\" ", trim(image_path)
  LET buffer = trim(buffer), " \" height=\"200\" width=\"200\" /><br />"
  LET buffer = trim(buffer), "</td>"
  LET buffer = trim(buffer), "</tr>"
  LET buffer = trim(buffer), "</table>"
  LET buffer = trim(buffer), "</BODY></HTML>"
  LET out_file=get_html_path(get_html_print_output())
  
  CALL fgl_channel_open_file("stream", out_file, "w")  
  CALL fgl_channel_write("stream", buffer)
  CALL fgl_channel_close("stream")
  #CALL fgl_download("gd_temp.html", get_client_temp_path("gd_temp.html"))
  LET out_file="qx://application/"||out_file
  RETURN out_file
END FUNCTION