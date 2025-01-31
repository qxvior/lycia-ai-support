#########################################################################################################
# BLOB, Viewer/Editor, AND fgl_download()/fgl_upload() Demo
#
# Modification History:
# 10.03.04 DS - V2 - Created
# 21.11.06 HH - V3 - Added fgl_download
#########################################################################################################
##########################################################################################
# The BYTE datatype is a type-less arbitrarily sized object which is capable of 
# storing binary data. 
#
# The TEXT datatype is an arbitrarily sized object which is capabable of storing
# character data. The size limit of the BYTE and TEXT datatypes depends purely upon
# physical characteristics of the system. 
#
# To use a BYTE/TEXT datatype, it is essential to first 'LOCATE' the value. The action 
# of locating will clear any data associated with the variable, and allocate a new storage
# unit for the variable in question. 
#
# Care should be taken when performing assignement with TEXT/BYTE types, as they are the only
# 4GL value to be passed by reference. 
#
# Once you are finished with a BYTE or TEXT variable, you can release the resources associated
# with the object by using the FREE statement. Therefore the typical lifespan of a BYTE/TEXT variable
# will be: 
#
# DEFINE x BYTE
# LOCATE x IN <locator>
# <manipualte variable> 
# FREE x
###########################################################################################
############################################################
# Globals
############################################################
GLOBALS "wig_blobviewer_global.4gl"

#####################################################################
# FUNCTION manage_document_form() Display different document types from BLOB's
#
#
#####################################################################
FUNCTION manage_document_form()
  DEFINE l_text1, l_text2, l_text3, l_text4 TEXT
  DEFINE l_byte1, l_byte2, l_byte3, l_byte4 BYTE
  DEFINE f_text TEXT
  DEFINE f_byte BYTE
  DEFINE l_image1, l_image2, l_image3 VARCHAR(40)
  DEFINE l_image4, image_dummy VARCHAR(40)
  DEFINE temp_file VARCHAR(100)
  DEFINE rb_action STRING
  
  DEFINE s STRING
  
  CALL initTempPath()	--initialise temp folders client/server 
											--NOTE: apps running browser have no temp client folder / no local file access 
											--we need to simulate it if this on the server is required
  
  CALL fgl_window_open("w_blobs",2,2,"form/wig_blobViewer.fm2",FALSE)

  #Locate memory for the blob/files
  LET l_image1 = "image/gd_animal_cheetah.jpg"
  LET l_image2 = "image/gd_animal_elephant.gif"
  LET l_image3 = "image/gd_animal_giraffe.jpg"
  LET l_image4 = "image/gd_animal_zebra.png"
  
  LOCATE l_byte1 IN FILE l_image1
  LOCATE l_byte2 IN FILE l_image2
  LOCATE l_byte3 IN FILE l_image3
  LOCATE l_byte4 IN FILE l_image4
  
  LOCATE l_text1 IN FILE "txt/gd_text1.txt"
  LOCATE l_text2 IN FILE "txt/gd_text2.txt"
  LOCATE l_text3 IN FILE "txt/gd_text3.txt"
  LOCATE l_text4 IN FILE "txt/gd_text4.txt"
  
  LOCATE f_text IN MEMORY
  LOCATE f_byte IN MEMORY

	# because we have LOCATEd the blobs in the physical files, we perform the input on a 
	# dummy blob, to prevent any user changes being written to the file. 
	LET f_byte = l_byte1
	LET f_text = l_text1
	LET rb_action = "open" #default open
  INPUT BY NAME f_byte, f_text , rb_action 
    WITHOUT DEFAULTS ATTRIBUTES(UNBUFFERED)

    # User events  to update corresponding TabPage contents ###################################
		#Images Tab view
    ON ACTION actTabImagesDisplayL_byte1  
			LET f_byte = l_byte1

    ON ACTION "actTabImagesDisplayL_byte2" 
			LET f_byte = l_byte2
      			
    ON ACTION actTabImagesDisplayL_byte3  
			LET f_byte = l_byte3
      
    ON ACTION actTabImagesDisplayL_byte4  
			LET f_byte = l_byte4


		#Documents Tab view
    ON ACTION actTabDocumentsDisplayL_text1  
      LET f_text = l_text1

    ON ACTION actTabDocumentsDisplayL_text2  
      LET f_text = l_text2

    ON ACTION actTabDocumentsDisplayL_text3  
      LET f_text = l_text3

    ON ACTION actTabDocumentsDisplayL_text4  
      LET f_text = l_text4
      
		#Files Tab view
    ON ACTION actTabFilesDisplayWordDoc  
      CALL show_office_document("gd_document1.docx", rb_action)
      
    ON ACTION actTabFilesDisplayExcelXls  
      CALL show_office_document("gd_document1.xlsx", rb_action)
      
    ON ACTION actTabFilesDisplayAdobePDF  
      CALL show_office_document("gd_document1.pdf", rb_action)
   
		ON ACTION "UPLOAD"
			CALL upload_file_demo()

		ON ACTION "DOWNLOAD"
			CALL download_file_demo("pdf_example.pdf")

		ON ACTION "FILE_DIALOG"
			CALL file_browser_demo("open",get_client_temp_path(NULL),NULL)	
		
		ON ACTION(actExit)
      EXIT INPUT
      
    AFTER INPUT
      #CALL publish_toolbar("blob_demo",1)
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

