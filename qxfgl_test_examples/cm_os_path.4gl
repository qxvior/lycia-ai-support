
DEFINE modu_log STRING
DEFINE modu_arr_file DYNAMIC ARRAY OF STRING

DEFINE dt_rec_op TYPE AS RECORD
	filePath STRING,
	fullPath STRING,
	baseName STRING,
	dirName STRING,
	extension STRING,
	aTime DATETIME YEAR TO SECOND,
	gid INTEGER, #Unix Group ID
	homedir STRING, #path to the HOME directory of the current user.
	exists BOOLEAN, #file/path does exists
	isDirectory BOOLEAN,
	isFile BOOLEAN,
	isHidden BOOLEAN,
	isLink BOOLEAN, #UNIX™ symbolic link.
	isRoot BOOLEAN,
	join STRING,
	makeTempName STRING,
	mTime DATETIME YEAR TO SECOND,
	pathSeparator CHAR,	#character to separate path in environments
	pathType STRING,
	pwd STRING,
	readable BOOLEAN,
	separator CHAR, #character used to separate path segments.
	size INTEGER, #size of a file
	rootDir STRING,	# root directory of the current working path.
	rootName STRING, #ile path without the file extension of the last element of the file path.
	rwx INTEGER, #Unix: combination of permissions for user, group and other
	type STRING, #file type as a string.
	uid INTEGER, #UNIX™ user id of a file.
	volumes STRING, #available volumes
	writable BOOLEAN, #if a file is writable
	hubert string
	END RECORD

DEFINE modu_rec_op OF dt_rec_op
	
MAIN
	DEFINE l_base_stringBuffer base.StringBuffer
	DEFINE l_position INTEGER
	DEFINE l_searchString STRING
	DEFINE l_line_no SMALLINT #display print line
	DEFINE l_index SMALLINT
	DEFINE l_index_end SMALLINT
	DEFINE l_length SMALLINT
	DEFINE l_char CHAR
	DEFINE l_string STRING		
	DEFINE l_msg STRING

#	DEFINE l_filePath STRING
	DEFINE l_filePath2 STRING
	DEFINE l_path STRING
	DEFINE l_path2 STRING
	DEFINE l_folder STRING
	DEFINE l_folder2 STRING

	DEFINE l_mode SMALLINT
	DEFINE l_status STRING
	DEFINE l_user_id SMALLINT
	DEFINE l_group_id SMALLINT	
	DEFINE l_folderHandleId INTEGER
	DEFINE l_fileHandleId INTEGER
  DEFINE l_sortCriteria STRING
	DEFINE l_sortOrder SMALLINT #1 or -1
	
	DEFINE i INTEGER
  DEFINE arr DYNAMIC ARRAY OF STRING
	DEFINE l_browse_path STRING
	DEFINE l_blobViewer BYTE 
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	DEFER INTERRUPT
	
	LOCATE l_blobViewer IN FILE "image/gd_animal_zebra.png"  #@vlad, needs checking
	CALL ui_init()

	OPEN WINDOW cm_os_path WITH FORM "form/cm_os_path"

	LET modu_rec_op.filePath = "icon24/flag_germany.png"
	CALL l_blobViewer.readFile(modu_rec_op.filePath)
	
	LET l_base_stringBuffer = base.StringBuffer.create()
	CALL l_base_stringBuffer.append("123Hubert likes to play with 32Hubert's demo test cases to show, that 73Hubert understands their usage and 111Hubertus")
	
	DISPLAY modu_rec_op.filePath TO filePath
	CALL update_file_properties_display(modu_rec_op.*)

	LET l_browse_path = trim(modu_rec_op.dirName), "/*"
	LET modu_arr_file = os.Path.glob(l_browse_path)

	DIALOG ATTRIBUTE(UNBUFFERED)

		#------------------------------------	
		DISPLAY ARRAY modu_arr_file TO file_list.* 		
			BEFORE ROW
				#DISPLAY "l_file_with_path=",trim(modu_arr_file[arr_curr()])
				CALL l_blobViewer.readFile(trim(modu_arr_file[arr_curr()]))
				CALL update_file_properties_display(modu_rec_op.*)
				
				
		END DISPLAY
		#------------------------------------
		INPUT l_blobViewer WITHOUT DEFAULTS FROM blobViewer 
		END INPUT
		#------------------------------------
		INPUT modu_rec_op.filePath WITHOUT DEFAULTS FROM filePath #ATTRIBUTE(UNBUFFERED)

			ON CHANGE filePath
				DISPLAY modu_rec_op.filePath TO filePath
				CALL update_file_properties_display(modu_rec_op.*)
				#browsing files in current folder
				LET l_browse_path = trim(modu_rec_op.dirName), "/*"
				#LET modu_arr_file = os.Path.glob("modu_rec_op.dirName/*")
				LET modu_arr_file = os.Path.glob(l_browse_path)
				
				DISPLAY ARRAY modu_arr_file TO file_list.* WITHOUT SCROLL
				END DISPLAY

						

				
		END INPUT   

		on action "os_path_glob" #os.Path.glob()qru
			LET modu_arr_file = os.Path.glob("object_cache/*/*/*/*")
			DISPLAY ARRAY modu_arr_file TO file_list.* WITHOUT SCROLL
			END DISPLAY
			
		ON ACTION "opATime" #os.Path.atime()
			LET modu_rec_op.aTime = os.Path.atime(modu_rec_op.filePath)
			DISPLAY modu_rec_op.aTime TO aTime
			LET l_msg = "os.Path.aTime(modu_rec_op.filePath)=", os.Path.atime(modu_rec_op.filePath)
			CALL fgl_winmessage("os.Path.aTime()",l_msg,"info")

		ON ACTION "opBaseName"
			LET modu_rec_op.baseName = os.Path.baseName(modu_rec_op.filePath)
			DISPLAY modu_rec_op.baseName TO baseName
			LET l_msg = "os.Path.baseName(modu_rec_op.filePath)=", os.Path.baseName(modu_rec_op.filePath)
			CALL fgl_winmessage("os.Path.baseName()",l_msg,"info")


		ON ACTION "opCopy"
			LET l_filePath2 =  modu_rec_op.filePath, "copy_"
			LET l_status =  os.Path.copy(modu_rec_op.filePath, l_filePath2) # RETURNS INTEGER
			LET l_msg = "File ", trim(modu_rec_op.filePath), " copied to ", trim(l_filePath2), "\nStatus=", trim(l_status)
			CALL fgl_winmessage("os.Path.copy(sourcePathFile,targetPathFile)",l_msg,"info")

		ON ACTION "opChDir"
			LET l_path2 = "/form"
			LET l_status =  os.Path.chDir(l_Path2) # RETURNS INTEGER
			LET l_msg = "Changed to folder ", trim(l_path2), "\nStatus:", trim(l_status)
			CALL fgl_winmessage("os.Path.chDir(path)",l_msg,"info")




		ON ACTION "opChVolume"
			LET l_status =  os.Path.chVolume("d:") # RETURNS INTEGER
			LET l_msg = "Changed Volume to drive d: \nStatus:", trim(l_status)
			CALL fgl_winmessage("os.Path.chVolume(filePath)",l_msg,"info")

		ON ACTION "opDelete"
			LET l_status =  os.Path.delete(modu_rec_op.filePath) # RETURNS INTEGER
			LET l_msg = "File ", trim(modu_rec_op.filePath), " was deleted from the file system\nStatus:", trim(l_status)
			CALL fgl_winmessage("os.Path.delete()",l_msg,"info")

		ON ACTION "opDirClose"
			LET l_folder = "icon24"
			LET l_status =  os.Path.DirClose(l_path) # RETURNS INTEGER
			LET l_msg = "Folder/Directory ", trim(l_folder), " was closed\nStatus:", trim(l_status)
			CALL fgl_winmessage("os.Path.dirClose()",l_msg,"info")

		ON ACTION "opDirFMask"
			LET l_folder = "icon24"
			LET l_mode = ( 1 + 2 + 4 )
			LET l_status =  os.Path.dirFMask(l_mode) # RETURNS INTEGER
			LET l_msg = "Applied mask ", trim(l_mode), " to Folder/Directory ", trim(l_folder), "\nStatus:", trim(l_status)
			CALL fgl_winmessage("os.Path.dirFMask()",l_msg,"info")

			#0x01 = Exclude hidden files (.*)
			#0x02 = Exclude directories
			#0x04 = Exclude symbolic links
			#0x08 = Exclude regular files
			#For example, to retrieve only regular files, you must use the argument 1+2+4

		ON ACTION "opDirName"
			LET modu_rec_op.dirName = os.Path.dirName(modu_rec_op.filePath)
			DISPLAY modu_rec_op.dirName TO dirName
			LET l_msg = "os.Path.dirName(modu_rec_op.filePath)=", os.Path.dirName(modu_rec_op.filePath)
			CALL fgl_winmessage("os.Path.dirName()",l_msg,"info")
			
		ON ACTION "opDirNext"
			LET l_folder = "icon24"
			LET l_fileHandleId = 1111
			LET l_mode = ( 1 + 2 + 4 )
			LET l_status =  os.Path.DirNext(l_mode) # RETURNS INTEGER
			LET l_msg = "Open Next Directory with handle ???? integer ", trim(l_fileHandleId), "\nStatus:", trim(l_status)
			CALL fgl_winmessage("os.Path.dirNext()",l_msg,"info")  

		ON ACTION "opDirOpen"
			#LET l_folderHandleId = "icon24"
			#LET l_mode = ( 1 + 2 + 4 )
			LET l_fileHandleId =  os.Path.DirOpen(modu_rec_op.filePath) # RETURNS INTEGER
			LET l_msg = "Open Directory ", trim(modu_rec_op.filePath), " and return handle ", trim(l_fileHandleId)
			CALL fgl_winmessage("os.Path.dirOpen()",l_msg,"info")  


		ON ACTION "opDirSort"	#Defines the sort criteria and sort order for os.Path.dirOpen().
			LET l_sortCriteria = "name" #criteria is the sort criteria.
			LET l_sortOrder = 1 #order defines ascending (1) or descending (-1) order.

			CALL  os.Path.DirSort(l_sortCriteria,l_sortOrder) # RETURNS INTEGER
			LET l_msg = "Sort Directory by criteria=", trim(l_sortCriteria), " and order = ", trim(l_sortOrder)
			CALL fgl_winmessage("os.Path.opDirSort()",l_msg,"info")  
			#When you call this function, you define the sort criteria and sort order for any subsequent os.Path.dirOpen() call.
			#
			#The criteria parameter must be one of the following strings:
			#
			#"undefined" = No sort. This is the default. Entries are read as returned by the OS functions.
			#"name" = Sort by file name.
			#"size" = Sort by file size.
			#"type" = Sort by file type (directory, link, regular file).
			#"atime" = Sort by access time.
			#"mtime" = Sort by modification time.
			#"extension" = Sort by file extension.

		ON ACTION "opExecutable"
			LET l_status =  os.Path.executable(modu_rec_op.filePath) # RETURNS INTEGER
			LET l_msg = "Folder ", trim(modu_rec_op.filePath), " isOpen Next Directory with handle ???? integer ", trim(l_fileHandleId), "\nStatus:", trim(l_status)
			CALL fgl_winmessage("os.Path.dirNext()",l_msg,"info")  

		ON ACTION "opExists"
			LET l_status =  os.Path.executable(modu_rec_op.filePath) # RETURNS INTEGER(BOOLEAN TRUE/FALSE
			LET l_msg = "File ", trim(modu_rec_op.filePath), " exists = ", trim(l_status)
			CALL fgl_winmessage("os.Path.exists()",l_msg,"info")  

		ON ACTION "opExtension"
			LET modu_rec_op.extension =  os.Path.extension(modu_rec_op.filePath) # RETURNS INTEGER(BOOLEAN TRUE/FALSE
			LET l_msg = "File ", trim(modu_rec_op.filePath), " has got the file extension = ", trim(modu_rec_op.extension)
			CALL fgl_winmessage("os.Path.extension()",l_msg,"info")  

		ON ACTION "opFullPath"
			LET modu_rec_op.fullPath =  os.Path.fullPath(modu_rec_op.filePath) # RETURNS INTEGER(BOOLEAN TRUE/FALSE
			LET l_msg = "File ", trim(modu_rec_op.filePath), " has got the full path ", trim(modu_rec_op.fullPath)
			CALL fgl_winmessage("os.Path.fullPath()",l_msg,"info")  




		ON ACTION "opHomeDir" 
			LET modu_rec_op.homeDir =  os.Path.homeDir() 
			LET l_msg = "Home Directory: ", trim(modu_rec_op.homeDir)   
			CALL fgl_winmessage("os.Path.homeDir()",l_msg,"info")  

		ON ACTION "opIsDirectory"	#Checks if a file is a directory.
			LET modu_rec_op.isDirectory =  os.Path.isDirectory(modu_rec_op.filePath) # RETURNS INTEGER
			LET l_msg = trim(modu_rec_op.filePath), " is a Directory = ", trim(modu_rec_op.isDirectory)
			CALL fgl_winmessage("os.Path.isDirectory()",l_msg,"info")  

		ON ACTION "opIsFile"	#Checks if a file is a directory.
			LET modu_rec_op.isFile =  os.Path.isFile(modu_rec_op.filePath) # RETURNS INTEGER
			LET l_msg = trim(modu_rec_op.filePath), " is a File = ", trim(modu_rec_op.isFile)
			CALL fgl_winmessage("os.Path.isFile()",l_msg,"info") 

		ON ACTION "opIsHidden"	#Checks if a file is hidden
			LET modu_rec_op.isHidden =  os.Path.isHidden(modu_rec_op.filePath) # RETURNS INTEGER
			LET l_msg = trim(modu_rec_op.filePath), " is Hidden = ", trim(modu_rec_op.isHidden)
			CALL fgl_winmessage("os.Path.isHidden()",l_msg,"info") 


		ON ACTION "opIsRoot"	#Checks if a file is hidden
			LET modu_rec_op.isRoot =  os.Path.isRoot(modu_rec_op.filePath) # RETURNS INTEGER
			LET l_msg = trim(modu_rec_op.filePath), " is a Link = ", trim(modu_rec_op.isRoot)
			CALL fgl_winmessage("os.Path.isRoot()",l_msg,"info") 

		ON ACTION "opJoin"
			LET l_folder = "someParentFolder"
			LET l_folder2 =  "someSubFolder"
			LET modu_rec_op.join =  os.Path.join(l_folder, l_folder2) # RETURNS joined path
			LET l_msg = "Joined ", trim(l_folder), " with ", trim(l_folder2), " to form ", trim(modu_rec_op.join)
			CALL fgl_winmessage("os.Path.copy(sourcePathFile,targetPathFile)",l_msg,"info")

		#		ON ACTION "opMakeTempName"	#Checks if a file is hidden
		#			LET modu_rec_op.makeTempName =  os.Path.makeTempName(modu_rec_op.filePath) # RETURNS INTEGER
		#  		LET l_msg = trim(modu_rec_op.filePath), " is a Link = ", trim(modu_rec_op.makeTempName)
		#  		CALL fgl_winmessage("os.Path.makeTempName()",l_msg,"info") 

		ON ACTION "opMTime"	#Last modified date/time
			LET modu_rec_op.mTime =  os.Path.mTime(modu_rec_op.filePath) # RETURNS INTEGER
			LET l_msg = trim(modu_rec_op.filePath), " was last modified on/at = ", trim(modu_rec_op.mTime)
			CALL fgl_winmessage("os.Path.mTime()",l_msg,"info") 

		ON ACTION "opMkDir"
			#LET l_folder = 
			DISPLAY os.path.mkDir(fgl_winprompt(5, 5, "Enter the new folder name", "", 25, 0))

		ON ACTION "opPathSeparator"	#OS Separator to join path in the environment files
			LET modu_rec_op.pathSeparator =  os.Path.pathSeparator() # RETURNS CHAR
			LET l_msg = "Path Separator (to join in environments) = ", trim(modu_rec_op.pathSeparator)
			CALL fgl_winmessage("os.Path.pathSeparator()",l_msg,"info") 
				
		ON ACTION "opPathType"	#Path type relative or absolute
			LET modu_rec_op.pathType =  os.Path.pathType(modu_rec_op.filePath) # RETURNS INTEGER
			LET l_msg = trim(modu_rec_op.filePath), " is of pathType = ", trim(modu_rec_op.pathType) 
			CALL fgl_winmessage("os.Path.pathType()",l_msg,"info") 

		ON ACTION "opPwd"	#current working directory
			LET modu_rec_op.pwd =  os.Path.pwd() # RETURNS current working directory
			LET l_msg = "The current working directory = ", trim(modu_rec_op.pwd) 
			CALL fgl_winmessage("os.Path.pwd()",l_msg,"info") 

		ON ACTION "opReadable"	#checks if file is readable
			LET modu_rec_op.readable =  os.Path.readable(modu_rec_op.filePath) # RETURNS boolean if file is readable
			LET l_msg = "Is the file ", trim(modu_rec_op.filePath),  " readable: ",  trim(modu_rec_op.readable) 
			CALL fgl_winmessage("os.Path.readable()",l_msg,"info") 

		ON ACTION "opRename"
			LET l_filePath2 =  modu_rec_op.filePath, "copy_"
			LET l_status =  os.Path.rename(modu_rec_op.filePath, l_filePath2) # RETURNS INTEGER
			LET l_msg = "File ", trim(modu_rec_op.filePath), " renamed to ", trim(l_filePath2), "\nStatus=", trim(l_status)
			CALL fgl_winmessage("os.Path.rename(sourcePathFile,targetPathFile)",l_msg,"info")

		ON ACTION "opSeparator"	#OS path separator
			LET modu_rec_op.Separator =  os.Path.Separator() # RETURNS CHAR
			LET l_msg = "Path Separator  = ", trim(modu_rec_op.Separator)
			CALL fgl_winmessage("os.Path.Separator()",l_msg,"info") 

		ON ACTION "opSize"	# size of a file
			LET modu_rec_op.size =  os.Path.size(modu_rec_op.filePath) # RETURNS boolean if file is size
			LET l_msg = "Is the file ", trim(modu_rec_op.filePath),  " size: ",  trim(modu_rec_op.size) 
			CALL fgl_winmessage("os.Path.size()",l_msg,"info") 

		ON ACTION "opRootDir"	#root directory of the current working path.
			LET modu_rec_op.rootDir =  os.Path.rootDir() # RETURNS CHAR
			LET l_msg = "RootDir  = ", trim(modu_rec_op.rootDir)
			CALL fgl_winmessage("os.Path.rootDir()",l_msg,"info") 

		ON ACTION "opRootName"	# ile path without the file extension of the last element of the file path.
			LET modu_rec_op.rootName =  os.Path.rootName(modu_rec_op.filePath) # RETURNS boolean if file is rootName
			LET l_msg = "The file ", trim(modu_rec_op.filePath),  " has the rootName path: ",  trim(modu_rec_op.rootName) 
			CALL fgl_winmessage("os.Path.rootName()",l_msg,"info")  		


		ON ACTION "opType"	#	type STRING, #file type as a string.
			LET modu_rec_op.type =  os.Path.type(modu_rec_op.filePath) # RETURNS boolean if file is type
			LET l_msg = "The file ", trim(modu_rec_op.filePath),  " is of type: ",  trim(modu_rec_op.type) 
			CALL fgl_winmessage("os.Path.type()",l_msg,"info")  		

		ON ACTION "opVolumes"	#	volumes STRING, #available volumes
			LET modu_rec_op.volumes =  os.Path.volumes() # RETURNS boolean if file is volumes
			LET l_msg = "Following voumes are avilable: ",  trim(modu_rec_op.volumes) 
			CALL fgl_winmessage("os.Path.volumes()",l_msg,"info")  		

		ON ACTION "opWritable"	# file is writable true/false
			LET modu_rec_op.writable =  os.Path.writable(modu_rec_op.filePath) # RETURNS boolean if file is writable
			LET l_msg = "The file ", trim(modu_rec_op.filePath),  " has the read/write/executable property value: ",  trim(modu_rec_op.writable) 
			CALL fgl_winmessage("os.Path.writable()",l_msg,"info")  		

		#UNIX ---------------------------------------  

			
		ON ACTION "opChRwx" #Changes the UNIX™ permissions of a file.
			LET l_mode = 420
			LET l_status =  os.Path.chRwx(modu_rec_op.filePath,l_mode) # RETURNS INTEGER
			LET l_msg = "Changed file permission for  ", trim(modu_rec_op.filePath), "to Mode ", trim(l_mode), "\nStatus:", trim(l_status)
			CALL fgl_winmessage("os.Path.chRwx(filePath)",l_msg,"info")

		ON ACTION "opChOwn"
			LET l_user_id = 1111
			LET l_group_id = 1111
			LET l_status =  os.Path.chOwn(modu_rec_op.filePath,l_user_id,l_group_id) # RETURNS INTEGER
			LET l_msg = "Changed file permission for  ", trim(modu_rec_op.filePath), "\nStatus:", trim(l_status)
			CALL fgl_winmessage("os.Path.chOwn(filePath,user_id,group_id)",l_msg,"info")

		ON ACTION "opGid" #Unix: Returns the UNIX™ group id of a file.-1 = failure
			LET modu_rec_op.gid =  os.Path.gid(modu_rec_op.filePath) # RETURNS INTEGER -1 = failed
			LET l_msg = "File ", trim(modu_rec_op.filePath), " has got the Unix group id ", trim(modu_rec_op.gid)  
			CALL fgl_winmessage("os.Path.gid()",l_msg,"info")  

		ON ACTION "opUID"	# #	uid INTEGER, #UNIX™ user id of a file.
			LET modu_rec_op.uid =  os.Path.uid(modu_rec_op.filePath) # RETURNS boolean if file is uid
			LET l_msg = "The file ", trim(modu_rec_op.filePath),  " has the read/write/executable property value: ",  trim(modu_rec_op.uid) 
			CALL fgl_winmessage("os.Path.uid()",l_msg,"info")  		

		ON ACTION "opRWX"	# ile path without the file extension of the last element of the file path.
			LET modu_rec_op.rwx =  os.Path.rwx(modu_rec_op.filePath) # RETURNS boolean if file is rwx
			LET l_msg = "The file ", trim(modu_rec_op.filePath),  " has the read/write/executable property value: ",  trim(modu_rec_op.rwx) 
			CALL fgl_winmessage("os.Path.rwx()",l_msg,"info")  		

		ON ACTION "opIsLink"	#UNIX™ symbolic link.
			LET modu_rec_op.isLink =  os.Path.isLink(modu_rec_op.filePath) # RETURNS INTEGER
			LET l_msg = trim(modu_rec_op.filePath), " is a Link = ", trim(modu_rec_op.isLink)
			CALL fgl_winmessage("os.Path.isLink()",l_msg,"info") 
					
		#---------------------------------------  
		ON ACTION "HELP"
			CALL onlineHelp("OsPath",NULL)

		ON ACTION CANCEL
			EXIT DIALOG #INPUT

		AFTER DIALOG
			IF NOT int_flag THEN
				CONTINUE DIALOG
			END IF

	END DIALOG

	CLOSE WINDOW cm_os_path