END FUNCTION
#####################################################################
# END FUNCTION manage_document_form() Display different document types from BLOB's
#####################################################################


#####################################################################
# FUNCTION upload_file_demo()
#
#
#####################################################################
FUNCTION upload_file_demo()
  DEFINE l_client_doc_file_name STRING
  DEFINE l_server_doc_file_name STRING  
	DEFINE l_choice CHAR(1)
	DEFINE l_file_modified_time STRING
	DEFINE l_msg STRING
	
	LET l_client_doc_file_name = fgl_file_dialog("open","1","Select the file",get_client_temp_path(NULL),NULL,"*.*")
	LET l_server_doc_file_name = "document/",os.Path.basename(l_client_doc_file_name) 

	CALL os.Path.mtime(l_client_doc_file_name) RETURNING l_file_modified_time

	LET l_msg = 
		"Do you want to upload this file from the client to the server (DB) ?\n",
		"This file was last modified on/at: ", trim(l_file_modified_time)
	LET l_choice = fgl_winbutton("Upload Demo", l_msg , "No", "Yes|No", "question", 1)
	IF l_choice = "Y" THEN
	  IF fgl_upload(l_client_doc_file_name,l_server_doc_file_name) THEN
	  	LET l_msg = "File ", l_client_doc_file_name, " uploaded to the server in ", l_server_doc_file_name
	  	MESSAGE l_msg
	  ELSE
			CALL fgl_winmessage("Error","Could not upload the file","error")
		END IF
	END IF		

END FUNCTION
#####################################################################
# END FUNCTION upload_file_demo()
#####################################################################

#####################################################################
# FUNCTION download_file_demo(p_file_name)
#
#
#####################################################################
FUNCTION download_file_demo(p_file_name)
	DEFINE p_file_name STRING
  DEFINE l_client_doc_file_name STRING
  DEFINE l_server_doc_file_name STRING  
	DEFINE l_choice CHAR(1)
	DEFINE l_msg STRING

	LET l_server_doc_file_name = "document/", trim(p_file_name)
	LET l_client_doc_file_name = get_client_temp_path(p_file_name)
	# If this would be used with a database, we retrieve the BLOB from the DB
	# and locate it's memory as file - this happens on the server
	# Download the file from the server to the client (drive)
  IF NOT fgl_download(l_server_doc_file_name, l_client_doc_file_name) THEN --client_temp_directory || "/" || p_document)
		CALL fgl_winmessage("Error","Could not download file","error")
	ELSE
		LET l_msg = "File ", l_server_doc_file_name, " was downloaded to ", l_client_doc_file_name
		MESSAGE l_msg
	END IF

	LET l_choice = fgl_winbutton("Download Demo", "Do you want to view the client target folder ?", "No", "Yes|No", "question", 1)
	IF l_choice = "Y" THEN
		LET l_client_doc_file_name = fgl_file_dialog("open","1","Select the file",get_client_temp_path(NULL),NULL,"*.*")
	END IF		

END FUNCTION
#####################################################################
# END FUNCTION download_file_demo(p_file_name)
#####################################################################


#####################################################################
# FUNCTION file_browser_demo(p_type,p_path,p_file_name)
#
#
#####################################################################
FUNCTION file_browser_demo(p_type,p_path,p_file_name)
	DEFINE p_type STRING #open or save
	DEFINE p_path STRING
	DEFINE p_file_name STRING
	DEFINE l_ret_specified_file STRING
	DEFINE l_msg STRING
	
	IF p_type IS NULL THEN
		LET p_type = "open" #file dialog can be in open or save style
	END IF
	
	LET l_ret_specified_file = fgl_file_dialog("open","1","Select the file",p_path,NULL,"*.*")
	IF l_ret_specified_file IS NULL THEN
		MESSAGE "You canceled the file dialog"
	ELSE
		LET l_msg = "You selected the file ", trim(l_ret_specified_file) , " from the client machine"
		CALL fgl_winmessage("Demo",l_msg,"info")
	END IF
	
	RETURN l_ret_specified_file	