END MAIN
 

FUNCTION display_modu_log()
	DISPLAY modu_log TO log_area
END FUNCTION

FUNCTION append_modu_log(p_string)
	DEFINE p_string STRING
	LET modu_log = modu_log, "\n", p_string
	CALL display_modu_log()
END FUNCTION

FUNCTION update_file_properties_display(p_rec_op)
	DEFINE p_rec_op OF dt_rec_op
	DEFINE l_folder STRING
	DEFINE l_folder2 STRING
		
	#PS: doubled done... just for demo purpose...	
	LET modu_rec_op.aTime = os.Path.atime(p_rec_op.filePath)
	DISPLAY modu_rec_op.aTime TO aTime

	LET modu_rec_op.baseName = os.Path.baseName(p_rec_op.filePath) 
	DISPLAY modu_rec_op.baseName TO baseName

	LET modu_rec_op.dirName = os.Path.dirName(p_rec_op.filePath)
	DISPLAY modu_rec_op.dirName TO dirName

	LET modu_rec_op.extension = os.Path.extension(p_rec_op.filePath) 
	DISPLAY modu_rec_op.extension TO extension

	LET modu_rec_op.fullPath =  os.Path.fullPath(p_rec_op.filePath)
	DISPLAY modu_rec_op.fullPath TO fullPath

	LET modu_rec_op.homeDir =  os.Path.homeDir() #Returns the path to the HOME directory of the current user.
	DISPLAY modu_rec_op.homeDir TO homeDir

	LET modu_rec_op.exists =  os.Path.exists(p_rec_op.filePath) 	#Checks if a file/path exists
#	DISPLAY modu_rec_op.exists TO exists

	LET modu_rec_op.isDirectory =  os.Path.isDirectory(p_rec_op.filePath) 	#Checks if a file/path is a directory.
	DISPLAY modu_rec_op.isDirectory TO isDirectory

	LET modu_rec_op.isFile =  os.Path.isFile(p_rec_op.filePath) 	#Checks if a file/path is a file.
	DISPLAY modu_rec_op.isFile TO isFile

	LET modu_rec_op.isHidden =  os.Path.isFile(p_rec_op.filePath) 	#Checks if a file/path is hidden.
	DISPLAY modu_rec_op.isHidden TO isHidden

	LET modu_rec_op.isRoot =  os.Path.isFile(p_rec_op.filePath) 	#Checks if a file/path is root.
	DISPLAY modu_rec_op.isRoot TO isRoot

	LET l_folder = "someParentFolder"
	LET l_folder2 =  "someSubFolder"
	LET modu_rec_op.join =  os.Path.join(l_folder, l_folder2) # RETURNS joined path
	DISPLAY modu_rec_op.join TO join

#Needs implementing
#	LET modu_rec_op.makeTempName =  os.Path.makeTempName(p_rec_op.filePath) 	#Checks if a file/path is root.
#	DISPLAY modu_rec_op.makeTempName TO makeTempName

	LET modu_rec_op.mTime =  os.Path.mTime(p_rec_op.filePath) 	#Checks if a file/path is root.
	DISPLAY modu_rec_op.mTime TO mTime

	LET modu_rec_op.pathSeparator =  os.Path.pathSeparator() 	#environment joining separator
	DISPLAY modu_rec_op.pathSeparator TO pathSeparator

	LET modu_rec_op.pathType =  os.Path.pathType(p_rec_op.filePath) 	#absolute or relative path 
	DISPLAY modu_rec_op.pathType TO pathType

	LET modu_rec_op.pwd =  os.Path.pwd() 	#Current working directory
	DISPLAY modu_rec_op.pwd TO pwd

	LET modu_rec_op.readable =  os.Path.readable(p_rec_op.filePath) 	#Checks if a file/path is hidden.
	DISPLAY modu_rec_op.readable TO readable

	LET modu_rec_op.size =  os.Path.size(p_rec_op.filePath) 	#file size
	DISPLAY modu_rec_op.size TO size

	LET modu_rec_op.rootDir =  os.Path.rootDir() 	#rootDir STRING,	# root directory of the current working path.
	DISPLAY modu_rec_op.rootDir TO rootDir

	LET modu_rec_op.rootName =  os.Path.rootName(p_rec_op.filePath) 	#file path without the file extension of the last element of the file path.
	DISPLAY modu_rec_op.rootName TO rootName
	
	LET modu_rec_op.rwx =  os.Path.rwx(p_rec_op.filePath) 	#file path without the file extension of the last element of the file path.
	DISPLAY modu_rec_op.rwx TO rwx

	#type STRING, #file type as a string.
	LET modu_rec_op.type =  os.Path.type(p_rec_op.filePath)
	DISPLAY modu_rec_op.type TO type


	#volumes STRING, #available volumes
	LET modu_rec_op.volumes =  os.Path.volumes() 	
	DISPLAY modu_rec_op.volumes TO volumes

	#writable BOOLEAN, #if a file is writable
	LET modu_rec_op.writable =  os.Path.writable(p_rec_op.filePath) 	
	DISPLAY modu_rec_op.writable TO writable

		
	#Unix --------------------------
	#UNIX™ symbolic link.
	LET modu_rec_op.isLink =  os.Path.isLink(p_rec_op.filePath) 	#Checks if a file/path is a link (unix only)
	DISPLAY modu_rec_op.isLink TO isLink

	#uid INTEGER, #UNIX™ user id of a file.
	LET modu_rec_op.uid =  os.Path.uid(p_rec_op.filePath) 	
	DISPLAY modu_rec_op.uid TO uid


	LET modu_rec_op.gid =  os.Path.gid(p_rec_op.filePath)
	DISPLAY modu_rec_op.gid TO gid
	
END FUNCTION			