END FUNCTION
#####################################################################
# END FUNCTION file_browser_demo(p_type,p_path,p_file_name)
#####################################################################


#####################################################################
# FUNCTION show_office_document(p_document,p_mode_verb) Opens wile in MS Office
#
#
#####################################################################
FUNCTION show_office_document(p_document, p_mode_verb)
  DEFINE p_document 	STRING
  DEFINE p_mode_verb STRING
  DEFINE l_client_doc_file_name STRING
  DEFINE l_server_doc_file_name STRING  
	DEFINE l_msg STRING
	
	######################################
	# XChrome with the Lycia Chrome extension/plugin AND Lycia Desktop
	# can access the local file system which we are going to demonstrate now
	######################################

	#Specify what file we want to download to what location 
	LET l_server_doc_file_name = "document/", trim(p_document)
	LET l_client_doc_file_name = get_client_temp_path(p_document)

	# If this would be used with a database, we retrieve the BLOB from the DB
	# and locate it's memory as file - this happens on the server
	# Download the file from the server to the client (drive)
  IF NOT fgl_download(l_server_doc_file_name, l_client_doc_file_name) THEN --client_temp_directory || "/" || p_document)
		CALL fgl_winmessage("Error","Could not download file","error")
	ELSE
		LET l_msg = "File ", l_server_doc_file_name, " was downloaded to ", l_client_doc_file_name
		MESSAGE l_msg
	END IF

  # Optionally, if the client side file editor allows this, 
	# we specify a verb (what should be done with the document)
  # In this example, we change/choose between print and open
	# function argument p_mode = "print" or "open"
	CALL fgl_set_property("gui","window.winshellexec.verb", p_mode_verb) 

  # Finally, we will execute the document on the client
  CALL winshellexec(l_client_doc_file_name) #execute the document name - 

	#####################################################################
	# We could optionally upload the file to the server	
	# We would also work with a DB/BLOB, we would now have the file on the server drive
	# and would need to push it back to the DB
	#####################################################################	

END FUNCTION
#####################################################################
# END FUNCTION show_office_document(p_document,p_mode) Opens wile in MS Office
#####################################################################


#####################################################################
# FUNCTION show_office_document2(p_document,p_mode) Opens wile in MS Office
#
#
#####################################################################
FUNCTION show_office_document2(p_document, p_mode)
  DEFINE p_document 	VARCHAR(64)
  DEFINE p_mode STRING
  DEFINE l_client_doc_file_name STRING
  DEFINE l_server_doc_file_name STRING  
  DEFINE tl_client_temp_directory STRING
	DEFINE tl_server_temp_directory STRING
	DEFINE l_file_edit_time_initial STRING
	DEFINE l_file_edit_time_modified STRING
	DEFINE l_choice CHAR(1)	
	DEFINE l_specified_file STRING
	######################################
	# XChrome with the Lycia Chrome extension/plugin AND Lycia Desktop
	# can access the local file system which we are going to demonstrate now
	######################################

	LET l_server_doc_file_name = "document/", trim(p_document)
	# If this would be used with a database, we retrieve the BLOB from the DB
	# and locate it's memory as file - this happens on the server
	

	# Download the file from the server to the client (drive)
  IF NOT fgl_download(l_server_doc_file_name, get_client_temp_path(p_document)) THEN --client_temp_directory || "/" || p_document)
		CALL fgl_winmessage("Error","Could not download file","error")
	END IF

  #Finally, we will execute the document on the client
	MESSAGE "Opening Document.. wait until your Desktop Document is closed"
  CALL winshellexec(get_client_temp_path(p_document)) #execute the document name - 


	LET l_specified_file = fgl_file_dialog("open","1","Select the file",get_client_temp_path(NULL),p_document,"*.*")
	DISPLAY "l_specified_file=", l_specified_file 


  # Optionally, if the client side file editor allows this, 
	# we specify a verb (what should be done with the document)
  # In this example, we change/choose between print and open
	# function argument p_mode = "print" or "open"
	CALL fgl_set_property("gui","window.winshellexec.verb", p_mode)

	#Get time stamp of the document on the client before opening it in the editor
	CALL os.Path.mtime(get_client_temp_path(p_document)) RETURNING l_file_edit_time_initial

  #Finally, we will execute the document on the client
	MESSAGE "Opening Document.. wait until your Desktop Document is closed"
  CALL winshellexecwait(get_client_temp_path(p_document)) #execute the document name - 

		#the associated file editor (file extension) will open the file
    #Optionally, document changed by this editor can be uploaded to the server
		#and stored in a BLOB

	#Compare the time stamp of before and after the editor opened the file
	#DISPLAY "get_client_temp_path(p_document)=", get_client_temp_path(p_document)
	CALL os.Path.mtime(get_client_temp_path(p_document)) RETURNING l_file_edit_time_modified
	#DISPLAY "l_file_edit_time_modified=", l_file_edit_time_modified 
	IF l_file_edit_time_initial = l_file_edit_time_modified THEN
		MESSAGE "Document was not modified by the client editor"
	ELSE
#		CALL fgl_winmessage("MODIFIED","Document was modified by the client editor")

		#Send the file (upload) back/up to the server
		LET l_choice = fgl_winbutton("Document was modified", "Do you want to upload this modified file to the server (DB) ?", "No", "Yes|No", "question", 1)
		IF l_choice = "Y" THEN
		  IF NOT fgl_upload(get_client_temp_path(p_document),l_server_doc_file_name) THEN
				CALL fgl_winmessage("Error","Could not upload the file","error")
			END IF
		END IF
	END IF	
	#####################################################################	
	#IF we would work with a DB/BLOB, we would now have the file on the server drive
	#and would need to push it back to the DB
	#####################################################################	

END FUNCTION
#####################################################################
# END FUNCTION show_office_document(p_document,p_mode) Opens wile in MS Office
#####################################################################


####################################################################################
# FUNCTION initTempPath()
#
# Initialise/Create/Retrieve the temp path locations for client and server access
# Client Cache and Working Directory 
# LD will use the local file system - Other client systems will use a temp folder located on the server to simulate a user-folder
####################################################################################
FUNCTION initTempPath()
	
  LET gl_client_temp_path = fgl_get_property("gui","system.file.client_temp","")	--only works with LD and Chrome with Lycia extension

  #check if directory exists on client system
  IF gl_client_temp_path IS NULL THEN
  	IF gl_clientType <> "lyciaweb" THEN	#Only LD client has got full local OS fileSystem access inc. temp director
    	CALL fgl_winmessage("LD Client temp folder is missing","Client Temp Directory not found","error")
    ELSE
			IF os.Path.exists(gl_client_temp_path) = FALSE THEN
    		CALL os.Path.mkdir("LyciaClientDemoTemp")
    		LET gl_client_temp_path = "LyciaClientDemoTemp"		
			END IF     
		END IF
  END IF

	#Server Temp Folder/Path
  LET gl_server_temp_path = fgl_getenv("TEMP")

  IF gl_server_temp_path IS NULL THEN
    LET gl_server_temp_path = "temp"
    
    IF os.Path.exists(gl_server_temp_path) = FALSE THEN 
    	CALL os.Path.mkdir("LyciaServerDemoTemp")
    	LET gl_server_temp_path = "LyciaServerDemoTemp"
    	CALL fgl_setenv("TEMP",gl_server_temp_path)
    END IF
  END IF


END FUNCTION
####################################################################################
# END FUNCTION initTempPath()
####################################################################################


####################################################################################
# FUNCTION get_client_temp_path(p_file_name)
#
# Create the full file path with the client temp path
####################################################################################
FUNCTION get_client_temp_path(p_file_name)
	DEFINE p_file_name STRING
	DEFINE l_ret_file_name_with_path STRING
	
	LET l_ret_file_name_with_path = trim(gl_client_temp_path),trim(p_file_name) 
	RETURN l_ret_file_name_with_path 
END FUNCTION
####################################################################################
# END FUNCTION get_client_temp_path(p_file_name)
####################################################################################


####################################################################################
# FUNCTION get_server_temp_path(p_file_name)
#
# Create the full file path with the client temp path
####################################################################################
FUNCTION get_server_temp_path(p_file_name)
	DEFINE p_file_name STRING
	DEFINE l_ret_file_name_with_path STRING
		
	LET l_ret_file_name_with_path = trim(gl_server_temp_path),trim(p_file_name) 
	RETURN l_ret_file_name_with_path 
END FUNCTION
####################################################################################
# END FUNCTION get_server_temp_path(p_file_name)
####################################################################################